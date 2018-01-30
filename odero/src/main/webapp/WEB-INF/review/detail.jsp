<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- css, js 연결하기 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- 33 KB -->

<!-- fotorama.css & fotorama.js. -->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css"
	rel="stylesheet">
<!-- 3 KB -->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
<!-- 16 KB -->

<script type="text/javascript">
	var slideIndex = 0;
	showSlides();

	function showSlides() {
		var i;
		var slides = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("dot");
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		slideIndex++;
		if (slideIndex > slides.length) {
			slideIndex = 1
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " active";
		setTimeout(showSlides, 2000); // Change image every 2 seconds
	}

	function deleteDetail(){
		var answer = confirm ("게시물을 삭제하시겠습니까?");
		if (answer) {
			location.href = "review_delete.do?no=${vo.r_no }";
			alert("삭제되었습니다");
		} else {
			return;
		}		
	}
	
</script>
<style type="text/css">
.back {
	width: 100%;
	height: 450px;
	background-image: url('review/data/${vo.r_imgname }');
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
}

.fotorama{
	padding-top: 70px; 
}
.btn{
	background-color:#002060; 
	color:#DEEBF7;
}
</style>
</head>
<body>
	<div style="width:100%; height: 450px;">
		<center>
			<div class="back" style="position: absolute;" >
				<div style="background-color: black; opacity: 0.5; width: 100%; height: 450px;"></div>	
			</div>
			<div style="width:100%; height: 100px; position: absolute;">
				<h3 style="color:white; ">${vo.r_pname }</h3>
			</div>
			<div class="fotorama" data-width="450px" data-height="300px" data-fit="cover" data-nav="thumbs"> 
				<c:choose>
					<c:when test="${fn:length(images) > 0}">
						<c:forEach var="img" items="${images }">
							<img src="review/data/${img }" width="100%">
						</c:forEach>
					</c:when>
					<c:otherwise>
						<img src="review/data/no_image.jpg" width="100%">
					</c:otherwise>
				</c:choose>
			</div>
		</center>
	</div>
	<div class="container" style="margin-top:50px;">
		<div class="row">
			<!-- 지도 -->
			<div id="map" style="width:100%;height:350px; margin-bottom: 50px;"></div>
			<table class="table table-hover">
				<tr>
					<td class="text-center info" width="20%">번호</td>
					<td class="text-center" width="30%">${vo.r_no }</td>
					<td class="text-center info" width="20%">작성일</td>
					<td class="text-center" width="30%">
						<fmt:formatDate value="${vo.r_regdate }" pattern="yyyy.MM.dd"></fmt:formatDate>
					</td>
				</tr>
				<tr>
					<td class="text-center info" width="20%">작성자</td>
					<td class="text-center" width="30%">${vo.m_id }</td>
					<td class="text-center info" width="20%">조회수</td>
					<td class="text-center" width="30%">${vo.r_hit }</td>
				</tr>
				<tr>
					<td class="text-center info" width="20%">제목</td>
					<td class="text-center" colspan="3">${vo.r_subject }</td>
				</tr>
				<tr>
					<td class="text-left" colspan="4" valign="top" height="150px">
						${vo.r_content }
					</td>
				</tr>
				<tr>
					<td class="text-right" colspan="4">
						<c:if test="${vo.m_id=='1' }">
							<a href="review_update.do?no=${vo.r_no }" class="btn btn-md">수정</a> 
							<a class="btn btn-md" onclick="javascript:deleteDetail()">삭제</a> 
						</c:if>
						<a href="review_list.do" class="btn btn-md">목록</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=641146c1d3ef1301e2a1f709fdc1b146&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), 	// 지도 표시할 div 
    mapOption = { 									// 지도 옵션
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도 중심좌표
        level: 3 // 지도 확대레벨
    };

// 지도 생성
var map = new daum.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${vo.r_addr}', function(result, status) {

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
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.r_pname}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
</body>
</html>