<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 1~100까지 => 짝수합 / 홀수합 / 전체합
		int sum=0,even=0,odd=0;
		for(int i=1;i<=100;i++){
				sum+=i;
				if(i%2==0) even+=i;
				else odd+=i;
		}
	%>
	<%="1~100까지 총합 : "+sum %><br>
	<%="1~100까지 짝수 총합 : "+even%><br>
	<%="1~100까지 홀수 총합 : "+odd %><br>
</body>
</html>