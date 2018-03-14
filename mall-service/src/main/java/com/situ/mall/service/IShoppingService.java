package com.situ.mall.service;

import java.util.List;

import com.situ.mall.bean.Shipping;

public interface IShoppingService {

	List<Shipping> selectShippingInfoByuserId(Integer userId);

}
