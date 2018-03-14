package com.situ.mall.service;

import java.util.List;

import com.situ.mall.bean.OrderItem;

public interface IOrderItemService {

	List<OrderItem> selectItemsByUserid(Integer userId);

}
