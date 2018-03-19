package com.situ.mall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.bean.Orders;
import com.situ.mall.common.ServerResponse;
import com.situ.mall.service.IOrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private IOrderService orderService;
	
	@RequestMapping("/getOrderListPage")
	public String getOrderListPage() {
		return "order_list";
	}
	
	@RequestMapping("/orderList")
	@ResponseBody
	public ServerResponse<List<Orders>> orderList(Integer page, Integer limit) {
		return orderService.orderList(page, limit);
	}
	
	
	// 点击查看按钮后弹出页面
	@RequestMapping("/showOrderInfo")
	public String showSingleInfo(Integer id, Model model) {// id:商品Id
		//根据商品ID获取订单信息
		Orders order=orderService.showSingleInfo(id);
		model.addAttribute("order", order);
		return "order_info";
	}
	
	@RequestMapping("/deleteById")
	@ResponseBody
	public ServerResponse deleteById(Integer id) {
		return orderService.deleteById(id);
	}
	
}
