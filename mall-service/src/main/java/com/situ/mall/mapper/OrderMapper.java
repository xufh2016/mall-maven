package com.situ.mall.mapper;

import java.util.List;

import org.springframework.core.annotation.Order;

import com.situ.mall.bean.Orders;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Orders record);

    int insertSelective(Orders record);

    Orders selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKey(Orders record);

    /**
     * 根据用户的Id查询该用户的订单项
     * @param userId用户Id
     * @return 该用户所有订单的集合
     */
	List<Orders> selectOrdersByUserid(Integer userId);

}