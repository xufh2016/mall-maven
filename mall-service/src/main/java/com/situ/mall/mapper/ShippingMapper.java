package com.situ.mall.mapper;

import java.util.List;

import com.situ.mall.bean.Shipping;

public interface ShippingMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Shipping record);

    int insertSelective(Shipping record);

    Shipping selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Shipping record);

    int updateByPrimaryKey(Shipping record);

	List<Shipping> selectShippingInfoByUserId(Integer userId);
}