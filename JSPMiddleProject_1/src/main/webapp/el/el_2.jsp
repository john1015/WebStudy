<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	EL은 out.println()과 같다 => 데이터를 출력 (브라우저) => 결과값을 출력
	=> 조건 / 연산자
	
	연산자
		산술 연산자
			+, -, *, /, %
			=> 자바가 아니기 때문에 => 순수하게 산술 처리만 가능 (+ : 문자열 결합이 불가능)
			=> "10" => 자동으로 정수화 (Integer.parseInt()) => 10
				${10+10} => 20
				${10+"10"} => 20 // "10"은 정수로 변경
				${null+10} => 10 // null은 자동으로 0으로 대체
			=> 문자열 결합
				${10+="10"} => 1010
			=> / : 나누기 => 정수/정수=실수
				${5/2} => 2.5
				=> ${5/2} = ${5 div 2}
			=> % : 나머지
				${5%2} => 1
				=> ${5%2} = ${5 mod 2}
		비교 연산자
			==(eq), !=(ne), <(lt), >(gt), <=(le), >=(ge)
		논리 연산자 : 두개의 조건을 처리
			&& : 범위/기간 포함 => and
				직렬 : 조건 두개가 true일 때만 true
			|| : 범위가 아닌 경우 => or
				병렬 : 조건 둘 중에 1개 이상이 true
		삼항 연산자
			(조건)?값1:값2
			=> 조건이 true일 경우 => 값1
			=> 조건이 false일 경우 => 값2
			======================== if ~ else => 페이지 처리 => 소스 간결
			                         => 웹 처리 / 게임
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>산술 연산자 (EL)</h1>
	<%--
	&#36;{10+10}=${10+10 }<br>			=> ${10+10}=20
	&#36;{10+"10"}=${10+"10" }<br>		=> ${10+"10"}=20
	&#36;{null+10 }=${null+10 }<br>		=> ${null+10 }=10
	&#36;{10-"1" }=${10-"1" }<br>		=> ${10-"1" }=9
	&#36;{5/2 }=${5/2 }<br>				=> ${5/2 }=2.5
	&#36;{5 div 2 }=${5 div 2 }<br>		=> ${5 div 2 }=2.5
	&#36;{5%2 }=${5%2 }<br>				=> ${5%2 }=1
	&#36;{5 mod 2 }=${5 mod 2 }<br>		=> ${5 mod 2 }=1
	&#36;{10+="10"}=${10+="10"}			=> ${10+="10"}=1010
	--%>
	<h1>비교 연산자 (EL) : ==, !=, &lt;, &gt;, &lt;=, &gt;= / 결과값 : true/false 조건문</h1>
	<%--
		==		10==10		10 eq 10
		!=		10!=10		10 ne 10
		<		10<10		10 lt 10
		>		10>10		10 gt 10
		<=		10<=10		10 le 10
		>=		10>=10		10 ge 10
		
		/ 	div
		% 	mod
		&& 	and
		|| 	or
	--%>
	<sub>비교 연산자는 숫자, 문자열, 날짜</sub><br>
	<%--
	&#36;{10==10 }=${10==10 }<br>
	&#36;${10==10 }=${10==10 }<br>
	&#36;{10 eq 10 }=${10 eq 10 }<br>
	&#36;{10!=10 }=${10!=10 }<br>
	&#36;{10 ne 10 }=${10 ne 10 }<br>
	&#36;{10 < 10 }=${10 < 10 }<br>
	&#36;{10 lt 10 }=${10 lt 10 }<br>
	&#36;{10 > 10 }=${10 > 10 }<br>
	&#36;{10 gt 10 }=${10 gt 10 }<br>
	&#36;{10<=10 }=${10<=10 }<br>
	&#36;{10 le 10 }=${10 le 10 }<br>
	&#36;{10>=10 }=${10>=10 }<br>
	&#36;{10 ge 10 }=${10 ge 10 }<br>
	
	(결과값)
	${10==10 }=true
	$true=true
	${10 eq 10 }=true
	${10!=10 }=false
	${10 ne 10 }=false
	${10 < 10 }=false
	${10 lt 10 }=false
	${10 > 10 }=false
	${10 gt 10 }=false
	${10<=10 }=true
	${10 le 10 }=true
	${10>=10 }=true
	${10 ge 10 }=true
	--%>
	
	<%--
	&#36;{"홍길동"=="심청이"}=${"홍길동"=="심청이"}<br>
	&#36;{"홍길동" eq "심청이"}=${"홍길동" eq "심청이"}<br>
	
	&#36;{"홍길동"!="심청이"}=${"홍길동"!="심청이"}<br>
	&#36;{"홍길동" ne "심청이"}=${"홍길동" ne "심청이"}<br>
	
	&#36;{"홍길동"<"심청이"}=${"홍길동"<"심청이"}<br>
	&#36;{"홍길동" lt "심청이"}=${"홍길동" lt "심청이"}<br>
	
	&#36;{"홍길동">"심청이"}=${"홍길동">"심청이"}<br>
	&#36;{"홍길동" gt "심청이"}=${"홍길동" gt "심청이"}<br>
	
	&#36;{"홍길동"<="심청이"}=${"홍길동"<="심청이"}<br>
	&#36;{"홍길동" le "심청이"}=${"홍길동" le "심청이"}<br>
	
	&#36;{"홍길동">="심청이"}=${"홍길동">="심청이"}<br>
	&#36;{"홍길동" ge "심청이"}=${"홍길동" ge "심청이"}<br>

	&#36;{10>6 && 5==6}=${10>6 && 5==6}<br>
	&#36;{10>6 and 5==6}=${10>6 and 5==6}<br>

	&#36;{10>6 || 5==6}=${10>6 || 5==6}<br>
	&#36;{10>6 or 5==6}=${10>6 or 5==6}<br>
	
	(결과값)
	${"홍길동"=="심청이"}=false
	${"홍길동" eq "심청이"}=false
	${"홍길동"!="심청이"}=true
	${"홍길동" ne "심청이"}=true
	${"홍길동"<"심청이"}=false
	${"홍길동" lt "심청이"}=false
	${"홍길동">"심청이"}=true
	${"홍길동" gt "심청이"}=true
	${"홍길동"<="심청이"}=false
	${"홍길동" le "심청이"}=false
	${"홍길동">="심청이"}=true
	${"홍길동" ge "심청이"}=true
	${10>6 && 5==6}=false
	${10>6 and 5==6}=false
	${10>6 || 5==6}=true
	${10>6 or 5==6}=true
	--%>
	
	&#36;{10>6?"A":"B"}=${10>6?"A":"B"}
	<%--
	(결과값)
	${10>6?"A":"B"}=A
	--%>
</body>
</html>