<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.manager.*, java.util.*"%>
<%
    // 요청 파라미터에서 페이지 번호를 가져옴
    String strPage = request.getParameter("page");
    int curpage = 1;
    try {
        if (strPage != null && !strPage.trim().isEmpty()) {
            curpage = Integer.parseInt(strPage);
        }
    } catch (NumberFormatException e) {
        curpage = 1; // 오류 발생 시 기본 페이지 번호를 1로 설정
    }

    FoodDAO dao = FoodDAO.newInstance();
    List<FoodVO> list = dao.foodListData(curpage);
    int totalpage = dao.foodTotalPage();

    final int BLOCK = 10;
    int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
    int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;

    if (endPage > totalpage) endPage = totalpage;

    Cookie[] cookies = request.getCookies();
    List<FoodVO> fList = new ArrayList<FoodVO>();
    if (cookies != null) {
        for (int i = cookies.length - 1; i >= 0; i--) {
            if (cookies[i].getName().startsWith("food_")) {
                try {
                    String fno = cookies[i].getValue();
                    FoodVO vo = dao.foodDetailData(Integer.parseInt(fno));
                    fList.add(vo);
                } catch (Exception ex) {
                    // 쿠키 값이 숫자가 아닐 경우 예외 처리
                }
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식 목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
                for (FoodVO vo : list) {
            %>
            <div class="col-sm-3">
                <div class="thumbnail">
                    <a href="detail_beforef.jsp?fno=<%= vo.getFno() %>">
                        <img src="<%= vo.getPoster() %>" style="width:240px;height:200px;">
                        <p class="a"><%= vo.getName() %></p>
                    </a>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <div class="row">
            <div class="text-center">
                <ul class="pagination">
                    <%
                        if (startPage > 1) {
                    %>
                            <li><a href="list.jsp?page=<%= startPage - 1 %>">&lt;</a></li>
                    <%
                        }
                        for (int i = startPage; i <= endPage; i++) {
                    %>
                            <li class="<%= (i == curpage) ? "active" : "" %>"><a href="list.jsp?page=<%= i %>"><%= i %></a></li>
                    <%
                        }
                        if (endPage < totalpage) {
                    %>
                            <li><a href="list.jsp?page=<%= endPage + 1 %>">&gt;</a></li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </div>
        <div style="height:20px;"></div>
        <div class="row">
            <h3>최근 방문 맛집</h3>
            <hr>
            <a href="#" class="btn btn-sm btn-success">전체 삭제</a>
            <a href="#" class="btn btn-sm btn-info">전체 보기</a>
            <hr>
            <%
                int i = 0;
                for (FoodVO vo : fList) {
                    if (i > 8) break;
            %>
            <figure style="float:left; margin-left:5px">
                <img src="<%= vo.getPoster() %>" style="width:100px;height:100px;" class="img-rounded">
                <figcaption style="margin:5px 30px">
                    <a href="delete.jsp?fno=<%= vo.getFno() %>" class="btn btn-xs btn-danger">삭제</a>
                </figcaption>
            </figure>
            <%
                    i++;
                }
            %>
        </div>
    </div>
</body>
</html>
