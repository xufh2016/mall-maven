package com.situ.mall.service;

import java.util.List;

import com.situ.mall.bean.Product;
import com.situ.mall.common.ServerResponse;
import com.situ.mall.vo.ProductSearchCondition;

public interface IProductService {

	ServerResponse<List<Product>> pageList(Integer page, Integer limit, ProductSearchCondition sc_product);

	ServerResponse deleteById(Integer id);

	ServerResponse deleteBatch(String ids);

	/**
	 * 查看单条商品信息
	 * 
	 * @param id
	 * @return
	 */
	Product showSingleInfo(Integer id);

	ServerResponse add(Product product);

	String getSecondCategoryNameByProductId(Integer id);

	String getTopCategoryNameByProductId(Integer id);

	ServerResponse updateProductById(Product product);

	List<String> getTopCategoryName();

	List<Product> selectProductsByParentId(Integer categoryId);

	Product selectProductByPrimaryKey(Integer productId);

	/* Integer getTopCategoryIdById(Integer id); */
	Integer getProductStock(Integer productId);
}
