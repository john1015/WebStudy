<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.load=()=>{
	let a=10
	if(a%2) document.write(a+"는 짝수입니다")
}
function login(){
	let id=document.getElementById("id").value
	if(id.trim()===""){
		alert("아이디를 입력하세요")
	}
}
</script>
</head>
<body>
	ID : <input type=text size=10 id=id>
	<input type="button" value="login" onclick="login()">
</body>
</html>