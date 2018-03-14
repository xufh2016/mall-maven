package com.situ.mall.mapper;

import java.util.List;

import com.situ.mall.bean.OrderItem;

public interface OrderItemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderItem record);

    int insertSelective(OrderItem record);

    OrderItem selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderItem record);

    int updateByPrimaryKey(OrderItem record);
    /**
     * 根据用户Id获取该用户下的所有订单项信息
     * @param userId 用户Id
     * @return 该用户的所有订单项信息
     */
	List<OrderItem> selectItemsByUserid(Integer userId);
}