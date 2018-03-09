package com.situ.mall.portal.vo;

import com.situ.mall.bean.Product;

/**
 * 购物车中的每一条购物单项
 * 
 * @author Administrator
 *
 */
public class CartItemVO {
	// 购买商品
	private Product product;
	// 购物总数量
	private Integer amount;
	// 购物单项的选中状态，0：未选中 1：选中
	private Integer checkStatus;

	public CartItemVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CartItemVO(Product product, Integer amount, Integer checkStatus) {
		super();
		this.product = product;
		this.amount = amount;
		this.checkStatus = checkStatus;
	}


	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Integer getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(Integer checkStatus) {
		this.checkStatus = checkStatus;
	}

	@Override
	public String toString() {
		return "CartItemVO [product=" + product + ", amount=" + amount + ", checkStatus=" + checkStatus + "]";
	}

}
