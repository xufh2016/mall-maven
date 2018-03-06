package com.situ.mall.portal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.bean.Product;
import com.situ.mall.service.ICategoryService;
import com.situ.mall.service.IProductService;

@Controller
@RequestMapping("/product")
public class PortalProductController {

	@Autowired
	private IProductService productService;

	@Autowired
	private ICategoryService categoryService;

	@RequestMapping("/getProductListPage")
	public String getProductListPage(Integer categoryId, Model model) {

		List<Product> productList = productService.selectProductsByParentId(categoryId);
		System.out.println("productList---------->" + productList);
		model.addAttribute("productList", productList);
		return "product_list_page";
	}

	// 商品详情页
	@RequestMapping("/detail")
	public String getProductDetail(Integer productId, Model model) {
		Product product = productService.selectProductByPrimaryKey(productId);
		// 将查询出来的商品存到域对象中
		model.addAttribute("product", product);
		System.out.println("product======================" + product);
		String subImages = product.getSubImages();
		String[] strings = subImages.split(",");
		System.out.println("subImages------------------"+subImages);
		model.addAttribute("subImages", strings);
		return "detail";
	}
}
