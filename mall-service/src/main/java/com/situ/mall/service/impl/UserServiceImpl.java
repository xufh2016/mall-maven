package com.situ.mall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.situ.mall.bean.User;
import com.situ.mall.common.ServerResponse;
import com.situ.mall.mapper.UserMapper;
import com.situ.mall.service.IUserService;
import com.situ.mall.util.MD5Util;

@Service
public class UserServiceImpl implements IUserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public ServerResponse<User> login(String username, String password) {
		// TODO Auto-generated method stub
		int count = userMapper.checkUsername(username);
		// 判断有无此用户名
		if (count == 0) {
			return ServerResponse.createError("用户名不存在");
		}
		String md5Password = MD5Util.EncodeUtf8(password);// 将密码进行MD5加密
		User user = userMapper.selectLogin(username, password);
		if (user == null) {
			return ServerResponse.createError("密码错误");
		}
		user.setPassword("");
		return ServerResponse.createSuccess("登录成功", user);
	}

	@Override
	public ServerResponse<List<User>> pageList(Integer page, Integer limit) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, limit);
		List<User> list = userMapper.pageList(page, limit);
		int totalCount = (int) ((Page) list).getTotal();
		return ServerResponse.createSuccess("执行成功", totalCount, list);
	}
}
