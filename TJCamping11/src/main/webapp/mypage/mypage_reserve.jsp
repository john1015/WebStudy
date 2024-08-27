<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.resRow{
  width: 800px
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	
	$('.infos').click(function(){
		let rno=$(this).attr("data-rno")
		$.ajax({
			type:'post',
			url:'../mypage/mypage_reserve_info.do',
			data:{"rno":rno},
			success: function(json) {
		        // json이 JavaScript 객체인 경우
		        console.log(json); // debug
		        $('#info').show();
		        $('#poster').attr("src", json.poster);
		        $('#name').text(json.name);
		        $('#address').text(json.address);
		        $('#phone').text(json.phone);
		        $('#price').text(json.price);
		        $('#rno').text(json.rno);
		        $('#rdate').text(json.day);
		        $('#rtime').text(json.time);
		        $('#rinwon').text(json.inwon);
		        $('#regdate').text(json.regdate);
		    },

			error:function(request,status,error){
				console.log(error)
			}
		})
	})
})
</script>
</head>
<body>

<div class="wrapper row3">
  <main class="container clear">
   <div class="row resRow">
    <table class="table">
     <tr>
      <th class="text-center">번호</th>
      <th class="text-center"></th>
      <th class="text-center">캠핑장</th>
      <th class="text-center">예약일</th>
      <th class="text-center">시간</th>
      <th class="text-center">인원</th>
      <th class="text-center">상태</th>
     </tr>
     <c:forEach var="rvo" items="${rList }">
     <input type="hidden" id="camp_addr" value="${rvo.cvo.camp_addr }">
     <input type="hidden" id="camp_price" value="${rvo.cvo.camp_price }">
     <input type="hidden" id="camp_phone" value="${rvo.cvo.camp_phone}">
     <input type="hidden" id="camp_regdate" value="${rvo.regdate }">
       <tr>
          <td class="text-center" id="camp_rno">${rvo.rno }</td>
	      <td class="text-center">
	       <img src="${rvo.cvo.image1 }" style="width: 20px;height: 20px" id="campimg">
	      </td>
	      <td id=camp_name>${rvo.cvo.camp_name }</td>
	      <td class="text-center" id=camp_day>${rvo.day }</td>
	      <td class="text-center" id=camp_time>${rvo.time }</td>
	      <td class="text-center" id=camp_inwon>${rvo.inwon }</td>
	      <td class="text-center inline">
	       <c:if test="${rvo.isok=='y' }">
	        <span class="btn btn-success btn-xs infos" data-rno="${rvo.rno }">예약완료</span>
	       </c:if>
	       <c:if test="${rvo.isok=='n' }">
	        <span class="btn btn-default btn-xs">예약대기</span>
	       </c:if>
	        <a href="../mypage/mypage_reserve_cancel.do?rno=${rvo.rno }" class="btn btn-danger btn-xs">취소</a>
	      </td>
       </tr>
     </c:forEach>
    </table>
    <div style="height: 10px"></div>
    <table class="table" style="display:none" id="info">
      <caption><h4>예약 정보</h4></caption>
      <tr>
        <td width=30% class="text-center" rowspan="9">
          <img src="" style="width: 100%" id="poster">
        </td>
        <td colspan="2">
         <h3><span id="name"></span>&nbsp;<span id="score" style="color:orange;"></span></h3>
        </td>
      </tr>
      <tr>
       <th width=20% class="text-center">주소</th>
       <td width="50%" id="address"></td>
      </tr>
      <tr>
       <th width=20% class="text-center">전화</th>
       <td width="50%" id="phone"></td>
      </tr>
      <tr>
       <th width=20% class="text-center">가격</th>
       <td width="50%" id="price"></td>
      </tr>
      <tr>
       <th width=20% class="text-center">예약번호</th>
       <td width="50%" id="rno"></td>
      </tr>
      <tr>
       <th width=20% class="text-center">예약일</th>
       <td width="50%" id="rdate"></td>
      </tr>
      <tr>
       <th width=20% class="text-center">시간</th>
       <td width="50%" id="rtime"></td>
      </tr>
      <tr>
       <th width=20% class="text-center">인원</th>
       <td width="50%" id="rinwon"></td>
      </tr>
      <tr>
       <th width=20% class="text-center">신청일</th>
       <td width="50%" id="regdate"></td>
      </tr>
    </table> 
   </div>
  </main>
</div>
</body>
</html>