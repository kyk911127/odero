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

<script>
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
</script>
<style type="text/css">
.back {
	width: 100%;
	height: 400px;
	background-image: url('review/data/${vo.r_imgname }');
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
}

.fotorama{
	padding-top: 20px; 
	margin-left: 39%;
}
</style>
</head>
<body>
	<div>
		<div class="back" style="text-align: center; position: absolute;" >
			<div style="background-color: black; opacity: 0.5; width: 100%; height: 400px;"></div>
		</div>
		<c:choose>
			<c:when test="${fn:length(images) > 0}">
				<div class="fotorama" data-width="400px" data-height="300px" data-fit="cover" data-nav="thumbs"> 
					<c:forEach var="img" items="${images }">
						<img src="review/data/${img }" width="100%" height="300px">
					</c:forEach>
				</div>
			</c:when>
			<c:otherwise>
				<div class="fotorama" data-width="400px" data-height="300px" data-fit="cover" data-nav="thumbs"> 
					<img src="review/data/no_image.jpg" width="100%" height="300px">
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="container" style="margin-top: 200px; position: relative;" >
		<div class="row">
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
					<td class="text-center info" width="20%">작성자s</td>
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
						<a href="review_update.do?no=${vo.r_no }" class="btn btn-sm btn-primary">수정</a> 
						<a href="review_delete.do?no=${vo.r_no }" class="btn btn-sm btn-success">삭제</a> 
						<a href="review_list.do" class="btn btn-sm btn-info">목록</a></td>
				</tr>
			</table>



		</div>
	</div>

</body>
</html>