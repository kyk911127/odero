<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

<style type="text/css">
/* div{
	border : 1px solid black;
} */
.sc_box {
	margin-top: 7%;
	width: 100%;
	margin: 0px auto;
}

/*소제목 1틀  */
.sc_title {
	width: 60%;
	margin: 2% auto;
	border: 1px solid #E6E6E6;
	padding: 1%;
	margin-bottom: 30px;
}

.tag-title {
	margin-top: 8px;
	float: left;
}

.date {
	position: relative;
	/*감싸는 레이어에 포지션 속성을 잡아주는 게 필수!(relative, absolute, fixed 중 택1*/
	width: 100%;
	height: 2000px;
	text-align: center;
	line-height: 100px; /* 
		margin:0 auto;   */
	color: #000;
	font-size: 12px;
	background-color: #E0ECF8;
}

.date_rc {
	position: absolute;
	width: 70%;
	height: 1200px;
	text-align: center;
	margin: 10%;
}

.box {
	padding: 0 20px 20px 20px;
}

.box .box-content:hover {
	border: 2px solid #525C7A;
}

.box .box-content {
	padding: 16px;
	border-radius: 0 0 2px 2px;
	background-clip: padding-box;
	box-sizing: border-box;
	background: #fff;
	transition: all 0.2s ease;
	border: 2px dashed #DFE2E6;
	margin-top: 10px;
	box-sizing: border-box;
	border-radius: 5px;
	background-clip: padding-box;
	padding: 0 20px 20px 20px;
	min-height: 340px;
}

.box .box-content p {
	color: #515c66;
	text-transform: none;
}

.row {
	margin: 0px;
	margin-bottom: 30px;
}

.rc_box {
	padding-top: 3%;
}

.title {
	margin: 2%;
}

.big_title {
	width: 50%;
	padding: 2%;
	background-color: #fff;
	margin: 0px auto;
}

#Mymodal {
	position: fixed;
	top: 25%;
	height: 300px;
}

.tmap_1 {
	width: 80%;
	height: 70%;
	margin: 0px auto;
}

.tmap_2 {
	width: 63%;
	height: 230px;
	background-color: #FAFAFA;
	padding: 1%;
}

.btn-like {
	height: 50px;
}

.like {
	background-color: #F3ABBA;
	font-color: #ffffff;
}

.tmap_td {
	border-bottom: 1.5px solid #888;
}

.tmap_td_b {
	border-top: 2px solid #888;
}

.tmap_table {
	width: 100%;
	height: 50px;
}

.tmap_title {
	font-size: 18px;
	float: left;
}

.tmap_detail {
	font-size: 12px;
}

.tmap_res {
	font-size: 13px;
}

.tmap_wrap {
	padding: 2%;
	background: #666;
	color: #fff;
	width: 100%;
}

.rc_title {
	margin: 2%;
}

.rc {
	background-color: #FAFAFA;
	margin-top: 0%;
}

.sc_ti {
	color: #2E2E2E;;
	height: 30px;
	font-weight: bold;
}

.rc_detail {
	font-size: 5px;
}
</style>



