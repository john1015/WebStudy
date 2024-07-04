<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*" %>
<%
/*
	1. 웹 출력
		=> 데이터를 가지고 온다 : 오라클 (자바)
	2. 데이터를 HTML에 출력
*/
	String type=request.getParameter("type");
	if(type == null) type="1";
	String strPage = request.getParameter("page");
	if(strPage == null ) strPage="1";
	int curPage = Integer.parseInt(strPage);
	
	FoodDAO dao = FoodDAO.newInstance();
	List<FoodVO> list = dao.foodListData(Integer.parseInt(type), curPage);
	int totalPage=dao.foodListTotalPage(Integer.parseInt(type));
	
	// 블록별 페이지 나누기
	/*
		이동 페이지 => 10
		현재 페이지 => 1~10		1
						11 ~ 20		11
	*/
	final int BLOCK=10;
	int startPage=((curPage-1)/BLOCK*BLOCK)+1;
	/*
						 ============
						 curpage = 10 ==> 1
	*/
	int endPage=((curPage-1)/BLOCK*BLOCK)+BLOCK;
	// JSP => _jspservice(){}
	if(endPage>totalPage) endPage=totalPage;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<style>
		.container {
			margin-top: 20px;
		}

		.row {
			margin: 0px auto;
			width: 960px;
			 text-align: center; 
		}
		.a{
		white-space:nowrap;
		overflow:hidden;
		text-overflow: ellipsis;
		
		}
		</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<a href="food_list.jsp?type=1" class="btn btn-lg btn-success">한식</a>
			<a href="food_list.jsp?type=2" class="btn btn-lg btn-info">중식</a>
			<a href="food_list.jsp?type=3" class="btn btn-lg btn-warning">양식</a>
			<a href="food_list.jsp?type=4" class="btn btn-lg btn-primary">일식</a>
		</div>
		<div style="height:10px"></div>
			<div class="row">
				<%-- 이미지 출력 --%>
				<% for(FoodVO vo : list) { %>
				<div class="col-sm-3">
					<a href="#">
						<div class="thumbnail">
							<img src="<%=vo.getPoster() %>" style="width:200px; height:200px; class="img-rounded">
							<p class="a"><%=vo.getName() %></p>
 						</div>
					</a>
				</div>
				<%} %>
			</div>
		<div style="height:20px"></div>
		<div class="row">
			<div class="text-center"><!-- 가운데 정렬 -->
				<ul class="pagination">
				<%
					if(startPage>1){
				%>
					<li><a href="food_list.jsp?page=<%=startPage+1%>">&lt;</a></li>
				<%
					}
				%>
					<%
						for(int i=startPage; i<=endPage; i++){
							
					%>
					<li class="<%= curPage==i?"active":""%>"><a href="food_list.jsp?page=<%=i %>"><%=i %></a></li>
					<%
						}
					%>
					<%
					if(endPage<totalPage){
					%>
					<li><a href="food_list.jsp?page=<%=endPage+1%>">&gt;</a></li>
					<%
					}
					%>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>