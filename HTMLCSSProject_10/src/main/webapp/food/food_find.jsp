<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
	// http://localhost/HTMLCSSProject_10/food/food_find.jsp 
	//http://localhost/HTMLCSSProject_10/food/food_find.jsp?addr=
	/*
			JSP : Java Server Page
					=> Server에서 실행되는 자바 파일
			=> 메소드 영역
			=> 클래스를 제작 => 컴파일 => HTML만 메모리에 저장 => 저장된 HTML을 브라우저에서 읽어서 출력
			
			=>HTML / XML
				contentType = "text/html;" => default
				contentType="text/xml";
	*/
	// 브라우저 : 1byte => 자바 : 2byte => decoding
	request.setCharacterEncoding("UTF-8");
	String addr = request.getParameter("addr");
	if(addr==null || addr.equals("")) addr="마포";
	String strPage=request.getParameter("page");
	if(strPage==null) strPage="1";
	
	int curPage = Integer.parseInt(strPage);  // 현재 보여주는 페이지
	
	FoodDAO dao = FoodDAO.newInstance();
	List<FoodVO> list = dao.foodFindData(addr, curPage);
	int totalpage = dao.foodFindTotalPage(addr);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	margin-top: 50px;
}

.row {
	margin: 0px auto;
	width: 960px;
}

.a {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<form method="get" action="food_find.jsp">
				<input type=text name="addr" size=20 class="input-sm" value="<%=addr%>">
				<input type="submit" value="검색" class="btn-sm btn-danger">
			</form>
		</div>
		<div style="height : 20px"></div>
		<div class="row">
		<%
			for(FoodVO vo:list){
		%>
			<div class="col-sm-3">
				<a href="#">
					<div class="thumbnail">
						<img src="<%=vo.getPoster() %>" style="width:240px; height:250px;" class="img-rounded">
						<p class="a"><%=vo.getName() %></p>
					</div>
				</a>
			</div>
			<%
			}
			%>
		</div>
		<div style="height:20px; "></div>
			<div class="row">
				<div class="text-center">
					<a href="food_find.jsp?addr=<%=addr %>&page=<%=curPage>1? curPage-1:curPage %>" class="btn btn-sm btn-primary">이전</a>
					<%=curPage %> page / <%=totalpage %> pages
					<a href="food_find.jsp?addr=<%=addr %>&page=<%=curPage<totalpage? curPage+1:curPage %>" class="btn btn-sm btn-primary">다음</a>
				</div>
			</div>
	</div>
</body>
</html>