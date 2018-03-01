package com.situ.mall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.bean.Category;
import com.situ.mall.common.ServerResponse;
import com.situ.mall.mapper.CategoryMapper;
import com.situ.mall.service.ICategoryService;

@Service
public class CategoryServiceImpl implements ICategoryService {
	@Autowired
	private CategoryMapper categoryMapper;

	@Override
	public ServerResponse selectTopCategory() {
		// TODO Auto-generated method stub
		List<Category> list = categoryMapper.selectTopCategory();
		if (list == null || list.size() == 0) {
			return ServerResponse.createError("没有一级分类");
		}
		return ServerResponse.createSuccess("查找一级分类成功", list);
	}

	@Override
	public ServerResponse selectSecondCategory(Integer topCategoryId) {
		// TODO Auto-generated method stub
		List<Category> list = categoryMapper.selectSecondCategory(topCategoryId);
		if (list == null || list.size() == 0) {
			return ServerResponse.createError("没有二级分类");
		}
		return ServerResponse.createSuccess("查找二级分类成功", list);
	}

	@Override
	public Integer selectParentCategoryId(Integer categoryId) {
		// TODO Auto-generated method stub
		return categoryMapper.selectParentCategoryId(categoryId);
	}

}
