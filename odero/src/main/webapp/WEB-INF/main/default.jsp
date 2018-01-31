<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.course_modal {
	width: 100%;
}
.course_modal p, .course_modal span{
	font-size: 18px;
}
.course_modal span{
	border-bottom: 4px solid #DEEBF7;
}
.modal_map_wrap{
	width: 100%;
	margin-bottom: 30px;
}
#modal_course_info{
	width: 100%;
	height: auto;
	margin-bottom: 30px;
}
/* #modal_map0 img{
	max-height: none !important;
} */

</style>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css"
	rel="stylesheet">
<!-- 3 KB -->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
<!-- 16 KB -->

<script type="text/javascript">
	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});
</script>
</head>
<body>
	<div class="container-fluid" id="container">
		<div class="fotorama" data-width="100%" data-ratio="800/600"
			data-height="450px" data-nav="false"
			data-transition="slide" data-clicktransition="crossfade"
			data-loop="true" data-autoplay="true">
			<div data-fit="cover"
				style="background-image: url(image/couple2.jpg); background-size: 100%; background-position: center">
				<div
					style="background-color: black; width: 100%; height: 450px; opacity: 0.3"></div>
			</div>
			<div data-fit="cover"
				style="background-image: url(image/couple3.jpg); background-size: 100%; background-position: center">
				<div
					style="background-color: black; width: 100%; height: 450px; opacity: 0.3"></div>
			</div>
			<div data-fit="cover"
				style="background-image: url(image/couple4.jpg); background-size: 100%; background-position: center">
				<div
					style="background-color: black; width: 100%; height: 450px; opacity: 0.3"></div>
			</div>
			<div data-fit="cover"
				style="background-image: url(image/couple5.jpg); background-size: 100%; background-position: center bottom">
				<div
					style="background-color: black; width: 100%; height: 450px; opacity: 0.3"></div>
			</div>
			<div data-fit="cover"
				style="background-image: url(image/couple7.png); background-size: 100%; background-position: center">
				<div
					style="background-color: black; width: 100%; height: 450px; opacity: 0.3"></div>
			</div>
		</div>
		<div class="course_wrap">
			<div id="course_main">
				<div id="back" style="background-color: black; opacity: 0.3; position: absolute; width: 100%; height: 250px; z-index: 1"></div>
				<c:forEach var="list" items="${clist }" varStatus="s">
					<div class="course"
						style="background-image: url(${guimg[s.index]});">
						<h2>"${gulist[s.index]}" 데이트 코스</h2>
						<a href="#courseModal${s.index }" data-toggle="modal"></a>
						<div class="modal fade" id="courseModal${s.index }" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
							data-keyboard="true" data-backdrop="true">
							<div class="modal-dialog modal-fullsize" id="course-modal"
								role="document">
								<div class="modal-content modal-fullsize" id="course-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>

										<h3 class="modal-title" id="myModalLabel">가성비코스</h3>
									</div>
									<div class="modal-body">
										<%-- <jsp:include page="modalCourse.jsp" /> --%>
										<div class="course_modal" style="overflow: scroll">
											<div class="modal_map_wrap">
												<div id="modal_map${s.index }"
													style="width: 100%; height: 350px;"></div>
												<script type="text/javascript"
													src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f71a358ab1852f4a6dd2eee5070f7a02&libraries=services"></script>
												<script>
													$("#courseModal${s.index}").on('shown.bs.modal',function() {
														var mapContainer = document.getElementById('modal_map${s.index}'), // 지도를 표시할 div 
														mapOption = {
															center : new daum.maps.LatLng(33.450701,126.570667), // 지도의 중심좌표
															level : 4
														// 지도의 확대 레벨
														};
														var modal = $(this).attr("id");
														// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
														var map = new daum.maps.Map(
																mapContainer,
																mapOption);
														// 주소-좌표 변환 객체를 생성합니다
														var geocoder = new daum.maps.services.Geocoder();

														//마커 이미지
														var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
														imageSize = new daum.maps.Size(64,69), // 마커이미지의 크기입니다
														imageOption = {
															offset : new daum.maps.Point(27,69)
														}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

														// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
														var markerImage = new daum.maps.MarkerImage(
																imageSrc,
																imageSize,
																imageOption), markerPosition = new daum.maps.LatLng(37.54699,127.09598); // 마커가 표시될 위치입니다
														var addr = [ $('#addr_${s.index}_0').text(),$('#addr_${s.index}_1').text(),$('#addr_${s.index}_2').text() ];
														var p_name = [$('#p_name_${s.index}_0').text(),$('#p_name_${s.index}_1').text(),$('#p_name_${s.index}_2').text()];
														var k=0;
														var arr_coords = ["","","","","",""];
														var c=0;
														//주소별 좌표 검색, 띄우기
														for(var j=0; j<3; j++){
														geocoder.addressSearch(addr[j],function(result,status) {
																			// 정상적으로 검색이 완료됐으면 
																			if (status === daum.maps.services.Status.OK) {
																				var coords = new daum.maps.LatLng(
																						result[0].y,
																						result[0].x);
																				//좌표 배열에 저장
																				arr_coords[c] = result[0].x;
																				c=c+1;
																				arr_coords[c] = result[0].y;
																				c=c+1;
																				// 결과값으로 받은 위치를 마커로 표시합니다
																				var marker = new daum.maps.Marker(
																						{
																							map : map,
																							position : coords,
																							image : markerImage
																						});

																				// 인포윈도우로 장소에 대한 설명을 표시합니다
																				var infowindow = new daum.maps.InfoWindow(
																						{
																							content: '<div style="width:150px;text-align:center;padding:6px 0;">'+p_name[k]+'</div>'
																						});
																				infowindow.open(map,marker);

																				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
																				map.setCenter(coords);
																			}
																			k=k+1;
																			
														});
														}
														
														//대중교통 API
														function searchPubTransPathAJAX() {
															var xhr = new XMLHttpRequest();
															//ODsay apiKey 입력
															alert("gg");
															var url = "https://api.odsay.com/v1/api/searchPubTransPath?SX=127.06267410402882&SY=37.65648131884798&EX=127.07963376555469&EY=37.66635665481798&apiKey=Vtl1rXEESth1IRgaEkIJ+A";
															xhr.open("GET", url, true);
															xhr.send();
															xhr.onreadystatechange = function() {
																
																if (xhr.readyState == 4 && xhr.status == 200) {
																	var resultObj = JSON.parse(xhr.responseText);
																	
																	//console.log(resultObj.result);
																	var resultArr = resultObj["result"]["lane"];
																	alert("zz");
																	var str = "";
																	for (var i = 0; i < resultArr.length; i++) {
																		str += "<div class='box'>";
																		str += "<p>지역이름 : " + resultArr[i].busCityName + "</p>";
																		str += "<p>버스회사 : " + resultArr[i].busCompanyNameKor + "</p>";
																		str += "<p>버스번호 : " + resultArr[i].busNo + "</p>";
																		str += "<p>출발점 / 도착점 : " + resultArr[i].busStartPoint + " - "
																			+ resultArr[i].busEndPoint + "</p>";
																		str += "</div>";
																		alert(str);
																	}
																	document.getElementById(".root").innerHTML = str;
																}
																
															}
														}
														
														//길찾기 API 호출
														searchPubTransPathAJAX();
														
													});
													
												</script>
											</div>
											<div id="modal_course_info">
												<c:forEach var="vo" items="${list }" varStatus="v">
													<c:if test="${v.index%3!=2 }">
														<div class="course"
															style="width: 30%; float: left; height: auto">
															<img src="${vo.p_img }" width=100% height="250px"
																style="margin-bottom: 20px">
															<p id="p_name_${s.index }_${v.index}">${vo.p_name }</p>
															<p id="addr_${s.index }_${v.index }">${vo.p_addr }</p>
															<p>${vo.p_tel }</p>
															<p>${vo.p_price }</p>
															<p>${vo.p_keyword }</p>
														</div>
														<div class="next"
															style="width: 5%; float: left; margin: 0px auto; height: 380px;">
															<img src="image/next.png" width=100%
																style="padding-top: 100px;">
														</div>
													</c:if>
													<c:if test="${v.index%3==2 }">
														<div class="course"
															style="width: 30%; float: left; height: auto">
															<img src="${vo.p_img }" width=100% height="250px"
																style="margin-bottom: 20px">
															<p id="p_name_${s.index }_${v.index}">${vo.p_name }</p>
															<p id="addr_${s.index }_${v.index }">${vo.p_addr }</p>
															<p>${vo.p_tel }</p>
															<p>${vo.p_price }</p>
															<p>${vo.p_keyword }</p>
														</div>
													</c:if>
												</c:forEach>
											</div>

											<div
												style="float: left; width: 100%; height: 30px; margin-top: 30px; margin-bottom: 30px">
												<span style="float: right; margin-right: 10px">예상 데이트
													비용: 약 ${totallist[s.index] } 만원 </span>
											</div>
											<div style="height: 30px; float: left" class="root">
												<p>대중교통 이용</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div id="course_sub">
				<center>
					<h1>가성비 데이트</h1>
				</center>
			</div>
		</div>

		<div class="container">
			<!-- BEST 맛집/놀거리 -->
			<div class="best_wrap" id="best_food">
				<h1>BEST 맛집</h1>
				<c:forEach var="fvo" items="${flist }">
					<div class="food_place snip1200">
						<img src="${fvo.p_img }" width="100%" height="auto">
						<figcaption>
						<p>${fvo.p_addr }</p>
						<div class="heading">
							<h2>${fvo.p_name }</h2>
						</div>
						</figcaption>
						<a href="#"></a>
					</div>
				</c:forEach>
			</div>

			<div class="best_wrap" id="best_place">
				<h1>BEST 놀거리</h1>
				<c:forEach var="pvo" items="${plist }">
					<div class="food_place snip1200">
						<img src="${pvo.p_img }" width="100%" height="auto">
						<figcaption>
						<p>${pvo.p_addr }</p>
						<div class="heading">
							<h2>${pvo.p_name }</h2>
						</div>
						</figcaption>
						<a href="#"></a>
					</div>
				</c:forEach>
			</div>

			<!-- BEST REVIEW -->
			<div class="review_wrap">
				<h1>BEST REVIEW</h1>
				<h4>생생한 후기</h4>
				<c:forEach var="i" begin="1" end="12">
					<div class="review snip1273">
						<img src="image/place1.jpg">
						<figcaption>
						<h3>리뷰할 장소</h3>
						<p>리뷰 제목</p>
						</figcaption>
						<a href="#"></a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>