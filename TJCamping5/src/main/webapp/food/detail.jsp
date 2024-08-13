<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    var itemsToShow = 4;
    var allItems = $('#image-list li');
    var totalItems = allItems.length;

    // 처음에 4개의 항목만 보이게 설정하고 나머지는 숨깁니다.
    allItems.slice(itemsToShow).hide();

    $('#loadMoreBtn').on('click', function() {
        var hiddenItems = $('#image-list li:hidden');
        var visibleItems = $('#image-list li:visible').length;

        if (hiddenItems.length > 0 && hiddenItems.length > itemsToShow) {
            // 숨겨진 항목이 있고, 더 숨길 항목이 있을 경우
            hiddenItems.slice(0, itemsToShow).slideDown();
            $('#loadMoreBtn').text('닫기');
        } else if (hiddenItems.length > 0) {
            // 숨겨진 항목이 남아 있지만, 더 숨길 항목이 없을 경우
            hiddenItems.slideDown();
            $('#loadMoreBtn').text('닫기');
        } else {
            // 모든 항목이 보이는 경우, 처음 4개만 보이게 되돌리기
            allItems.slice(itemsToShow).slideUp();
            $('#loadMoreBtn').text('더보기');
        }
    });

    // "닫기" 상태에서 모든 항목을 보이도록 하는 초기 처리
    $('#loadMoreBtn').on('click', function() {
        if ($(this).text() === '닫기') {
            allItems.slideDown();
            $(this).text('닫기');
        }
    });
});
$(function(){
	// detail.do?fno=2&type=1
	replyList(${param.fno})
	$('#writeBtn').on('click',function(){
		let msg=$('#msg').val()
		if(msg.trim()==="")
		{
			$('#msg').focus()
			return
		}
		let cno=$(this).attr("data-cno")
		
		$.ajax({
			type:'post',
			url:'../all_reply/insert.do',
			data:{"cno":cno,"type":1,"msg":msg},
			success:function(result)
			{
				if(result==='OK')
				{
					replyList(cno)
				}
				else
				{
					alert(result)
				}
			},
			error:function(request,status,error)
			{
				console.log(error)
			}
		})
	})
	
	/*  let bCheck=false;*/
	 	$('#jjimBtn').on('click',function(){
		let cno = $(this).attr("data-cno")
		// ajax이용 type=1

		$.ajax({
			type:'post',
			url:'../all_jjim/insert.do' ,
			data:{"cno":cno,"type":1} ,
			success:function(result){
				if(result==="OK"){
					$(this).attr("data-count",1);
					$(this).attr("class",'btn-xs btn-default')
					location.href="../food/detail.do?fno="+cno+"&type=1"
				} else{
					alert(result)
				}
			} ,
			error:function(request,status,error)
			{
				console.log(error)
			}
		})
		
	}) 
})
// 삭제
function replyDelete(rno,cno)
{
	$.ajax({
		type:'post',
		url:'../all_reply/delete.do',
		data:{"rno":rno},
		success:function(result)
		{
			if(result==="OK")
			{
				replyList(cno)
			}
			else
			{
				alert(result)
			}
		},
		error:function(request,status,error)
		{
			console.log(error)
		}
	})
}
function replyUpdate(rno)
{
	$('.updates').hide()
	$('#m'+rno).show()
}
function replyUpdateData(rno,cno)
{
	let msg=$('#msg'+rno).val()
	if(msg.trim()==="")
	{
		$('#msg'+rno).focus()
		return
	}
	$.ajax({
		type:'post',
		url:'../all_reply/update.do',
		data:{"rno":rno,"msg":msg},
		success:function(result)
		{
			if(result==='OK')
			{
				replyList(cno)
				
			}
			else
			{
				alert(result)
			}
			$('#m'+rno).hide()
		},
		error:function(request,status,error)
		{
			console.log(error)
		}
	})
}
function replyList(cno)
 {
	 $.ajax({
		 type:'post',
		 url:'../all_reply/list.do',
		 data:{"cno":cno,"type":1},
		 success:function(json)
		 {
			 json=JSON.parse(json)
			 let html=''
			 
			 json.map(function(reply){
				 //for(let reply of json){
				     html+='<table class="table">'
					 html+='<tr>'
					 html+='<td class="text-left">◑'+reply.name+'('+reply.dbday+')</td>'
					 html+='<td class="text-right">'
				      if(reply.id===reply.sessionId)
				      {
				    	  html+='<span class="btn btn-xs btn-success ups" onclick="replyUpdate('+reply.rno+')">수정</span>&nbsp;' 
				    	  html+='<input type=button class="btn btn-xs btn-warning" value="삭제" onclick="replyDelete('+reply.rno+','+reply.cno+')">' 
				      }
					 html+='</td>'
					 html+='</tr>'
					 html+='<tr>'
					 html+='<td colspan="2">'
					 html+='<pre style="white-space:pre-wrap;border:none;background:white">'+reply.msg+'</pre>'
					 html+='</td>'
					 html+='</tr>'
				     html+='<tr class="updates" id="m'+reply.rno+'" style="display:none">'
				     html+='<td>'
				     html+='<textarea rows="4" cols="70" id="msg'+reply.rno+'" style="float: left">'+reply.msg+'</textarea>'
				     html+='<input type=button value="댓글수정" onclick="replyUpdateData('+reply.rno+','+reply.cno+')" style="width: 100px;height: 85px;background-color: green;color:black">'
				     html+='</td>'
				     html+='</tr>'
					 html+='</table>'
				 //}
			 })
			 console.log(html)
			 $('#reply').html(html)
			 $('#msg').val("")
		 },
		 error:function(request,status,error)
		 {
			 console.log(error)
		 }
	 })
 }
