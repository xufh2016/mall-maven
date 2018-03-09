package com.situ.mall.portal.vo;
/**
 * 购物车的VO
 * @author Administrator
 *
 */

import java.util.ArrayList;
import java.util.List;

public class CartVO {
	// 购物车里的每个购物项
	private List<CartItemVO> cartItemList = new ArrayList<CartItemVO>();

	public CartVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CartVO(List<CartItemVO> cartItemList) {
		super();
		this.cartItemList = cartItemList;
	}

	public List<CartItemVO> getCartItemList() {
		return cartItemList;
	}

	public void setCartItemList(List<CartItemVO> cartItemList) {
		this.cartItemList = cartItemList;
	}

	@Override
	public String toString() {
		return "CartVO [cartItemList=" + cartItemList + "]";
	}

}
