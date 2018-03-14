package com.situ.mall.portal.controller;

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
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserService userService;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public ServerResponse login(String username, String password, HttpSession session) {
		ServerResponse serverResponse = userService.login(username, password);
		User user = (User) serverResponse.getData();
		//将user保存到域对象中
		session.setAttribute(Const.CURRENT_USER, user);
		return serverResponse;
	}

	@RequestMapping("/toRegisterPage")
	public String toRegisterPage() {
		return "register";
	}

}
