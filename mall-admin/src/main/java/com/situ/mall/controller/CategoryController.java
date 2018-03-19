package com.situ.mall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping("/dataAnalysis")
	@ResponseBody
	public ServerResponse dataAnalysis() {
		System.out.println("dataAnalysis");
		return categoryService.dataAnalysis();
	}
	
	@RequestMapping("/circleDataAnalysis")
	@ResponseBody
	public ServerResponse circleDataAnalysis() {
		System.out.println("dataAnalysis");
		return categoryService.dataAnalysis();
	}
	
	@RequestMapping("/getDataAnalysisPage")
	public String getDataAnalysisPage() {
		return "data_analysis_page";
	}
	
	@RequestMapping("/getCircleDataAnalysisPage")
	public String getCircleDataAnalysisPage() {
		return "circle_data_analysis_page";
	}
	
	//商品分类列表
	@RequestMapping("/getCategoryPage")
	public String getCategoryPage(Model model) {
		ServerResponse<Category> topCategory = categoryService.selectTopCategory();
		List<Category> dataList = (List<Category>) topCategory.getData(); 
		model.addAttribute("topDataList", dataList);//把一级分类添加到域中
		System.out.println("topDataList: " + dataList);
		List<Category> secondCategoryList=categoryService.selectSecondCategoryList();
		System.out.println("secondCategoryList"+secondCategoryList);
		model.addAttribute("secondCategoryList", secondCategoryList);
		return "category_page";
	}
}
