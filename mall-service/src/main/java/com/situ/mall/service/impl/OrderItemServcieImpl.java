package com.situ.mall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.bean.OrderItem;
import com.situ.mall.mapper.OrderItemMapper;
import com.situ.mall.service.IOrderItemService;

@Service
public class OrderItemServcieImpl implements IOrderItemService {

	@Autowired
	private OrderItemMapper orderItemMapper;

	@Override
	public List<OrderItem> selectItemsByUserid(Integer userId) {
		// TODO Auto-generated method stub
		return orderItemMapper.selectItemsByUserid(userId);
	}

}
