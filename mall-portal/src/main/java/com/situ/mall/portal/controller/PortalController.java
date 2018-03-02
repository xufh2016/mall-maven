package com.situ.mall.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PortalController {

	//门户首页
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
}
