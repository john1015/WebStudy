<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 
         JSP 생명주기
         	=> _jspinit() : web.xml에 환경 설정 : 생성자와 동일한 역할
         	=> _jspService() : doGet() / doPost() => 통합 (조건문)
         		 ======== JSP에서 코딩한 소스가 메소드안에 첨부
         		 					 ========== _jspService()
    		=> 
      public void _jspService(HttpServletRequest request,HttpServletResponse response){
      	    jsp.PageContext pageContext;
		    HttpSession session = null;
		    ServletContext application;
		    ServletConfig config;
		    JspWriter out = null;
		    Object page = this;
		    
		    =======================
		       여기가 JSP 코딩위치
		    	JSP는 클래스 영역이 아니라 => _jspService()영역에서 코딩
		    =======================
      }
      
      => 자바정리 => 오라클 SQL정리 => HTML/CSS
      113page JSP기초
      ============
      JSP스크립트에 대한 이해
      1) JSP는 자바 + HTML이 혼합
      					   === CSS / JavaScript
      	   => 언어별 구분이 가능
      	   ==================================
      	   <% %>		: 스크립트릿 => 일반 자바 코딩
      	   										 변수 선언 => 지역 변수
      	   										 메소드 호출
      	   										 클래스 메모리 할당
      	   										 제어문 / 연산자	 
      	   <%= %>	: 표현식 => 브라우저에 출력 out.println() 
      	   ================================== 메소드 영역으로 설정
      	   <%! %>		: 선언식 => 사용빈도 거의 없다
      	   									메소드를 JSP에서 만드는 경우 , 멤버변수 선언
      	   ================================== class 영역으로 설정
      	   						
      	   	class basic_005f2_jsp extends HttpJspBase {
      	   	
      	   		=======================
      	   			멤버변수 
      	   			<%! %>
      	   		=======================
      	   			생성자
      	   		=======================
      	   			메소드
      	   			public void _jspInit(){}
      	   			public void_jspDestory(){}
      	   			public void_jspService(){
      	   				<% %>
      	   				<%= %>
      	   			}
      	   		=======================
      	   	
      	   	}
--%>
<%-- 
 public void _jspService(HttpServletRequest request,HttpServletResponse response){
    --%>
<%!
		String name;
 		public void display(){} // 클래스영역
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		int age=10; // _jspService()
	%>
	<%= age %> <%-- out.print(age) --%>
</body>
</html>

<%-- 
	}
--%>