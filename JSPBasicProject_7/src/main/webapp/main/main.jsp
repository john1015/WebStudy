<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="com.sist.change.*"%>
<jsp:useBean id="change" class="com.sist.change.JspChange"/>
<%-- JspChange change = new JspChange() 
		<% %> = 사용이 불편 (CSS)
--%>
<%
	String mode = request.getParameter("mode"); // 화면 변경
	if(mode==null){ // 첫번째 화면
		mode="0";
	}
	int index=Integer.parseInt(mode);
	String jsp=change.change(index);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.row{
	margin:0px auto;
	width:960px;
}  
.a{
	white-space:nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
  </style>
</head>
<body>
	<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Request/Response</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="#">답변형게시판</a></li>
      <li><a href="#">자료실</a></li>
      <li><a href="#">스토어</a></li>
    </ul>
  </div>
</nav>
<jsp:include page="header.jsp"></jsp:include>
	<div class= "container">
		<jsp:include page="<%=jsp %>"></jsp:include>
	</div>
</body>
</html>