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
</style>
</head>
<body>
	<div class="course_modal" style="overflow: scroll">
		<div id="modal_map_wrap">
		<div id="modal_map" style="width: 100%; height: 350px;"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f71a358ab1852f4a6dd2eee5070f7a02"></script>
		<script>
			var mapContainer = document.getElementById('modal_map'), // 지도를 표시할 div 
			mapOption = {
				center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new daum.maps.Map(mapContainer, mapOption);
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