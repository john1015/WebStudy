<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.manager.*"%>
<%
    	goodsDAO dao = goodsDAO.newInstance();//싱글턴
    	String strPage = request.getParameter("page");
    	if(strPage==null)
    		// 첫화면
    		strPage="1";
    	
    	int curPage = Integer.parseInt(strPage);
    	
   		List<goodsVO> list = dao.goodsListData(curPage);
   		
    	for(goodsVO vo:list){
    		String img = vo.getPoster();
    		img = img.replace("https","http");
    		vo.setPoster(img);
    	}
    	int totalpage=dao.goodsTotalPage(); // 총페이지
    	
    	final int BLOCK=10;
    	int startPage=((curPage-1)/BLOCK*BLOCK)+1;

    	int endPage=((curPage-1)/BLOCK*BLOCK)+BLOCK;
    	if(endPage>totalpage) endPage=totalpage;
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
			<%
				for(goodsVO vo : list){
			%>
			<div class="col-sm-3">
				<div class="thumbnail">
					<a href="goods_detail.jsp?no=<%=vo.getNo() %>">
						<img src="<%=vo.getPoster()%>" style="width: 240px;height:200px;" class="img-rounded">
						<p class="a"><%=vo.getName() %></p>
					</a>
				</div>
			</div>
			<%} %>
		</div>
		<div style="height:10px"></div>
		<div class="row">
			<div class="text-center">
				<ul class="pagination">
					<%
						if(startPage>1){
					%>
						<li><a href="goods_list.jsp?page=<%=startPage+1 %>">&lt;</a></li>
					<%} %>
					
					<%
						for(int i=startPage; i<=endPage; i++){
							
					%>
					<li class="<%= curPage==i?"active":""%>"><a href="goods_list.jsp?page=<%=i %>"><%=i %></a></li>
					<%
						}
					%>
					
					<%if(endPage<totalpage){ %>
					<li><a href="goods_list.jsp?page=<%=endPage+1 %>">&gt;</a></li>
					<%} %>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>