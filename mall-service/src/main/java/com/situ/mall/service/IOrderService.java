package com.situ.mall.service;

import java.util.List;

import com.situ.mall.bean.OrderItem;
import com.situ.mall.bean.Orders;

public interface IOrderService {

	int add(Orders order);

	int addOrderItem(OrderItem orderItem);

	List<Orders> selectOrdersByUserid(Integer userId);

}
