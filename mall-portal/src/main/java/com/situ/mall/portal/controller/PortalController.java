package com.situ.mall.portal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.bean.Category;
import com.situ.mall.common.ServerResponse;
import com.situ.mall.service.ICategoryService;
import com.situ.mall.service.IProductService;

@Controller
public class PortalController {

	@Autowired
	private IProductService productService;

	@Autowired
	private ICategoryService categoryService;

	// 门户首页
	@RequestMapping("/index")
	public String index(Model model) {
		// List<String> topCategoryNameList=productService.getTopCategoryName();
		// 将查询到的一级分类添加到域对象中，以方便首页中使用
		ServerResponse<Category> topCategory = categoryService.selectTopCategory();
		
		List<Category> dataList = (List<Category>) topCategory.getData(); 
		model.addAttribute("topDataList", dataList);//把一级分类添加到域中
		System.out.println("topDataList: " + dataList);
		List<Category> secondCategoryList=categoryService.selectSecondCategoryList();
		System.out.println("secondCategoryList"+secondCategoryList);
		model.addAttribute("secondCategoryList", secondCategoryList);
		
		return "index";
	}
	
	//
}
