<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<h3 class="text-center">음식</h3>
		<table class="table">
			<tr>
				<th class="text-center">오늘의 추천</th>
				<th class="text-center"></th>
				<th class="text-center">이름</th>
				<th class="text-center">평점</th>
				<th class="text-center">전화번호</th>
			</tr>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td class="text-center">${vo.fno }</td>
					<td class="text-center">
					<img src="${vo.poster }" style="width: 30px;height: 30px">
					</td>
					<td><a href="../food/detail.do?fno=${vo.fno}">${vo.name }</a></td>
					<td class="text-center">${vo.score }</td>
					<td class="text-center">${vo.phone }</td>
				</tr>
			</c:forEach>
		</table>
		<table class="table">
			<tr>
				<td class="text-center">
					<a href="../food/list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-success">이전</a>
						${curpage } page / ${totalpage } pages
					<a href="../food/list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-success">이전</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>