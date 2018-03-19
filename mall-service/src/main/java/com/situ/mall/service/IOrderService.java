package com.situ.mall.service;

import java.util.List;

import com.situ.mall.bean.OrderItem;
import com.situ.mall.bean.Orders;
import com.situ.mall.common.ServerResponse;

public interface IOrderService {

	int add(Orders order);

	int addOrderItem(OrderItem orderItem);

	List<Orders> selectOrdersByUserid(Integer userId);

	ServerResponse<List<Orders>> orderList(Integer page, Integer limit);

	Orders showSingleInfo(Integer id);

	ServerResponse deleteById(Integer id);

}
