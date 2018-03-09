package com.situ.mall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.situ.mall.bean.Product;
import com.situ.mall.common.ServerResponse;
import com.situ.mall.mapper.ProductMapper;
import com.situ.mall.service.IProductService;
import com.situ.mall.vo.ProductSearchCondition;

@Service
public class ProductServiceImpl implements IProductService {

	@Autowired
	private ProductMapper productMapper;

	@Override
	public ServerResponse<List<Product>> pageList(Integer page, Integer limit, ProductSearchCondition sc_product) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, limit);
		List<Product> list = productMapper.pageList(sc_product);
		int totalCount = (int) ((Page) list).getTotal();
		return ServerResponse.createSuccess("执行成功", totalCount, list);
	}

	@Override
	public ServerResponse deleteById(Integer id) {
		// TODO Auto-generated method stub
		int i = productMapper.deleteByPrimaryKey(id);
		if (i > 0)
			return ServerResponse.createSuccess("删除成功");
		return ServerResponse.createError("删除失败");
	}

	@Override
	public ServerResponse deleteBatch(String idstr) {
		// TODO Auto-generated method stub
		String[] ids = idstr.split(",");
		int count = productMapper.deleteBatch(ids);
		if (count == ids.length)
			return ServerResponse.createSuccess("删除成功");
		return ServerResponse.createError("删除失败");
	}

	@Override
	public Product showSingleInfo(Integer id) {
		// TODO Auto-generated method stub
		Product serverResponse = productMapper.selectByPrimaryKey(id);
		return serverResponse;
	}

	@Override
	public ServerResponse add(Product product) {
		// TODO Auto-generated method stub
		int line = productMapper.insert(product);
		if (line > 0)
			return ServerResponse.createSuccess("添加商品成功");
		return ServerResponse.createError("添加商品失败");
	}

	@Override
	public String getSecondCategoryNameByProductId(Integer id) {
		// TODO Auto-generated method stub
		return productMapper.getSecondCategoryNameByProductId(id);
	}

	@Override
	public String getTopCategoryNameByProductId(Integer id) {
		// TODO Auto-generated method stub
		return productMapper.getTopCategoryNameByProductId(id);
	}

	@Override
	public ServerResponse updateProductById(Product record) {
		// TODO Auto-generated method stub
		int line = productMapper.updateByPrimaryKeySelective(record);
		if (line > 0)
			return ServerResponse.createSuccess("添加商品成功");
		return ServerResponse.createError("添加商品失败");
	}

	@Override
	public List<String> getTopCategoryName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> selectProductsByParentId(Integer categoryId) {
		// TODO Auto-generated method stub
		return productMapper.selectProductsByParentId(categoryId);
	}

	@Override
	public Product selectProductByPrimaryKey(Integer productId) {
		// TODO Auto-generated method stub
		return productMapper.selectProductByPrimaryKey(productId);
	}

	@Override
	public Integer getProductStock(Integer productId) {
		// TODO Auto-generated method stub
		return productMapper.getProductStock( productId);
	}

}
