<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="content"> 
      <!-- ################################################################################################ -->
      <div id="gallery">
        <figure>
          <header class="heading"><h2 class="sectiontitle">${menu }에 있는 캠핑장 목록입니다</h2></header>
          <ul class="nospace clear">
           <c:forEach var="vo" items="${sList }" varStatus="s">
             <c:if test="${s.index%4==0 }">
               <li class="one_quarter first"><a href="#"><img style="width:250px;height:250px" src="${vo.image1 }" title="${vo.camp_name }"></a></li>
             </c:if>
             <c:if test="${s.index%4!=0 }">
               <li class="one_quarter"><a href="#"><img style="width:250px;height:250px" src="${vo.image1 }" title="${vo.camp_name }"></a></li>
             </c:if>
           </c:forEach>
          </ul>
          
        </figure>
      </div>
</body>
</html>