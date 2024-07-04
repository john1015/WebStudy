<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*" %>
    
<%
    // 요청에서 type과 page 파라미터를 가져옵니다.
    
    request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	if(name==null || name.equals("")) name="[美친특가]";
	
    String type = request.getParameter("type");
    if(type == null) type = "1";
    
    String strPage = request.getParameter("page");
    if(strPage == null) strPage = "1";
    int curPage = Integer.parseInt(strPage);

    // DAO를 초기화하고 데이터를 가져옵니다.
    goodsDAO dao = goodsDAO.newInstance();
    List<goodsVO> list = dao.goodsListData(Integer.parseInt(type), curPage);
    int totalPage = dao.goodsListTotalPage(Integer.parseInt(type));

    // 블록별 페이지 나누기
    final int BLOCK = 10;
    int startPage = ((curPage - 1) / BLOCK * BLOCK) + 1;
    int endPage = ((curPage - 1) / BLOCK * BLOCK) + BLOCK;
    if(endPage > totalPage) endPage = totalPage;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Goods List</title>
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
    .row .top{
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
    
    <div class="row" >
			<form method="get" action="goods_list.jsp">
				<input type=text name="name" size=20 class="input-sm" value="<%=name%>">
				<input type="submit" value="검색" class="btn-sm btn-danger">
			</form>
		</div>
    
        <div class="row">
            <a href="goods_list.jsp?type=1" class="btn btn-lg btn-success">All</a>
            <a href="goods_list.jsp?type=2" class="btn btn-lg btn-info">Best</a>
            <a href="goods_list.jsp?type=3" class="btn btn-lg btn-warning">New</a>
            <a href="goods_list.jsp?type=4" class="btn btn-lg btn-primary">Special</a>
        </div>
        <div style="height:10px"></div>
        <div class="row">
            <% for(goodsVO vo : list) { %>
            <div class="col-sm-3">
                <a href="goods_detail.jsp?no=<%=vo.getNo()%>&type=<%=type%>">
                    <div class="thumbnail">
                        <img src="<%= vo.getPoster() %>" style="width:200px;height:200px;" class="img-rounded">
                        <p class="a"><%= vo.getName() %></p>
                    </div>
                </a>
            </div>
            <% } %>
        </div>
        <div style="height:20px;"></div>
        <div class="row">
            <div class="text-center">
                <ul class="pagination">
                    <% if(startPage > 1) { %>
                    <li><a href="goods_list.jsp?type=<%=type %>&page=<%= startPage - 1 %>">&lt;</a></li>
                    <% } for(int i = startPage; i <= endPage; i++) { %>
                    <li class="<%= curPage == i ? "active" : "" %>"><a href="goods_list.jsp?type=<%= type %>&page=<%= i %>"><%= i %></a></li>
                    <% } if(endPage < totalPage) { %>
                    <li><a href="goods_list.jsp?type=<%=type %>&page=<%= endPage + 1 %>">&gt;</a></li>
                   <%
					}
					%>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
