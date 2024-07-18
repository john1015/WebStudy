<%@page import="com.sist.vo.SawonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SawonVO vo = new SawonVO();
	vo.setSabun(1);
	vo.setName("홍길동");
	vo.setDept("개발부");
	vo.setJob("사원");
	vo.setPay(3000);
	
	request.setAttribute("vo", vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>EL => 객체 출력 방법</h1>
	<%=((SawonVO)request.getAttribute("vo")).getSabun() %>
	사번:${vo.sabun }<br><%--${vo.getSabun()} --%>
	이름:${vo.name }<br>
	부서:${vo.dept }<br>
	직위:${vo.job }<br>
	연봉:${vo.pay}
</body>
</html>