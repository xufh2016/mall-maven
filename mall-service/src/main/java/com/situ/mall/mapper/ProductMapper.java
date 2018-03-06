package com.situ.mall.mapper;

import java.util.List;

import com.situ.mall.bean.Product;
import com.situ.mall.common.ServerResponse;
import com.situ.mall.vo.ProductSearchCondition;

public interface ProductMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Product record);

	int insertSelective(Product record);

	Product selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Product record);

	int updateByPrimaryKey(Product record);

	List<Product> pageList(ProductSearchCondition sc_product);

	int  deleteBatch(String[] ids);

	ServerResponse<Product> showSingleInfo(Integer id);

	Integer getTopCategoryIdById(Integer id);

	String getSecondCategoryNameByProductId(Integer id);

	String getTopCategoryNameByProductId(Integer id);


	List<Product> selectProductsByParentId(Integer categoryId);

	Product selectProductByPrimaryKey(Integer productId);

	//int add(Product product);
}