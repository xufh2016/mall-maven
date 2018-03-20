package com.situ.mall.portal.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.bean.Product;
import com.situ.mall.service.IProductService;
import com.situ.mall.vo.ProductSearchCondition;

@Controller
@RequestMapping("/product")
public class PortalProductController {

	@Autowired
	private IProductService productService;

	@RequestMapping("/getProductListPage")
	public String getProductListPage(Integer categoryId, Model model) {

		List<Product> productList = productService.selectProductsByParentId(categoryId);
		model.addAttribute("productList", productList);
		return "product_list_page";
	}

	// 商品详情页
	@RequestMapping("/detail")
	public String getProductDetail(Integer productId, Model model) {
		Product product = productService.selectProductByPrimaryKey(productId);
		// 将查询出来的商品存到域对象中
		model.addAttribute("product", product);
		String subImages = product.getSubImages();
		String[] strings = subImages.split(",");
		model.addAttribute("subImages", strings);
		return "detail";
	}

	// 获取商品的库存量
	@RequestMapping("/getProductStock")
	@ResponseBody
	// 将Integer的返回值转换为json格式
	public Map<String, Integer> getProductStock(Integer productId) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		Integer productStock = productService.getProductStock(productId);
		map.put("stock", productStock);
		System.out.println("productStock  :  " + productStock);
		return map;
	}

	@RequestMapping("/searchProduct")
	// @ResponseBody ServerResponse
	public String searchProduct(ProductSearchCondition sc_name, Model model) {
		List<Product> productList = productService.searchProduct(sc_name);
		model.addAttribute("productList", productList);
		if (null != productList && productList.size() != 0) {
			return "product_list_page";
			// return ServerResponse.createSuccess("查询成功", productList);
		}
		// return ServerResponse.createError("查询失败");
		return "";
	}
}
