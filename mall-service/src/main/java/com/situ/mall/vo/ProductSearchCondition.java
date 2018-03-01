package com.situ.mall.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ProductSearchCondition {

	// 查询的开始时间
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Date beginTime;

	// 查询的截止时间
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Date endTime;

	private String sc_name;// 商品名称

	private String sc_subtitle;// 商品副标题

	public ProductSearchCondition() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductSearchCondition(Date beginTime, Date endTime, String sc_name, String sc_subtitle) {
		super();
		this.beginTime = beginTime;
		this.endTime = endTime;
		this.sc_name = sc_name;
		this.sc_subtitle = sc_subtitle;
	}

	public Date getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getSc_name() {
		return sc_name;
	}

	public void setSc_name(String sc_name) {
		this.sc_name = sc_name;
	}

	public String getSc_subtitle() {
		return sc_subtitle;
	}

	public void setSc_subtitle(String sc_subtitle) {
		this.sc_subtitle = sc_subtitle;
	}

	@Override
	public String toString() {
		return "ProductSearchCondition [beginTime=" + beginTime + ", endTime=" + endTime + ", sc_name=" + sc_name
				+ ", sc_subtitle=" + sc_subtitle + "]";
	}

}