</head>
<body>
	<div class="container-fluid sc">
		<div class="sc_title">
			<h2 class="sc_ti text-center">추 천 코 스</h2>
			<br>
			<h4 class="sc_ti text-center">▼▼▼▼▼</h4>
		</div>
		<div class="sc_box">
			<!--지도  -->
			<div class="tmap_1">
				<div id="map" style="width: 100%; height: 550px"></div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f71a358ab1852f4a6dd2eee5070f7a02"></script>
				<script>
					var container = document.getElementById('map');
					var options = {
						center : new daum.maps.LatLng(33.450701, 126.570667),
						level : 3
					};

					var map = new daum.maps.Map(container, options);

					var MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
					MARKER_HEIGHT = 36, // 기본, 클릭 마커의 높이
					OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
					OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
					OVER_MARKER_WIDTH = 40, // 오버 마커의 너비
					OVER_MARKER_HEIGHT = 42, // 오버 마커의 높이
					OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
					OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
					SPRITE_MARKER_URL = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites2.png', // 스프라이트 마커 이미지 URL
					SPRITE_WIDTH = 126, // 스프라이트 이미지 너비
					SPRITE_HEIGHT = 146, // 스프라이트 이미지 높이
					SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격

					var markerSize = new daum.maps.Size(MARKER_WIDTH,
							MARKER_HEIGHT), // 기본, 클릭 마커의 크기
					markerOffset = new daum.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
					overMarkerSize = new daum.maps.Size(OVER_MARKER_WIDTH,
							OVER_MARKER_HEIGHT), // 오버 마커의 크기
					overMarkerOffset = new daum.maps.Point(OVER_OFFSET_X,
							OVER_OFFSET_Y), // 오버 마커의 기준 좌표
					spriteImageSize = new daum.maps.Size(SPRITE_WIDTH,
							SPRITE_HEIGHT); // 스프라이트 이미지의 크기

					var positions = [ // 마커의 위치
					new daum.maps.LatLng(33.44975, 126.56967),
							new daum.maps.LatLng(33.450579, 126.56956),
							new daum.maps.LatLng(33.4506468, 126.5707) ], selectedMarker = null; // 클릭한 마커를 담을 변수

					var mapContainer = document.getElementById('map'), // 지도를 표시할 div
					mapOption = {
						center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};

					var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

					// 지도 위에 마커를 표시합니다
					for (var i = 0, len = positions.length; i < len; i++) {
						var gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
						originY = (MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
						overOriginY = (OVER_MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
						normalOrigin = new daum.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
						clickOrigin = new daum.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
						overOrigin = new daum.maps.Point(gapX * 2, overOriginY); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표

						// 마커를 생성하고 지도위에 표시합니다
						addMarker(positions[i], normalOrigin, overOrigin,
								clickOrigin);
					}

					// 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
					function addMarker(position, normalOrigin, overOrigin,
							clickOrigin) {

						// 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
						var normalImage = createMarkerImage(markerSize,
								markerOffset, normalOrigin), overImage = createMarkerImage(
								overMarkerSize, overMarkerOffset, overOrigin), clickImage = createMarkerImage(
								markerSize, markerOffset, clickOrigin);

						// 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
						var marker = new daum.maps.Marker({
							map : map,
							position : position,
							image : normalImage
						});

						// 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
						marker.normalImage = normalImage;

						// 마커에 mouseover 이벤트를 등록합니다
						daum.maps.event.addListener(marker, 'mouseover',
								function() {

									// 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
									// 마커의 이미지를 오버 이미지로 변경합니다
									if (!selectedMarker
											|| selectedMarker !== marker) {
										marker.setImage(overImage);
									}
								});

						// 마커에 mouseout 이벤트를 등록합니다
						daum.maps.event.addListener(marker, 'mouseout',
								function() {

									// 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
									// 마커의 이미지를 기본 이미지로 변경합니다
									if (!selectedMarker
											|| selectedMarker !== marker) {
										marker.setImage(normalImage);
									}
								});

						// 마커에 click 이벤트를 등록합니다
						daum.maps.event
								.addListener(
										marker,
										'click',
										function() {

											// 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
											// 마커의 이미지를 클릭 이미지로 변경합니다
											if (!selectedMarker
													|| selectedMarker !== marker) {

												// 클릭된 마커 객체가 null이 아니면
												// 클릭된 마커의 이미지를 기본 이미지로 변경하고
												!!selectedMarker
														&& selectedMarker
																.setImage(selectedMarker.normalImage);

												// 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
												marker.setImage(clickImage);
											}

											// 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
											selectedMarker = marker;
										});
					}

					// MakrerImage 객체를 생성하여 반환하는 함수입니다
					function createMarkerImage(markerSize, offset, spriteOrigin) {
						var markerImage = new daum.maps.MarkerImage(
								SPRITE_MARKER_URL, // 스프라이트 마커 이미지 URL
								markerSize, // 마커의 크기
								{
									offset : offset, // 마커 이미지에서의 기준 좌표
									spriteOrigin : spriteOrigin, // 스트라이프 이미지 중 사용할 영역의 좌상단 좌표
									spriteSize : spriteImageSize
								// 스프라이트 이미지의 크기
								});

						return markerImage;
					}
				</script>
			</div>

			<center>
				<div class="tmap_2">
					<center>
						<table class="tmap_table">
							<tr>
								<td width=47% class="tmap_td"></td>
								<td width=6% rowspan="2" class="text-center"><h4>
										<b>거리계산</b>
									</h4></td>
								<td width=47% class="tmap_td"></td>
							</tr>
							<tr>
								<td class="tmap_td_b"></td>
								<td class="tmap_td_b"></td>
							</tr>
						</table>
					</center>
					<table width="95%" height="100px">
						<tr>
							<!--1번  -->
							<td width="24%">
								<table class="tmap_wrap">
									<tr>
										<td style="padding: 3%;">
											<h4 style="float: left;">
												<scan class="glyphicon glyphicon-home"
													style="margin-right:10px;">가게이름 
											</h4>
										</td>
									</tr>
									<tr>
										<td><span class="tmap_detail">&nbsp;인천시 연수구 연수2동</span></td>
									</tr>
									<tr>
										<td class="text-right"><span
											class="tmap_detail glyphicon glyphicon-eye-open">조회수</span> <span
											class="tmap_detail glyphicon glyphicon-heart">찜&nbsp;</span>
										</td>
									</tr>
								</table>
							</td>
							<td width="13%">
								<center>
									<!-- <span class="glyphicon glyphicon-chevron-right"></span> -->
									<table style="float: left; margin: 3%;">
										<tr>
											<td class="tmap_res"><span>이동 거리 </span><span>100m</span>
											</td>
											<td rowspan="2"><span
												class="glyphicon glyphicon-chevron-right"></span></td>
										</tr>
										<tr>

											<td class="tmap_res"><span>이동 시간 </span><span>3분</span>
											</td>

										</tr>
									</table>
								</center>
							</td>
							<!--2번  -->
							<td width="24%">
								<table class="tmap_wrap">
									<tr>
										<td style="padding: 3%;">
											<h4 style="float: left;">
												<scan class="glyphicon glyphicon-home"
													style="margin-right:10px;">가게이름 
											</h4>
										</td>
									</tr>
									<tr>
										<td><span class="tmap_detail">&nbsp;인천시 연수구 연수2동</span></td>
									</tr>
									<tr>
										<td class="text-right"><span
											class="tmap_detail glyphicon glyphicon-eye-open">조회수</span> <span
											class="tmap_detail glyphicon glyphicon-heart">찜&nbsp;</span>
										</td>
									</tr>
								</table>
							</td>
							<td width="13%">
								<center>

									<table style="float: left; margin: 3%;">
										<tr>
											<td class="tmap_res"><span>이동 거리 </span><span>100m</span>
											</td>
											<td rowspan="2"><span
												class="glyphicon glyphicon-chevron-right"></span> <!-- 이동거리 화살표 --></td>
										</tr>
										<tr>
											<td class="tmap_res"><span>이동 시간 </span><span>3분</span>
											</td>
										</tr>
									</table>
								</center>
							</td>
							<!-- 3번 -->
							<td width="24%">
								<table class="tmap_wrap">
									<tr>
										<td style="padding: 3%;">
											<h4 style="float: left;">
												<scan class="glyphicon glyphicon-home"
													style="margin-right:10px;">가게이름 
											</h4>
										</td>
									</tr>
									<tr>
										<td><span class="tmap_detail">&nbsp;인천시 연수구 연수2동</span></td>
									</tr>
									<tr>
										<td class="text-right"><span
											class="tmap_detail glyphicon glyphicon-eye-open">조회수</span> <span
											class="tmap_detail glyphicon glyphicon-heart">찜&nbsp;</span>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<!--코스 찜 하기 버튼  -->
					<table>
						<tr>
							<td class="btn-like text-center">
								<button type="button" class="btn like" data-toggle="modal"
									data-target="#myModal" aria-hidden="true"
									style="outline: none;">
									<b>코스 찜하기</b>
								</button>
							</td>
						</tr>
					</table>
			</center>
		</div>

	</div>
	<div style="width: 63%; margin: 0px auto;">
		<hr>
	</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<center>
			<div class="modal-dialog">
				<div class="modal-content" style="width: 400px;">
					<div class="modal-header">
						<!-- 모달 닫기 -->
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<!-- 모달 내용 -->
					<div class="modal-body">
						<center>
							<img src="img_1/date.jpg" width="300px" height="300px"> <br
								clear=left>
							<h5 style="margin-top: 2%;">
								<b>선택하신 데이트 코스를 찜 하시겠습니까?</b>
							</h5>
						</center>
					</div>
					<div class="modal-footer">
						<center>
							<button type="button" class="btn btn-default"
								style="background-color: white; outline: none;">
								<b>코스 찜</b>
							</button>
							<button type="button" class="btn btn-default"
								style="background-color: white; outline: none;"
								data-dismiss="modal">
								<b>취소</b>
							</button>
						</center>
					</div>
				</div>
			</div>
		</center>
	</div>

	<div class="container rc">
		<div class="rc_box">
			<!--맛집 리스트  -->
			<div class="row">
				<div style="width: 100%; height: 25px;">
					<h4 style="margin: 0px; float: left">
						<b>▶ 추천</b><b style="color: #DF0101;">맛집</b>
					</h4>
				</div>
				<c:forEach begin="1" end="3">
					<div class="col-md-4 text-center">
						<div class="box">
							<div class="box-content">
								<!--맛집 이름  -->
								<a href="#" style="color: black; text-decoration: none;">
									<h4>
										<span class="glyphicon glyphicon-cutlery"
											style="float: left; margin: 2%"></span>
									</h4>
									<h4 class="tag-title text-left">가게이름</h4> <br>
								</a>
								<hr style="margin: 2%;">
								<!-- 맛집 이미지 -->
								<div class=rc_img>
									<img src="img_1/food3.jpg" style="width: 100%; height: 250px;">
									<br>
									<hr style="margin: 3px;">
								</div>
								<!-- 맛집정보 -->
								<div class="rc_detail">
									<table width=100%>
										<tr>
											<td class="text-left">
												<h5>
													<span class="glyphicon glyphicon-map-marker"><b>
															지역구</b></span>
												</h5>
											</td>
										</tr>
										<tr>
											<td class="text-left">
												<h5>
													<span class="glyphicon glyphicon-usd"><b> 가격</b></span>
												</h5>
											</td>
										</tr>
										<tr>
											<td class="text-left">
												<h5>
													<span class="glyphicon glyphicon-time"><b> 평일
															11:00~20:00</b></span>
												</h5>
											</td>
										</tr>
										<tr>
											<td class="text-right">
												<h5>
													<span class="glyphicon glyphicon-eye-open"
														style="margin: 2px;">88</span>
													<!--조회수  -->
													<span class="glyphicon glyphicon-heart"
														style="margin: 2px;">4</span>
													<!--찜 수   -->
												</h5>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>




			<!--놀거리 리스트  -->
			<div class="row">
				<div style="width: 100%; height: 25px;">
					<h4 style="margin: 0px; float: left">
						<b>▶ 추천</b><b style="color: #DF0101;">놀거리</b>
					</h4>
				</div>
				<c:forEach begin="1" end="3">
					<div class="col-md-4 text-center">
						<div class="box">
							<div class="box-content">
								<a href="#" style="color: black; text-decoration: none;">
									<h4>
										<span class="glyphicon glyphicon-map-marker"
											style="float: left; margin: 2%"></span>
									</h4>
									<h4 class="tag-title text-left">가게이름</h4> <br>
								</a>
								<hr style="margin: 2%;">
								<img src="img_1/play1.jpg" style="width: 100%; height: 250px;">
								<br>
								<hr style="margin: 3px;">
								<!-- 가게정보 -->
								<div class="rc_detail">
									<table class="" width=100%>
										<tr>
											<td class="text-left">
												<h5>
													<span class="glyphicon glyphicon-map-marker"><b>
															지역구</b></span>
												</h5>
											</td>
										</tr>
										<tr>
											<td class="text-left">
												<h5>
													<span class="glyphicon glyphicon-usd"><b> 가격</b></span>
												</h5>
											</td>
										</tr>
										<tr>
											<td class="text-left">
												<h5>
													<span class="glyphicon glyphicon-time"><b> 평일
															11:00~20:00</b></span>
												</h5>
											</td>
										</tr>
										<tr>
											<td class="text-right">
												<h5>
													<span class="glyphicon glyphicon-eye-open"
														style="margin: 2px;">88</span>
													<!--조회수  -->
													<span class="glyphicon glyphicon-heart"
														style="margin: 2px;">4</span>
													<!--찜 수   -->
												</h5>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<!--  -->
			<!-- 카페 리스트 -->
			<div class="row">
				<div style="width: 100%; height: 25px;">
					<h4 style="margin: 0px; float: left">
						<b>▶ 추천</b><b style="color: #DF0101;">카페</b>
					</h4>
				</div>
				<c:forEach begin="1" end="3">
					<div class="col-md-4 text-center">
						<div class="box">
							<div class="box-content">
								<a href="#" style="color: black; text-decoration: none;">
									<h4>
										<span class="glyphicon glyphicon-glass"
											style="float: left; margin: 2%"></span>
									</h4>
									<h4 class="tag-title text-left">가게이름</h4> <br>
								</a>
								<hr style="margin: 2%;">
								<img src="img_1/cafe1.png" style="width: 100%; height: 250px;">
								<br>
								<hr style="margin: 3px;">
								<!-- 가게정보 -->
								<div class="rc_detail">
									<table width=100%>
										<tr>
											<td class="text-left">
												<h5>
													<span class="glyphicon glyphicon-map-marker"><b>
															지역구</b></span>
												</h5>
											</td>
										</tr>
										<tr>
											<td class="text-left">
												<h5>
													<span class="glyphicon glyphicon-usd"><b> 가격</b></span>
												</h5>
											</td>
										</tr>
										<tr>
											<td class="text-left">
												<h5>
													<span class="glyphicon glyphicon-time"><b> 평일
															11:00~20:00</b></span>
												</h5>
											</td>
										</tr>
										<tr>
											<td class="text-right">
												<h5>
													<span class="glyphicon glyphicon-eye-open"
														style="margin: 2px;">88</span>
													<!--조회수  -->
													<span class="glyphicon glyphicon-heart"
														style="margin: 2px;">4</span>
													<!--찜 수   -->
												</h5>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

</body>
</html>