package com.situ.mall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.situ.mall.bean.OrderItem;
import com.situ.mall.bean.Orders;
import com.situ.mall.common.ServerResponse;
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

	// 将订单项添加到订单中
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

	@Override
	public ServerResponse<List<Orders>> orderList(Integer page, Integer limit) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, limit);
		List<Orders> list = orderMapper.orderList(page, limit);
		int totalCount = (int) ((Page) list).getTotal();
		return ServerResponse.createSuccess("执行成功", totalCount, list);
	}

	@Override
	public Orders showSingleInfo(Integer id) {
		// TODO Auto-generated method stub
		Orders orders = orderMapper.selectByPrimaryKey(id);
		return orders;
	}

	@Override
	public ServerResponse deleteById(Integer id) {
		int i = orderMapper.deleteByPrimaryKey(id);
		if (i > 0)
			return ServerResponse.createSuccess("删除成功");
		return ServerResponse.createError("删除失败");
	}

}
