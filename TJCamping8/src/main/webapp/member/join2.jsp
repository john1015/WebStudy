<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600&family=Roboto&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">

<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<style>

.pagination {
	display: flex;
	justify-content: center;
	margin: 20px 0;
}

.pagination ul {
	list-style: none;
	padding: 0;
	margin: 0;
	display: flex;
}

.pagination li {
	margin: 0 5px;
}

.pagination a {
	display: block;
	padding: 10px 15px;
	border: 1px solid #ddd;
	background-color: #f9f9f9;
	color: #333;
	text-decoration: none;
	border-radius: 4px;
}

.pagination a:hover {
	background-color: #007bff;
	color: white;
}

.pagination .current a {
	background-color: #007bff;
	color: white;
	border: 1px solid #007bff;
}

.row {
	margin: 0px auto;
	width: 1080px;
}
.thtext{
	color:white;
}

</style>
</head>
<body>
	<!-- Header Start -->
	<div class="container-fluid booking"style="height:200px;"></div>
	<div class="container-fluid booking" >
		<div class="container text-center py-5" style="max-width: 900px; ">
			<div class="mx-auto text-center mb-5" style="max-width: 900px;">
				<h5 class="section-title px-3">joinTJ</h5>
				<h1 class="mb-0 " style="color: white;">회원가입</h1>
			</div>
			<ol class="breadcrumb justify-content-center mb-0">
			</ol>
		</div>
	</div>
	<!-- Header End -->
	<div class="container-fluid booking py-3 ">
		<div class="container py-3"  >
			<main class="container clear" style="color:red;">
				<div class="row">
					<form method="post" action="../member/join_ok.do" name="frm" >
						<table class="table" >
							<tr>
								<th class="text-right thtext" width="15%">ID</th>
								<td width="85%" class="inline">
									<input type="text" size=20 class="input-sm" readonly name="id" id="id"> 
									<input type="button" value="중복체크" class="btn-sm btn-danger" id="checkBtn">
								</td>
							</tr>
							<tr>
								<th class="text-right thtext" width="15%">비밀번호</th>
								<td width="85%" class="inline thtext">
								<input type="password" size=20 class="input-sm " name="pwd" id="pwd">
									&nbsp;&nbsp;재입력:&nbsp;&nbsp;
								<input type="password" size=20 class="input-sm" id="pwd1"></td>
							</tr>
							<tr>
								<th class="text-right thtext" width="15%">이름</th>
								<td width="85%">
									<input type="text" size=20 class="input-sm" name="name" id="name">
								</td>
							</tr>
							<tr>
								<th class="text-right thtext" width="15%">성별</th>
								<td width="85%" class="inline thtext">
									<input type="radio" name="sex" value="남자" checked>남자 
									<input type="radio" name="sex" value="여자">여자
								</td>
							</tr>
							<tr>
								<th class="text-right thtext" width="15%">생년월일</th>
								<td width="85%">
									<input type="date" size=30 class="input-sm" name="birth" id="day">
								</td>
							</tr>
							<tr>
								<th class="text-right thtext" width="15%">이메일</th>
								<td width="85%">
									<input type="text" size=70 class="input-sm" name="email" id="email">
								</td>
							</tr>
							<tr>
								<th class="text-right thtext" width="15%">우편번호</th>
								<td width="85%" class="inline">
									<input type="text" size=15 class="input-sm" name="post" readonly id="post1"> 
									<input type=button value="우편번호검색" class="btn btn-sm btn-primary" id="postBtn">
								</td>
							</tr>
							<tr>
								<th class="text-right thtext" width="15%">주소</th>
								<td width="85%">
									<input type="text" size=70 class="input-sm" name="addr1" readonly id="addr1">
								</td>
							</tr>
							<tr>
								<th class="text-right thtext" width="15%">상세주소</th>
								<td width="85%">
									<input type="text" size=70 class="input-sm" name="addr2">
								</td>
							</tr>
							<tr>
								<th class="text-right thtext" width="15%">전화번호</th>
								<td width="85%" class="inline">
									<select class="input-sm" name="phone1">
										<option>010</option>
									</select> 
									<input type="text" size=20 class="input-sm" name="phone2" id="phone2">
								</td>
							</tr>
							<tr>
								<th class="text-right thtext" width="15%">소개</th>
								<td width="85%">
									<textarea rows="5" cols="70" name="content"></textarea>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="text-center inline thtext">
									<input type="submit" value="회원가입" class="btn-sm btn-info" id="joinBtn">
									<input type=button value="취소" class="btn-sm btn-warning" onclick="javascript:history.back()">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</main>
		</div>
	</div>
</body>
</html>