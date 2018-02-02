<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> -->
<link rel="stylesheet" type="text/css" href="css/p_detail.css">
<!-- <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script> -->

<!-- 1. Link to jQuery (1.8 or later), -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- fotorama.css & fotorama.js. -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
<script type="text/javascript">
$(function() {
	$('.modifyBtn').click(function() {
		var no = $(this).attr("value");
		var type = $(this).text();
		if (type == '수정') {
			$('#up' + no).show();
			$(this).text("취소");
		} else {
			$('#up' + no).hide();
			$(this).text("수정");
		}
	}); 

	$('#replyBtn').click(function(){
		var check = ${sessionScope.m_id != null}
		var msg = $('#pr_msg').val();
		if(check) {
			if(msg.trim()==""){
				alert('댓글을 입력하세요');
				$('#pr_msg').focus();
				return;
			} else {
				$('#pReply').submit();
			}
		} else {
			alert("로그인이 필요합니다.");
		} 
	});

	$('table').parent().children().find("td:nth-child(2):empty").parent().hide();
});
</script>
</head>
<body>
	<div class="container-fluid top_container">
		<div class="row imagerow" style="background-image : url(${backimg})" >
			<div style="width: 100%; height: 100%; background-color: black; position: absolute; opacity:0.4"></div>
			<div class="inner">
			<c:forEach var="i" items="${simg }" end="4" varStatus="im">
				<div class="detail_img" data-target="#myModal" data-toggle="modal">
					<div>
						<img class="place_img" id="pimg${im.index }" src="${i }">
					</div>
				</div>
			</c:forEach>
			</div>
			<div>
				<a href="#" data-target="#myModal" data-toggle="modal">
					<div class="img_more">
						<p class="i_more">
							사진 더보기 &nbsp;<img src="p_image/right-arrow.png">
						</p>
					</div>
				</a>
			</div>
		</div>
	</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg bora">
			<div class="modal-content mo_content">
				<div class="modal-header">
     				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
      					<span aria-hidden="true" style="color: white;">X</span><span class="sr-only">Close</span>
    				 </button>
     				<h3 style="text-align: center; color: #fff">${vo.p_name }</h3>
     			</div>
				<div id="modal-body">
					<div class="fotorama fo" data-width="800" data-maxwidth="100%"
						data-ratio="16/9" data-allowfullscreen="true" data-nav="thumbs" data-thumbfit="cover">
						 <c:forEach var="i" items="${simg }">
                        <img src="${i }">
                     </c:forEach> 
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container mid_container">
		<div class="row1 row_info">
			<div class="p_h">
				<h3 style="font-weight: bold;">${vo.p_name }</h3>
				<img src="view1.png"> 110
			</div>
			<div style="padding: 15px; border-bottom: 1px solid #dbdbdb;">
				<!-- <span class="glyphicon glyphicon-tent" aria-hidden="true"></span> 이색/체험 -->
				<c:if test="${vo.p_grade=='p' }">
					<span class="cate_span"> 
						<img class="cate_icon" src="p_image/tent.png">&nbsp; 이색/체험
					</span> 
				</c:if>
				<c:if test="${vo.p_grade=='f' }">
					<span class="cate_span">
						<img class="cate_icon" src="p_image/restaurant.png">&nbsp; 맛집
					</span> 
				</c:if>
				<c:if test="${vo.p_grade=='c' }">
					<span class="cate_span"> 
						<img class="cate_icon" src="p_image/coffee.png">&nbsp; 까페
					</span>
				</c:if>

				<table style=" width: 550px ; margin: 20px 0;">
					<tr>
						<td class="p_td" width="25%">주소</td>
						<td class="p_td" width="75%">${vo.p_addr }</td>
					</tr>
					<tr class="tr_tel">
						<td class="p_td" width="25%">전화번호</td>
						<td class="p_td">${vo.p_tel }</td>
					</tr>
					<tr>
						<td class="p_td" width="25%">가격대</td>
						<td class="p_td" width="75%">${vo.p_price }</td>
					</tr>
					<tr>
						<td class="p_td" width="25%">키워드</td>
						<td class="p_td" width="75%">
							<ul class="tags">
							<c:forEach var="kw" items="${skeyword }" varStatus="k">
								<li class="li_1">
									<div class="tag_1">${kw }</div>
								</li>
							</c:forEach>
							</ul>
						</td>
					</tr>
					<tr class="tr_time">
						<td class="p_td" width="25%">영업시간</td>
						<td class="p_td" width="75%">${vo.p_time }</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="row1 row_map">
			<h3 class="p_h">위치</h3>
			<div id="map" style="width: 100%; height: 450px;"></div>
		</div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=90ca2826f787f6d4fc01f89cb8bcdce3&libraries=services"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	   			mapOption = {
	        		center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        		level: 3 // 지도의 확대 레벨
	  			};  

			// 지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption); 

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch("${p_addr}", function(result, status) {
		    	// 정상적으로 검색이 완료됐으면 
				if (status === daum.maps.services.Status.OK) {
		        	var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		        	// 결과값으로 받은 위치를 마커로 표시합니다
		        	var marker = new daum.maps.Marker({
		            	map: map,
		            	position: coords
		        	});
		        	// 인포윈도우로 장소에 대한 설명을 표시합니다
		        	var infowindow = new daum.maps.InfoWindow({
		            	content: '<div style="width:150px; text-align:center; padding:6px 0;">${vo.p_name}</div>'
		        	});
		        	infowindow.open(map, marker);
	
		        	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		       	map.setCenter(coords);
		    	} 
			});    
		</script>

		<div class="row1 row_reply">
			<h3 class="p_h3">${vo.p_name }의 댓글(${vo.count })</h3>
			<table class="reply_list" style="font-size: ">
				<c:if test="${vo.count==0 }">
					<div class="text-center" style="margin: 40px 0">
						<p>첫번째 댓글을 남겨주세요.</p>
					</div>
				</c:if>
				<c:if test="${vo.count!=0 }">
				<c:forEach var="rvo" items="${r_list }">
					<tr>
						<td class="p_td" rowspan="2">
							<div class="user_info">
								<div class="user_img">
									<img src="p_image/user.png" class="im" width="45px">
								</div>
								<div class="user_name" style="margin-top: 10px" name="m_id">${rvo.m_id }</div>
							</div>
						</td>
						<td class="p_td" width="87%">
							<div class="reply_info">
								<span class="reply_date">
									<fmt:formatDate value="${rvo.pr_regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
								</span>
								<c:if test="${sessionScope.m_id==rvo.m_id }">
									<form method=post action="p_reply_delete.do" style="display: inline-block; float: right; margin-left: 5px">
										<input type="hidden" name=p_no value="${rvo.p_no }"> 
										<input type="hidden" name=pr_no value="${rvo.pr_no }">
										<button class="btn btn-sm btn-default" id="deleteBtn">삭제</button>
									</form>
									<button class="btn btn-sm btn-default modifyBtn" value="${rvo.pr_no }" style="float: right;">수정</button>
								</c:if>	
								<div id="up${rvo.pr_no }" style="display: none">
									<form method=post action="p_reply_update.do">
										<input type="hidden" name=pr_no value="${rvo.pr_no }">
										<textarea rows="3" class="com_2 form-control text-left" style="float: left; margin-top: 5px" name="pr_msg">${rvo.pr_msg }</textarea>
										<br> &nbsp; 
										<input class="btn btn-default btn-sm pull-right" type=submit style="margin-top: 5px" value="수정하기">
									</form>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<p class="p_msg">${rvo.pr_msg }</p>
						</td>
					</tr>
				</c:forEach>
				</c:if>
			</table>
		</div>

		<div class="row1 row_reply" style="margin-bottom: 15px">
			<div class="col-md-12" style="padding: 0px 20px">
				<h4 style="text-align: left; margin-left: 10px">
					<span class="com_title"><b>댓글남기기</b></span>
				</h4>
				<div class="reply_write">
					<form method="post" action="p_reply_insert.do" id="pReply">
						<input type="hidden" name="p_no" value="${vo.p_no }">
						<table width="100%">
							<tr valign="top">
								<td class="p_td" width="86%">
									<textarea class="reply_ta" rows="3" name="pr_msg" id="pr_msg"></textarea>
								</td>
								<td class="p_td" width="9%">
									<input id="replyBtn" type="button"	class="btn btn-sm pull-right" value="등    록" style="width: 80px; height: 100px">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div class="text-right">
			<input type="button" class="btn btn-md" id="backBtn" value="이전으로" onclick="javascript:history.back()">
		</div>
	</div>
</body>
</html>
