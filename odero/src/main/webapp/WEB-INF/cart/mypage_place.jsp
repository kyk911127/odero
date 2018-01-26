<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d7e1caf16f1fe180e708f6b17474f2fa"></script>
<link rel="stylesheet"
	href="http://fonts.googleapis.com/earlyaccess/hanna.css">
<link rel="stylesheet"
	href="https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css">

<link href="css/mypage.css" rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


</head>
<body class="body">
	<div class="container">
		<div class="tab_wrap">


			<span class="tab">찜 삭제</span> | <span class="tab">목록</span>
		</div>


		<%-- c:forEach var="i" begin="1" end="3"> --%>
		<div class="row cart">

			<div class="cart_wrap">
				<hr class="soften">
				<h3 class="sub_text text-left main_text">데이트 장소 상세정보</h3>
				<hr class="soften">
				<div class="table_wrap">
					<table class="info" id="table_content">
						<tr>
							<td width=30% align=center rowspan="5"><img
								src="c_image/date1.jpg" width=300></td>
						</tr>
						<tr>
							<td width=20% align=center><h4>장소</h4></td>
							<td width=50% align=left class="explain">$ 장소종류 - 식당 / 놀거리 /
								카페</td>
						</tr>
						<tr>
							<td width=20% align=center><h4>장소 이름</h4></td>
							<td width=50% align=left class="explain">$ 장소이름 - 00 식당</td>
						</tr>
						<tr>
							<td width=20% align=center><h4>지역 설명</h4></td>
							<td width=50% align=left class="explain">$ 서울 마포구 00동 00번지</td>
						</tr>
						<tr>
							<td width=20% align=center><h4>장소 설명</h4></td>
							<td width=50% align=left class="explain">$ 장소 설명 - 해당 장소는 정말
								끝내주는 장소이며 아주지리고요오지고요고요고요고요한밤이고요리얼팩트반박불가입니다 $ 장소 설명 - 해당 장소는 정말
								끝내주는 장소이며 아주지리고요오지고요고요고요고요한밤이고요리얼팩트반박불가입니다 $ 장소 설명 - 해당 장소는 정말
								끝내주는 장소이며 아주지리고요오지고요고요고요고요한밤이고요리얼팩트반박불가입니다 $ 장소 설명 - 해당 장소는 정말
								끝내주는 장소이며 아주지리고요오지고요고요고요고요한밤이고요리얼팩트반박불가입니다 $ 장소 설명 - 해당 장소는 정말
								끝내주는 장소이며 아주지리고요오지고요고요고요고요한밤이고요리얼팩트반박불가입니다 $ 장소 설명 - 해당 장소는 정말
								끝내주는 장소이며 아주지리고요오지고요고요고요고요한밤이고요리얼팩트반박불가입니다 $ 장소 설명 - 해당 장소는 정말
								끝내주는 장소이며 아주지리고요오지고요고요고요고요한밤이고요리얼팩트반박불가입니다</td>
						</tr>
					</table>

				</div>
			</div>
			<div class="map_div col-lg-12">
				<hr class="soften" />
				<h3 class="sub_text">코스 경로</h3>
				<hr class="soften" />
				<div class="map">
					<!--지도  -->

					<br>
					<div class="map_img" id="map" style="width:800px; height: 400px;"></div>
					<!-- <img src="c_image/map1.jpg" class="map_img"> -->
					<script>
						var container = document.getElementById('map');
						var options = {
							center : new daum.maps.LatLng(33.450701, 126.570667),
							level : 3
						};

						var map = new daum.maps.Map(container, options);
					</script>
				</div>

			</div>
		</div>
		<br> <br>
		<hr class="hr" />
	</div>
	<%-- </c:forEach> --%>


</body>
</html>