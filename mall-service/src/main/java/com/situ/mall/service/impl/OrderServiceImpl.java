package com.situ.mall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;

import com.situ.mall.bean.OrderItem;
import com.situ.mall.bean.Orders;
import com.situ.mall.mapper.OrderItemMapper;
import com.situ.mall.mapper.OrderMapper;
import com.situ.mall.service.IOrderService;

@Service
public class OrderServiceImpl implements IOrderService {

	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private OrderItemMapper orderItemMapper;
	@Override
	public int add(Orders order) {
		// TODO Auto-generated method stub
		return orderMapper.insertSelective(order);
	}
	//将订单项添加到订单中
	@Override
	public int addOrderItem(OrderItem orderItem) {
		// TODO Auto-generated method stub
		return orderItemMapper.insertSelective(orderItem);
	}
	
	/**
	 * 根据用户Id查询用户的所有订单信息
	 */
	@Override
	public List<Orders> selectOrdersByUserid(Integer userId) {
		// TODO Auto-generated method stub
		return orderMapper.selectOrdersByUserid(userId);
	}

}
