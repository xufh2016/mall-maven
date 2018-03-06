package com.situ.mall.service;

import java.util.List;

import com.situ.mall.bean.Category;
import com.situ.mall.common.ServerResponse;

public interface ICategoryService {

	ServerResponse<Category> selectTopCategory();

	ServerResponse<Category> selectSecondCategory(Integer topCategoryId);

	Integer selectParentCategoryId(Integer categoryId);

	List<Category> selectSecondCategoryList();

}
