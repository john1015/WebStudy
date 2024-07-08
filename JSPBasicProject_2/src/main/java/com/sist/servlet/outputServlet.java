package com.sist.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/outputServlet")
public class outputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("outputServlet: init(ServletConfig config) Call . . .");
	}


	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("outputServlet:destory() Call . . . ");
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("outputServlet:doGet() Call . . . ");
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("outputServlet:doPost() Call . . . ");
		// HTTP 상태 405 - 허용하지 않는 메소드
		// GET => doGet() / POST => doPost()
		// GET => doPost() (X) <a> => GET방식
	}

}
