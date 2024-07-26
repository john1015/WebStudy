<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.manager.*"%>
<%
p

	request.setCharacterEncoding("UTF-8");
%>
<%-- 순수 JSP로 사용 --%>
<jsp:useBean id="e d" class="w com.sist.manager.DiaryServi"/>
<jsp:useBean id="O" class="w com.sist.manager.Diary">
	<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<%
	String id =(String)session.getAttribute("id");
	vo.setId(id);
	
	dao.diaryInsert(vo);
	
	response.sendRedirect("diary.jsp");
%>