<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- fn 스트 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
	.container{
		margin-top:50px;
	}
	.row{
		margin:0px auto;
		width:900px;
	}
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#user-table > tbody > tr').hover(function(){
		// 행을 마우스 오버했을 때 배경색 변경 및 커서 포인터로 변경
		$(this).css('backgroundColor','#FC6').css('cursor','pointer')
	},function(){
		// 행에서 마우스가 벗어났을 때 배경색 원래대로
		$(this).css('backgroundColor','#FFF').css('cursor','pointer')
	})
	
	$('#keyword').keyup(function(){
		let k = $(this).val(); // 입력값 읽기
		$('#user-table > tbody > tr').hide(); // 모든 행 숨기기
		let temp = $('#user-table > tbody > tr > td:nth-child(4n+1):contains("'+k+'")');
		$(temp).parent().show(); // 검색어가 포함된 행 보이기
	})
})
</script>
</head>
<body>
	<div class="container">
		<h3 class="text-center">뮤직 TOP50</h3>
		<div class="row">
			<table class="table">
				<tr>
					<td>
						<input type="text" class="input-sm" id="keyword" size=20 placeholder="검색어 입력">
					</td>
				</tr>
				</table>
				<table class="table" id="user-table">
				<thead>
					<tr>
						<th class="text-center">순위</th>
						<th class="text-center"></th>
						<th class="text-center"></th>
						<th class="text-center">곡명</th>
						<th class="text-center">가수명</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list }">
						<tr>
							<td class="text-center">${vo.mno }</td>
							<td class="text-center">
								<c:choose>
									<c:when test="${fn:trim(vo.state)=='상승' }">
										<font color=blue>▲</font>&nbsp;${vo.idcrement }
									</c:when>
									<c:when test="${fn:trim(vo.state)=='하강' }">
										<font color=red>▼</font>&nbsp;${vo.idcrement }
									</c:when>
									<c:otherwise>
										<font color=gray>-</font>
									</c:otherwise>
								</c:choose>
							</td>
							<td class="text-center">
								<img src="${vo.poster }" style="width:30px;height:30px">
							</td>
							<td>${vo.title }</td>
							<td>${vo.singer }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>