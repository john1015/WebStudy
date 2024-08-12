<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear"> 
    <!-- main body --> 
    <div class="content"> 
      <div id="gallery">
        <figure>
          <header class="heading">맛집 ${count }개 있습니다</header>
          <ul class="nospace clear">
          <c:forEach var="vo" items="${fList }" varStatus="s">
            <li class="one_quarter ${s.index%4==0? 'first':'' }"><a href="../food/detail_before.do?fno=${vo.fno }&type=1"><img src="http://menupan.com${vo.poster }" title="${vo.name }"></a></li>
		  </c:forEach>
          </ul>
        </figure>
      </div>
      <nav class="pagination">
        <ul>
        	<c:if test="${startPage>1 }">
          		<li><a href="../food/list.do?page=${startPage-1 }">&laquo; Previous</a></li>
          	</c:if>
          	<c:forEach var="i" begin="${startPage }" end="${endPage }">
          		<li ${i==curpage?"class=current":"" }><a href="../food/list.do?page=${i }">${i }</a></li>
          	</c:forEach>
			<c:if test="${endPage<totalPage }">
          		<li><a href="../food/list.do?page=${endPage+1 }">Next &raquo;</a></li>
          	</c:if>
        </ul>
      </nav>
    </div>
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
</body>
</html>