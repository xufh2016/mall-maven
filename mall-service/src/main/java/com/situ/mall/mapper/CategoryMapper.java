package com.situ.mall.mapper;

import java.util.List;

import com.situ.mall.bean.Category;

public interface CategoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);

	List<Category> selectTopCategory();

	List<Category> selectSecondCategory(Integer topCategoryId);

	Integer selectParentCategoryId(Integer categoryId);
}