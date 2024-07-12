<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
		application : 서버 관리 => ServletContext
		=======
			1. 서버 관련 정보
				1) 서버이름 : tomcat : getServerInfo()
				2) 버전 확인  getMajorVersion , getMinorVersion()
					===== servlet버저능ㄹ 읽어온다
			2. log정보
				=> log파일 => 서버의 정보를 저장
				=> log() => 
			3. 자원관리 => resource (파일 . . .) 
			    => getRealPath(): 실제 경로명
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3> 서버명 : <%=application.getServerInfo() %></h3>
	<h3> 서블릿 버전 : <%= application.getMajorVersion() %></h3>
	<h3> 서블릿 버전 : <%= application.getMinorVersion() %></h3>
	<h3> 서블릿 버전 : <%= application.getMajorVersion() +"."+application.getMinorVersion()%></h3>
	<h3> log읽기</h3>
	<%
		String driver = application.getInitParameter("driver");
		// web.xml에 있는 데이터 읽기						  <param-name>
		String url = application.getInitParameter("url");
		String username = application.getInitParameter("username");
		String password = application.getInitParameter("password");
		
		application.log("driver:"+driver);
		application.log("url:"+url);
		application.log("username:"+username);
		application.log("password:"+password);
	%>
	
</body>
</html>