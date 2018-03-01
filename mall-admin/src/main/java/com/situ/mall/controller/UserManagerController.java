package com.situ.mall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.bean.User;
import com.situ.mall.common.ServerResponse;
import com.situ.mall.constant.Const;
import com.situ.mall.service.IUserService;

@Controller
@RequestMapping(value = "/user")
public class UserManagerController {

	// 自动装在service
	@Autowired
	private IUserService userService;

	// 跳转到登录页面
	@RequestMapping(value = "getLoginPage")
	public String getLoginPage() {
		return "login";
	}

	// 进行登录验证，并返回json数据到前端
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public ServerResponse<User> login(String username, String password, HttpSession session, String checkCode) {
		if (checkCode == null || "".equals(checkCode))
			return ServerResponse.createError("验证码不能为空");
		if (!checkCode.equals(session.getAttribute("checkCode")))
			return ServerResponse.createError("验证码输入错误");
		ServerResponse<User> serverResponse = userService.login(username, password);
		if (serverResponse.isSuccess()) {
			User user = serverResponse.getData();
			// 管理员登录
			if (user.getRole() == Const.Role.ROLE_ADMIN) {
				session.setAttribute(Const.CURRENT_USER, user);
				return serverResponse;
			} else {
				return ServerResponse.createError("不是管理员，无法登录");
			}
		}
		return serverResponse;
	}

	@RequestMapping(value = "/userList")
	public String userList() {
		return "user_list";
	}

	/**
	 * 分页显示
	 * 
	 * @return
	 */
	@RequestMapping("/pageList")
	@ResponseBody
	public ServerResponse<List<User>> pageList(Integer page, Integer limit) {

		return userService.pageList(page, limit);
	}

}
