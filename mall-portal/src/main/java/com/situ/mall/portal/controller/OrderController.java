package com.situ.mall.portal.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.bean.OrderItem;
import com.situ.mall.bean.Orders;
import com.situ.mall.bean.Product;
import com.situ.mall.bean.Shipping;
import com.situ.mall.bean.User;
import com.situ.mall.common.ServerResponse;
import com.situ.mall.constant.Const;
import com.situ.mall.portal.tool.CookieJsonConversion;
import com.situ.mall.portal.vo.CartItemVO;
import com.situ.mall.portal.vo.CartVO;
import com.situ.mall.service.IOrderItemService;
import com.situ.mall.service.IOrderService;
import com.situ.mall.service.IProductService;
import com.situ.mall.service.IShoppingService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private IProductService productService;
	@Autowired
	private IShoppingService shoppingService;

	@Autowired
	private IOrderService orderService;

	@Autowired
	private IOrderItemService orderItemService;

	// 跳转到订单选择页
	@RequestMapping("/getOrderPage")
	public String getOrderPage(HttpServletRequest request, Model model, HttpSession session) {
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		if (null != user) {
			Integer userId = user.getId();
			List<Shipping> shippingList = shoppingService.selectShippingInfoByuserId(userId);
			// 将订单项放到域对象中
			model.addAttribute("shippingList", shippingList);
		}

		Product product = null;
		CartVO cartVO = CookieJsonConversion.cookieToObject(request);
		List<CartItemVO> cartItemList = cartVO.getCartItemList();
		Iterator<CartItemVO> iterator = cartItemList.iterator();
		while (iterator.hasNext()) {
			CartItemVO cartItem = (CartItemVO) iterator.next();
			// 将没有勾选的cartItem移除
			if (cartItem.getCheckStatus() == Const.CateItemCheckStatus.UNCHECKED) {
				iterator.remove();
			}
			if (cartItem.getCheckStatus() == Const.CateItemCheckStatus.CHECKED) {
				product = productService.selectProductByPrimaryKey(cartItem.getProduct().getId());
				cartItem.setProduct(product);
			}
		}
		// 将cartVO存到域对象中，以便页面中使用
		model.addAttribute("cartVO", cartVO);
		return "prepareorder";
	}

	// 生成订单
	@RequestMapping("/addOrder")
	@ResponseBody
	public ServerResponse addOrder(Integer shippingId, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {
		int itemLine = 0;
		int line = 0;
		// 获取用户信息
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		Orders order = new Orders();
		order.setShippingId(shippingId);
		order.setUserId(user.getId());
		// 生成订单号
		long millis = System.currentTimeMillis();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date(millis);
		long orderNo = Long.parseLong(simpleDateFormat.format(date));
		order.setOrderNo(orderNo);
		line = orderService.add(order);// 将订单添加到数据库中
		System.out.println("orderNo:" + orderNo);
		// 再从个cookie中得到cartVO
		CartVO cartVO = CookieJsonConversion.cookieToObject(request);
		List<CartItemVO> cartItemList = cartVO.getCartItemList();
		if (null != cartItemList && cartItemList.size() != 0) {
			for (CartItemVO cartItem : cartItemList) {
				// 只将被选中的商品加入订单项中
				if (cartItem.getCheckStatus() == Const.CateItemCheckStatus.CHECKED) {
					OrderItem orderItem = new OrderItem();
					orderItem.setOrderNo(order.getOrderNo());
					orderItem.setUserId(user.getId());
					Product product = productService.selectProductByPrimaryKey(cartItem.getProduct().getId());
					orderItem.setProductId(cartItem.getProduct().getId());
					orderItem.setCurrentUnitPrice(product.getPrice());
					orderItem.setProductName(product.getName());
					itemLine = orderService.addOrderItem(orderItem);
				}
			}
			// 将cookie中被选中的商品删除
			Iterator<CartItemVO> iterator = cartItemList.iterator();
			while (iterator.hasNext()) {
				CartItemVO cartItemVO = iterator.next();
				if (cartItemVO.getCheckStatus() == Const.CateItemCheckStatus.CHECKED) {
					iterator.remove();
				}
			}
		}
		// 最后再将cartVO中cratItemVO没有被选中的商品写进cookie中,以方便下次请求时直接得到
		CookieJsonConversion.objectToJson(response, cartVO);
		if (line > 0 && itemLine > 0)
			return ServerResponse.createSuccess("success");
		else
			return ServerResponse.createError();
	}

	// 订单页
	@RequestMapping("/comfirmOrder")
	public String comfirmOrder(HttpSession session, Model model) {
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		Integer userId = user.getId();
		// 根据用户Id获得该用户的所有订单信息(order表中)
//		orderService.selectTowCategory
		List<Orders> orderList = orderService.selectOrdersByUserid(userId);
		// 根据用户id获取该用户的所有订单项（orderItem表）
		List<OrderItem> orderItemList = orderItemService.selectItemsByUserid(userId);
		//通过用户名得到shipping集合，遍历集合获取shipping_id，然后再得到接货人信息
		//List<Shipping> shippings = shoppingService.selectShippingInfoByuserId(userId);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("orderItemList", orderItemList);
		return "dingdan";
	}
}
