<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600&family=Roboto&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<link href="../lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="../lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="../lib/easing/easing.min.js"></script>
<script src="../lib/waypoints/waypoints.min.js"></script>
<script src="../lib/owlcarousel/owl.carousel.min.js"></script>
<script src="../lib/lightbox/js/lightbox.min.js"></script>
<style type="text/css">
/*  img.img-fluid{
	width:200px;
	height:200px;
}  */
#gallery {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
}

#gallery img {
    margin: 10px; /* 이미지 사이의 간격 */
    height: auto; /* 비율 유지 */
    border-radius: 8px; /* 이미지 모서리를 둥글게 */
}

#gallery .image-container {
    margin: 5px 10px; /* 좌우 간격 조정 */
}
</style>
</head>
<body>
	<!-- Header Start -->
	<div class="container-fluid bg-breadcrumb">
		<div class="container text-center py-5" style="max-width: 900px;">
			<h3 class="text-white display-3 mb-4">맛집 탐방</h3>
			<ol class="breadcrumb justify-content-center mb-0">
			</ol>
		</div>
	</div>
	<!-- Header End -->
	<div class="wrapper row3">
		<main class="container clear">
			<h2></h2>
			<h2 class="sectiontitle">목록</h2>
			<div class="content">
				<div id="gallery">
					<figure>
						<header class="heading">레시피 ${count }개 있습니다</header>
							<div class="row">
								<c:forEach var="vo" items="${rList}" varStatus="s">
									<div class="col-md-3 col-sm-6">
										<a href="../recipe/detail_before.do?fno=${vo.no }&type=1">
											<img src="${vo.poster }" class="img-fluid w-200 h-200" title="${vo.title }"
											 style="object-fit: cover; min-height: 300px;">
										</a>
									</div>
								</c:forEach>
							</div>
					</figure>
				</div>
				<nav aria-label="Page navigation">
				  <ul class="pagination justify-content-center">
				    <c:if test="${startPage > 1}">
				      <li class="page-item">
				        <a class="page-link" href="../recipe/list.do?page=${startPage-1 }">&laquo; Previous</a>
				      </li>
				    </c:if>
				    <c:forEach var="i" begin="${startPage}" end="${endPage}">
				      <li class="page-item ${i == curpage ? 'active' : ''}">
				        <a class="page-link" href="../recipe/list.do?page=${i }">${i }</a>
				      </li>
				    </c:forEach>
				    <c:if test="${endPage < totalPage}">
				      <li class="page-item">
				        <a class="page-link" href="../recipe/list.do?page=${endPage+1 }">Next &raquo;</a>
				      </li>
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