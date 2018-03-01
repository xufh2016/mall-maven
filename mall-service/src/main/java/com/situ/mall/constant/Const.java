package com.situ.mall.constant;
/**
 * 后台使用的状态码
 * @author Administrator
 *
 */
public class Const {
	public static final String CURRENT_USER = "CURRENT_USER";

	public interface Role {
		int ROLE_ADMIN = 0; // 0为管理员
		int ROLE_NORMAL_USER = 1; // 1为普通用户

	}
}
