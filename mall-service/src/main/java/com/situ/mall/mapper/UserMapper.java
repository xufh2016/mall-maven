package com.situ.mall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.situ.mall.bean.User;

public interface UserMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(User record);

	int insertSelective(User record);

	User selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKey(User record);

	/**
	 * 查询有无此用户名
	 * 
	 * @param username
	 * @return
	 */
	int checkUsername(String username);

	/**
	 * 查询是否登录成功，成功返回一个user对象
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	User selectLogin(@Param("username") String username, @Param("password") String password);

	List<User> pageList(@Param("page")Integer page, @Param("limit")Integer limit);
}