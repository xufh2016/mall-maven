package com.situ.mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.bean.Category;
import com.situ.mall.common.ServerResponse;
import com.situ.mall.service.ICategoryService;

@Controller
@RequestMapping("/category")
public class CategoryController {
	
	@Autowired
	private ICategoryService categoryService;

	//一级分类
	@RequestMapping("/selectTopCategory")
	@ResponseBody
	public ServerResponse<Category> selectTopCategory() {
		
		return categoryService.selectTopCategory();
	}
	
	//二级分类
	@RequestMapping("/selectSecondCategory")
	@ResponseBody
	public ServerResponse<Category> selectSecondCategory(Integer topCategoryId) {
		
		return categoryService.selectSecondCategory(topCategoryId);
	}
}
