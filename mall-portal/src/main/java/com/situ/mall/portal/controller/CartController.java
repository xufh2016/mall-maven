package com.situ.mall.portal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.bean.Product;
import com.situ.mall.service.ICategoryService;
import com.situ.mall.service.IProductService;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private IProductService productService;

	@Autowired
	private ICategoryService categoryService;

	@RequestMapping("/getCartPage")
	public String  getCartPage(Integer productId,Integer amount,Model model) {
		
		Product product = productService.selectProductByPrimaryKey(productId);
		
		return "cart";
	}
}
