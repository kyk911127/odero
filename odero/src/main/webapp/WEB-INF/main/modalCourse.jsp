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
	font-size: 20px;
}
.course_modal span{
	border-bottom: 4px solid #DEEBF7;
}
#modal_map_wrap{
	width: 100%;
	margin-bottom: 30px;
}
#modal_course_info{
	width: 100%;
	height: 370px;
	margin-bottom: 30px;
}
#modal_map img{
	max-height: none !important;
}

</style>
</head>
<body>
	<div class="course_modal" style="overflow: scroll">
		<div id="modal_map_wrap">
		<div id="modal_map" style="width: 100%; height: 350px;"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f71a358ab1852f4a6dd2eee5070f7a02&libraries=services,clusterer,drawing"></script>
		<script>
			var mapContainer = document.getElementById('modal_map'), // 지도를 표시할 div 
			mapOption = {
				center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 4
			// 지도의 확대 레벨
			};
			$("#courseModal").on('shown.bs.modal', function () {
				// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
				var map = new daum.maps.Map(mapContainer, mapOption);
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new daum.maps.services.Geocoder();
				
				//마커 이미지
				var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
			    imageSize = new daum.maps.Size(64, 69), // 마커이미지의 크기입니다
			    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			      
				// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
				var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
			    markerPosition = new daum.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다


				// 주소로 좌표를 검색합니다
				geocoder.addressSearch('인천 남동구 구월동 1302-18번지', function(result, status) {

				    // 정상적으로 검색이 완료됐으면 
				     if (status === daum.maps.services.Status.OK) {
				        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new daum.maps.Marker({
				            map: map,
				            position: coords,
				            image: markerImage
				        });

				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new daum.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">가게명</div>'
				        });
				        infowindow.open(map, marker);

				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				     }
				});
				
				map.addOverlayMapTypeId(daum.maps.MapTypeId.TRAFFIC); //교통정보표시
		    });
			
		</script>
		</div>
		<div id="modal_course_info">
		<c:forEach var="i" begin="1" end="5">
			<c:if test="${i%2!=0 }">
				<div class="course" style="width: 30%; float: left; height: 380px">
					<img src="image/couple${i }.jpg" width=100% height="250px" style="margin-bottom:20px">
					<p>가게명</p>
					<p>가격대</p>
					<p>번호</p>
				</div>

			</c:if>
			<c:if test="${i%2==0 }">
				<div class="next" style="width: 5%; float: left; margin: 0px auto; height: 380px;">
					<img src="image/next.png" width=100% style="padding-top: 100px;">
				</div>
			</c:if>

		</c:forEach>
		</div>
		<div style="float:right;width:100%; height: 30px; margin-bottom: 30px">
			<span style="float:right;margin-right: 10px">예상 데이트 비용: 10만원</span>
		</div>
		<div style="height: 30px">
			<p>대중교통 이용</p>
		</div>

	</div>
</body>
</html>