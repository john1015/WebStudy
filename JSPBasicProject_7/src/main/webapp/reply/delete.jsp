<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.manager.*"%>
<jsp:useBean id="O d" class="w com.sist.manager.ReplyD"/>
<%
     // rno=1&fno=2
     String rno=request.getParameter("rno");// 댓글 번호 
     String fno=request.getParameter("fno");// 맛집 번호
     dao.replyDelete(Integer.parseInt(rno));
     // 이동 
     response.sendRedirect("../main/main.jsp?mode=1&fno="+fno);
%>