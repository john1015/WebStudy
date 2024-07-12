<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String fno = request.getParameter("fno");
	Cookie cookie = new Cookie("goods_"+fno,fno);
	cookie.setPath("/");
	cookie.setMaxAge(60*60*24);// 저장기간 => setMaxAge()
	// 브라우저로 전송
	response.addCookie(cookie);
	
	//화면 이동
	response.sendRedirect("../main/main.jsp?mode=3&fno="+fno);
%>
