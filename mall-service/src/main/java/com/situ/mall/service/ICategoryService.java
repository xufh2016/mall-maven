package com.situ.mall.service;

import com.situ.mall.bean.Category;
import com.situ.mall.common.ServerResponse;

public interface ICategoryService {

	ServerResponse<Category> selectTopCategory();

	ServerResponse<Category> selectSecondCategory(Integer topCategoryId);

	Integer selectParentCategoryId(Integer categoryId);

}
