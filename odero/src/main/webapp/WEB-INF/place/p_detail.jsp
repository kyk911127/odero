<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	/* window.onload = function(){
	 var modal = document.getElementById('myModal');
	 var img = document.getElementById('myImg');
	 var modalImg = document.getElementById("img01");

	 img.onclick = function() {
	 alert(modal);
	 alert(img);
	 alert(modalImg);
	 modal.style.display = "none";
	 modalImg.src = this.src;
	 captionText.innerHTML = this.alt;
	 } 
	 } */
	$(function() {
		// alert("dd");
/* 		$('.place_img').click(function() {
			$('.place_img').each(function() {
				var pp = $(this).attr('src');
				//alert(pp);
				$('.fo').append("<img src='" + pp + "'>");
			});
			return;
		}); */
		
		/* $('.place_img').each(function() { 
			$('.place_img').click(function() {
				var pp = $(this).attr('src');
				alert(pp);
				$('.fo').append("<img src='" + pp + "'>");
			});
			return;
		}); */
		
		$('table').parent().children().find("td:nth-child(2):empty").parent().hide();
		
	});
</script>
</head>
<body>
	<div class="container-fluid top_container">
		<div class="row imagerow" style="position: relative; background-image: url(${backimg});">
			<c:forEach var="i" items="${simg }" end="4" varStatus="im">
				<div class="detail_img" data-target="#myModal" data-toggle="modal">
					<div style="border-left: 8px solid #fff;">
						<img class="place_img" id="pimg${im.index }" src="${i }">
						<!--  <img class="place_img" id="pimg${im.index }" src="${i }"> -->
					</div>
				</div>
			</c:forEach>
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
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<div id="modal-body">
					<h3 style="text-align: center; color: #fff">${vo.p_name }</h3>
					<!--  data-thumbmargin="20px 0"  -->
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
		<div class="row row_info">
			<h3>${vo.p_name }</h3>
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
						<td width="25%">주소</td>
						<td width="75%">${vo.p_addr }</td>
					</tr>
					<%-- <c:if test="${vo.p_tel==null}"> --%>
						<tr class="tr_tel">
							<td width="25%">전화번호</td>
							<td>${vo.p_tel }</td>
						</tr>
					<%-- </c:if> --%>
					<tr>
						<td width="25%">가격대</td>
						<td width="75%">${vo.p_price }</td>
					</tr>
					<tr>
						<td width="25%">키워드</td>
						<td width="75%">
							<ul class="tags">
							<c:forEach var="kw" items="${skeyword }" varStatus="k">
								<li class="li_1">
									<div class="tag_1">${kw }</div>
								</li>
							</c:forEach>
								<!-- <li class="li_2">
									<div class="tag_2">힐링</div>
									<div class="tag_2">휴식하기</div> <br>
								</li> -->
							</ul>
						</td>
					</tr>
					<%-- <c:if test="${vo.p_time==null}"> --%><!-- time, tell 널 -->
						<tr class="tr_time">
							<td width="25%">영업시간</td>
							<td width="75%">${vo.p_time }</td>
						</tr>
					<%-- </c:if> --%>
				</table>
			</div>
		</div>

		<div class="row row_map">
			<h3>위치</h3>
			<div id="map" style="width: 100%; height: 450px;"></div>
		</div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=90ca2826f787f6d4fc01f89cb8bcdce3"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=90ca2826f787f6d4fc01f89cb8bcdce3&libraries=services"></script>
		<script>
			var mContainer = document.getElementById('map');
			var mOptions = {
				center : new daum.maps.LatLng(33.450701, 126.570667),
				level : 3
			};
			
			// 마커가 표시될 위치입니다 
			// var markerPosition  = new daum.maps.LatLng(33.450701, 126.570667); 
			
			var map = new daum.maps.Map(mContainer, mOptions);	// 지도를 생성합니다
			
			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
			    position: mOptions.center
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			
			var iwContent = '<div style="width:150px; text-align:center; padding:6px 0;">${vo.p_name}</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			iwPosition = new daum.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성합니다
			var infowindow = new daum.maps.InfoWindow({
				position : iwPosition, 
				content : iwContent 
			});
		    
			infowindow.open(map, marker);
		</script>

		<div class="row row_reply">
			<h3>${vo.p_name }의 리뷰(10)</h3>
			<table class="reply_list">
				<c:forEach var="i" begin="1" end="3">
					<tr style="border-bottom: 1px solid #dbdbdb;">
						<td width="13%">
							<div class="user_info">
								<div class="user_img">
									<img src="p_image/user.png" class="im">
								</div>
								<div class="user_name" style="margin-top: 10px">달해</div>
							</div>
						</td>
						<td width="87%" style="padding: 20px 0">
							<div class="reply_info">
								<p class="reply_content">외국에 온 것 같은 느낌이 드는 카페. 천장도 높고 문도
									크으고. 벽면의 그림들도 큼직큼직. 시원시원해서 좋아요! 테이블 사이 간격도 넓습니다. 핸드 드립 커피도 마실 수
									있고요 아침에는 모닝 빵 뷔페도 해요! 음료 가격 + 9,000원(?) 정도 내면 그날 갓 구운 빵과 샐러드,
									햄, 스크램블 등을 드실 수 있습니다. 저는 페퍼민트 티와 티라미수를 주문했어요. 페퍼민트티는 질 안 좋은 거
									마시면 되게 역한데.. 여기는 향과 맛이 훌륭했어요! 브루잉 도구도 같이 줘서 좋구요. 티라미수는 마스카포네의
									깊은 맛이 잘 느껴져요. 밑의 시트는 에스프레소에 흥건히 적셔져 있습니다. 퀄리티있는 커피라 맛은 있지만 조금 덜
									적셔주면 더 좋을 것 같아요.</p>
								<span class="reply_date">2018-01-02</span>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div class="row row_reply">
			<div class="col-md-12" style="padding: 0px 20px">
				<h4>
					<span class="com_title"><b>리뷰쓰기</b></span>
				</h4>
				<div class="reply_write">
					<form method="post" action="p_reply_insert.do">
						<input type="hidden" name="" value="${vo.p_no }">
						<table width="100%">
							<tr valign="top">
								<td width="90%">
									<textarea class="reply_ta" rows="3" cols="90" name="msg"></textarea>
								</td>
								<td width="10%">
									<input type="button"	class="btn btn-info btn-sm pull-right" value="등    록" style="width: 80px; height: 100px">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
