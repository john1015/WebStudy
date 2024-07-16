<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String fno = request.getParameter("fno");
    if (fno == null || fno.trim().isEmpty()) {
        // fno 파라미터가 없을 경우 처리
        response.sendRedirect("error.jsp"); // 예를 들어 에러 페이지로 리다이렉트
        return;
    }

    Cookie cookie = new Cookie("food_" + fno, fno);
    cookie.setPath("/");
    cookie.setMaxAge(60 * 60 * 24); // 24시간 동안 유효한 쿠키
    response.addCookie(cookie);


    // 상세 페이지로 리다이렉트
    response.sendRedirect("detailf.jsp?fno=" + fno);
%>
