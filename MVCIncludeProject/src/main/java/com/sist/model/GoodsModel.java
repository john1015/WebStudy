package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;


public class GoodsModel {
	@RequestMapping("goods/goodsList.do") 
	public String goods_list(HttpServletRequest request , HttpServletResponse response) {
		request.setAttribute("main_jsp", "../goods/goodsList.jsp"); // include
		return "../main/main.jsp";
	}
}
