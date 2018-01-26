<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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


			<a href="#"><span class="tab" id="delBtn"
				onclick="delete_confirm()">찜 삭제</span></a> | <a href="mypage_list.do"><span
				class="tab">목록</span></a>

		</div>


		<%-- c:forEach var="i" begin="1" end="3"> --%>
		<div class="row cart">

			<div class="cart_wrap">
				<hr class="soften">
				<h3 class="sub_text text-left main_text">코스 전체보기</h3>
				<hr class="soften">
				<div class="col-lg-3 cart_div">
					<img src="c_image/date1.jpg" class="cart_img">
					<table>
						<tr>
							<th>코스 1 :&nbsp;</th>
							<td>00 장소</td>
						</tr>
						<tr>
							<th>장소이름 :&nbsp;</th>
							<td>$장소명</td>
						</tr>
						<tr>
							<th>장소위치 :&nbsp;</th>
							<td>00 장소</td>
						</tr>
						<tr>
							<th>장소태그 :&nbsp;</th>
							<td>#장소1 #장소2</td>
						</tr>
						<tr>
							<th>추천도 :&nbsp;</th>
							<td><span class="glyphicon glyphicon-heart-empty">10</span>
								&nbsp; <span class="glyphicon glyphicon-thumbs-up">5</span></td>
						</tr>
					</table>
				</div>
				<div class="col-lg-3 cart_div">
					<img src="c_image/res1.jpg" class="cart_img">
					<table>
						<tr>
							<th>코스 2 :&nbsp;</th>
							<td>00 장소</td>
						</tr>
						<tr>
							<th>장소이름 :&nbsp;</th>
							<td>$장소명</td>
						</tr>
						<tr>
							<th>장소위치 :&nbsp;</th>
							<td>00 장소</td>
						</tr>
						<tr>
							<th>장소태그 :&nbsp;</th>
							<td>#장소1 #장소2</td>
						</tr>
					</table>
				</div>
				<div class="col-lg-3 cart_div">
					<img src="c_image/res2.jpg" class="cart_img">
					<table>
						<tr>
							<th>코스 3 :&nbsp;</th>
							<td>00 장소</td>
						</tr>
						<tr>
							<th>장소이름 :&nbsp;</th>
							<td>$장소명</td>
						</tr>
						<tr>
							<th>장소위치 :&nbsp;</th>
							<td>00 장소</td>
						</tr>
						<tr>
							<th>장소태그 :&nbsp;</th>
							<td>#장소1 #장소2</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="map_div col-lg-12">
				<hr class="soften" />
				<h3 class="sub_text">코스 경로</h3>
				<hr class="soften" />
				<div class="map">

					<br> <img src="c_image/map1.jpg" class="map_img">
				</div>

			</div>
		</div>
		<div class="table_wrap">


			<hr class="soften" />
			<h3 class="sub_text">코스 개별정보</h3>
			<hr class="soften" />


			<br>
			<br>
			<table class="info" id="table_content">

				<tr>
					<c:forEach var="i" begin="1" end="3">
						<table id="table_content">
							<tr>
								<td width=30% align=center rowspan="5"><img src="date1.jpg"
									width=300></td>
							</tr>
							<tr>
								<td width=20% align=center><h4>${i }번째 장소</h4></td>
								<td width=50% align=left class="explain">$ 장소종류 - 식당 / 놀거리
									/ 카페</td>
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
								<td width=50% align=left class="explain">$ 장소 설명 - 해당 장소는
									정말 끝내주는 장소이며 아주지리고요오지고요고요고요고요한밤이고요리얼팩트반박불가입니다 $ 장소 설명 - 해당 장소는
									정말 끝내주는 장소이며 아주지리고요오지고요고요고요고요한밤이고요리얼팩트반박불가입니다 $ 장소 설명 - 해당 장소는
									정말 끝내주는 장소이며 아주지리고요오지고요고요고요고요한밤이고요리얼팩트반박불가입니다 $ 장소 설명 - 해당 장소는
									정말 끝내주는 장소이며 아주지리고요오지고요고요고요고요한밤이고요리얼팩트반박불가입니다 $ 장소 설명 - 해당 장소는
									정말 끝내주는 장소이며 아주지리고요오지고요고요고요고요한밤이고요리얼팩트반박불가입니다 $ 장소 설명 - 해당 장소는
									정말 끝내주는 장소이며 아주지리고요오지고요고요고요고요한밤이고요리얼팩트반박불가입니다 $ 장소 설명 - 해당 장소는
									정말 끝내주는 장소이며 아주지리고요오지고요고요고요고요한밤이고요리얼팩트반박불가입니다</td>
							</tr>
						</table>

						<br>
						<br>
						<hr class="hr" />
						<br>
						<br>
					</c:forEach>
				</tr>
			</table>
			<br>
			<br>


		</div>


	</div>
	<%-- </c:forEach> --%>


</body>
</html>