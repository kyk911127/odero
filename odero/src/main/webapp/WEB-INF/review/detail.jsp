<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- css, js 연결하기 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script src="/js/jquery.bxslider.min.js"></script>
<style type="text/css">
.carousel-inner{
	height: 450px;
}
</style>
</head>
<body>
	<div class="container" style="margin-top: 50px">
		<div class="row">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<c:forEach var="i" begin="1" end="5">
					<li data-target="#myCarousel" data-slide-to="0"></li>
					</c:forEach>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner">
					<div class="item active">
						<img src="img/1.jpg" alt="Los Angeles" style="width: 100%;">
					</div>
					<div class="item">
						<img src="img/2.jpg" alt="Chicago" style="width: 100%;">
					</div>
					<div class="item">
						<img src="img/3.jpg" alt="New york" style="width: 100%;">
					</div>
					<div class="item">
						<img src="img/4.jpg" alt="Chicago" style="width: 100%;">
					</div>
					<div class="item">
						<img src="img/5.jpg" alt="New york" style="width: 100%;">
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>

</body>
</html>