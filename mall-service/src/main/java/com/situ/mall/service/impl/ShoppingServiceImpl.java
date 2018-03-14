package com.situ.mall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.bean.Shipping;
import com.situ.mall.mapper.ShippingMapper;
import com.situ.mall.service.IShoppingService;

@Service
public class ShoppingServiceImpl implements IShoppingService {

	@Autowired
	private ShippingMapper shippingMapper;

	@Override
	public List<Shipping> selectShippingInfoByuserId(Integer userId) {
		// TODO Auto-generated method stub
		return shippingMapper.selectShippingInfoByUserId(userId);
	}
	
}
