package com.situ.mall.portal.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.bean.Product;
import com.situ.mall.common.ServerResponse;
import com.situ.mall.constant.Const;
import com.situ.mall.portal.tool.CookieJsonConversion;
import com.situ.mall.portal.vo.CartItemVO;
import com.situ.mall.portal.vo.CartVO;
import com.situ.mall.service.IProductService;

@Controller
@RequestMapping("/cart")
public class CartController {

	// private String CART_COOKIE = "cartCookie";

	@Autowired
	private IProductService productService;

	@RequestMapping("/getCartPage")
	public String getCartPage(HttpServletRequest request, Model model) {
		CartVO cartVo = CookieJsonConversion.cookieToObject(request);
		// CartVO cartVo = getCartVoFromCookie(request);
		// 2、将cookie里面所有的商品查询出来，转换成Cart这个对象
		Product product = null;
		if (cartVo != null) {
			List<CartItemVO> cartItemList = cartVo.getCartItemList();
			for (CartItemVO item : cartItemList) {
				product = productService.selectProductByPrimaryKey(item.getProduct().getId());
				item.setProduct(product);
			}
			model.addAttribute("cartVo", cartVo);
		}
		return "cart";
	}

	@RequestMapping("/deleteCartItemById")
	@ResponseBody
	public ServerResponse deleteCartItemById(Integer productId, HttpServletRequest request,
			HttpServletResponse respone) {
		// 1、既然是要删除购物项，那么cookie中肯定存储了cartcookie信息，因此需要以下步骤
		// 1.1先从cookie中得到cartvo
		CartVO cartVo = CookieJsonConversion.cookieToObject(request);
		// 1.2 判断cookie中的cartVO是否为空，如果为空，返回错误信息
		if (null == cartVo) {
			return ServerResponse.createError("获取购物车失败");
		}
		// 1.3如果不为空，遍历cartVo中的Item，筛选出于productId相同的项，进行删除
		List<CartItemVO> cartItemList = cartVo.getCartItemList();
		Iterator<CartItemVO> iterator = cartItemList.iterator();
		while (iterator.hasNext()) {
			CartItemVO cartItem = iterator.next();
			if (productId.intValue() == cartItem.getProduct().getId().intValue()) {
				iterator.remove();
				break;
			}
		}
		// 2、将cartVo重新转为json，并存储到cookie中
		CookieJsonConversion.objectToJson(respone, cartVo);
		return ServerResponse.createSuccess("删除购物车成功");
	}

	@RequestMapping("/addOrUpdateCart")
	@ResponseBody
	public ServerResponse addOrUpdateCart(Integer productId, Boolean isChecked, Integer amount,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		// 将Cookie里面的购物车转换为CartVo对象
		CartVO cartVo = CookieJsonConversion.cookieToObject(request);
		// 原来cookie中没有购物车，所以转换为的CartVo是null。
		if (cartVo == null) {
			cartVo = new CartVO();
		}

		boolean result = addOrUpdateCarVo(productId, amount, isChecked, cartVo);
		if (result == false) {
			return ServerResponse.createError("添加购物车失败");
		}
		CookieJsonConversion.objectToJson(response, cartVo);
		return ServerResponse.createSuccess("添加购物车成功");
	}

	private boolean addOrUpdateCarVo(Integer productId, Integer amount, Boolean isChecked, CartVO cartVo) {
		// Product productTemp = productService.selectProductByPrimaryKey(productId);
		boolean isExist = false;
		// 1、将要加入购物车的商品productId和amount插入cookie
		// 1.2 这个商品cookie里面没有，创建然后插入
		List<CartItemVO> cartItemVos = cartVo.getCartItemList();
		for (CartItemVO item : cartItemVos) {
			// 1.1 这个商品cookie里面已经有了，根据productId找到这件商品，更新数量即可
			if (item.getProduct().getId().intValue() == productId.intValue()) {
				isExist = true;
				if (amount != null) {
					// 这个商品新的数量=原来购物车中这个商品数量+新添加这个商品的数量
					int newAmount = item.getAmount() + amount;
					item.setAmount(newAmount);
				}
				// 更新选择状态
				if (isChecked != null) {
					if (isChecked) {
						item.setCheckStatus(Const.CateItemCheckStatus.CHECKED);
					} else {
						item.setCheckStatus(Const.CateItemCheckStatus.UNCHECKED);
					}
				}
				return true;// 更新完这个商品数量后，后面的就不需要遍历
			}
		}
		// 如果原来的购物车中就没有这件商品，ze直接添加
		if (isExist == false) {
			CartItemVO cartItemVo = new CartItemVO();
			Product product = new Product();
			// 给商品 设置Id属性
			product.setId(productId);
			cartItemVo.setProduct(product);
			cartItemVo.setCheckStatus(Const.CateItemCheckStatus.CHECKED);
			cartItemVo.setAmount(amount);
			cartItemVos.add(cartItemVo);
			return true;
		}
		return false;
	}
}
