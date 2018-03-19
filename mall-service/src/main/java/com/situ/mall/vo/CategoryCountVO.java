package com.situ.mall.vo;

public class CategoryCountVO {
	private String name;
	private Integer count;
	public CategoryCountVO(String name, Integer count) {
		super();
		this.name = name;
		this.count = count;
	}
	public CategoryCountVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	
}