</script>
</head>
<body>
	<div class="wrapper row3">
		<main class="container clear">
			<h2 class="sectiontitle">상세보기</h2>


			<%-- 상세보기 / 댓글 --%>
			<table class="table">
				<tr>
					<td width="30%" class="text-center" rowspan="6"><img
						src="http://menupan.com${vo.poster }" style="width: 100%"></td>
					<td colspan="2">
						<h3>${vo.name }&nbsp;<span style="color: orange">${vo.score }</span>
						</h3>
					</td>
				</tr>
				<tr>
					<td class="text-right" style="color: gray" width="5%">업종</td>
					<td width="65%">${vo.type }</td>
				</tr>
				<tr>
					<td class="text-right" style="color: gray" width="5%">전화</td>
					<td width="65%">${vo.phone }</td>
				</tr>
				<tr>
					<td class="text-right" style="color: gray" width="5%">주소</td>
					<td width="65%">${vo.address }</td>
				</tr>
				<tr>
					<td class="text-right" style="color: gray" width="5%">테마</td>
					<td width="65%">${vo.theme }</td>
				</tr>
				<tr>
					<td class="text-right" style="color: gray" width="15%">주차</td>
					<td width="65%">${vo.parking }</td>
				</tr>
				<tr>
					<td colspan="3" class="text-right">
					
						<div class="flexslider carousel basiccarousel btmspace-80">
							<ul class="slides"
								style="display: flex; padding: 0; margin: 0; list-style: none;">
								<c:forTokens items="${vo.images}" delims="^" var="image">
									<li style="margin-right: 10px;">
										<figure>
											<img class="radius-10 btmspace-10"
												src="http://menupan.com${image }"
												style="width: 80px; height: 80px;">
										</figure>
									</li>
								</c:forTokens>
							</ul>
						</div> 
						<c:if test="${sessionScope.id!=null }">
							<a href="#" class="btn btn-xs btn-success">좋아요</a>
							<c:if test="${check==false }">
								<input type=button class="btn btn-xs btn-warning" value="찜하기"
									id="jjimBtn" data-cno="${vo.fno }">
							</c:if>
							<c:if test="${check==true }">
								<span class="btn btn-xs btn-default">찜하기</span>
							</c:if>
							<a href="#" class="btn btn-xs btn-info">예약하기</a>
						</c:if>
						<input type="button" class="btn btn-xs btn-danger" value="목록"onclick="javascript:history.back()"></td>
				</tr>
			</table>
			<table class="table">
				<tr>
					<td>${vo.content }</td>
				</tr>
			</table>

			<div style="height: 10px"></div>
			<div id="map" style="width: 100%; height: 350px;"></div>

			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9965c727d3306713c47391be682e4be9&libraries=services"></script>
			<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${vo.address}', function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.name}</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
		</script>
			<h2 class="sectiontitle">댓글</h2>
			<table class="table" id="reply_table">
				<tbody>
					<tr>
						<td id="reply"></td>
					</tr>
				</tbody>
			</table>
			<c:if test="${sessionScope.id!=null }">
				<table class="table">
					<tr>
						<td><textarea rows="4" cols="100" id="msg"
								style="float: left"></textarea> <input type=button value="댓글쓰기"
							style="width: 100px; height: 85px; background-color: green; color: black"
							id="writeBtn" data-cno="${vo.fno }"></td>
					</tr>
				</table>
			</c:if>
			<div style="height: 20px"></div>
			
			<!-- 
			<h2 class="sectiontitle">인근 맛집</h2>
			<div class="packages-carousel owl-carousel">
                    <div class="packages-item">
                        <div class="packages-img">
                            <div class="packages-info d-flex border border-start-0 border-end-0 position-absolute" style="width: 100%; bottom: 0; left: 0; z-index: 5;">
                               <c:forEach var="rvo" items="${rList}">
                                <img class="img-fluid w-100 rounded-top" alt="Image"
									src="http://menupan.com${rvo.poster}"
									style="width: 100%; height: auto;" title="${rvo.address}">
								<figcaption>
									<a href="../food/detail_before.do?fno=${rvo.fno }&type=1">${rvo.name}</a>
								</figcaption>
								</c:forEach>
                            </div>
                            <div class="text-center packages-price py-2 px-4">Best</div>
                        </div>
                      </div>
                   </div>
			
			 -->
			<h2 class="sectiontitle">인근 맛집</h2>
			<div class="flexslider carousel basiccarousel btmspace-80">
				<ul class="slides" id="image-list"
					style="padding: 0; margin: 0; list-style: none; display: flex; flex-wrap: wrap; justify-content: space-between;">
					<c:forEach var="rvo" items="${rList}">
						<li
							style="flex: 1 0 22%; margin-right: 1%; margin-bottom: 20px; box-sizing: border-box;">
							<figure style="margin: 0;">
								<img class="radius-10 btmspace-10"
									src="http://menupan.com${rvo.poster}"
									style="width: 100%; height: auto;" title="${rvo.address}">
								<figcaption>
									<a href="../food/detail_before.do?fno=${rvo.fno }&type=1">${rvo.name}</a>
								</figcaption>
							</figure>
						</li>
					</c:forEach>
				</ul>
			</div>
			<button id="loadMoreBtn" style="display: block; margin: 20px auto;">더보기</button>
		</main>
	</div>
</body>
</html>