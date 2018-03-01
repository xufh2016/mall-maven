package com.situ.mall.common;

import java.io.Serializable;

/**
 * ServerResponse类用于ajax请求时服务器返回的响应信息
 */
public class ServerResponse<T> implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer code;// 当前状态（程序员判断状态）:成功、失败、未登录、没有权限
	private String msg;// 描述信息（主要是给用户看的提示信息）
	private Integer count;
	private T data;// 后台返回给前端的数据

	public ServerResponse() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ServerResponse(Integer code) {
		super();
		this.code = code;
	}

	public ServerResponse(Integer code, String msg) {
		super();
		this.code = code;
		this.msg = msg;
	}

	public ServerResponse(Integer code, String msg, T data) {
		super();
		this.code = code;
		this.msg = msg;
		this.data = data;
	}

	public ServerResponse(Integer count, T data) {
		super();
		this.count = count;
		this.data = data;
	}

	public ServerResponse(Integer code, String msg, Integer count, T data) {
		super();
		this.code = code;
		this.msg = msg;
		this.count = count;
		this.data = data;
	}

	// 只是告诉前台：成功这种状态
	public static <T> ServerResponse<T> createSuccess() {
		return new ServerResponse<>(ResponseCode.SUCCESS.getCode());
	}

	// 告诉前台：code,msg
	public static <T> ServerResponse<T> createSuccess(String msg) {
		return new ServerResponse<>(ResponseCode.SUCCESS.getCode(), msg);
	}

	// 告诉前台：code,msg,data
	public static <T> ServerResponse<T> createSuccess(String msg, T data) {
		return new ServerResponse<>(ResponseCode.SUCCESS.getCode(), msg, data);
	}

	// 告诉前台：code,msg,totalCount,data
	public static <T> ServerResponse<T> createSuccess(String msg, Integer totalCount, T data) {
		return new ServerResponse<>(ResponseCode.SUCCESS.getCode(), msg, totalCount, data);
	}

	// 只是告诉前台：失败这种状态
	public static <T> ServerResponse<T> createError() {
		return new ServerResponse<>(ResponseCode.ERROR.getCode());
	}

	// 告诉前台：code,msg
	public static <T> ServerResponse<T> createError(String msg) {
		return new ServerResponse<>(ResponseCode.ERROR.getCode(), msg);
	}

	// 告诉前台：code,msg,data
	public static <T> ServerResponse<T> createError(String msg, T data) {
		return new ServerResponse<>(ResponseCode.ERROR.getCode(), msg, data);
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "ServerResponse [code=" + code + ", msg=" + msg + ", data=" + data + "]";
	}

	public boolean isSuccess() {
		// TODO Auto-generated method stub
		return code == ResponseCode.SUCCESS.getCode();
	}

}
