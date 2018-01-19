<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link  href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet"> <!-- 3 KB -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script> <!-- 16 KB -->
<style>
.course_wrap {
	margin: 0px auto;
	height: 450px;
	margin-bottom: 150px;
}
#course_sub {
	height: 200px;
	width: 100%;
	position: absolute;
	background-image: url(image/flower5.jpg);
	background-size: 100%;
	background-attachment: fixed;
}

#course_sub h1 {
	line-height: 200px;
	margin: 0px;
	font-weight: bold;
	color: white;
}

#course_main {
	height: 250px;
}

.course {
	position: relative;
	float: left;
	width: 25%;
	height: 250px;
	background-size: 100%;
	background-position: center;
}
 .course a {
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	position: absolute;
	z-index: 1;
}

.course h2 {
	line-height: 250px;
	text-align: center;
	color: white;
	margin: 0px;
}

.best_wrap {
	width: 48%;
	float: left;
	margin-bottom: 150px;
}

.best_wrap h1 {
	padding-bottom: 20px;
	border-bottom: 2px solid black;
	/* font-size: 25px; */
	font-weight: bold;
	margin-bottom: 30px;
}

#best_food {
	margin-right: 45px;
}

.food_place {
	height: 200px;
	margin-bottom: 10px;
	background-size: 100%;
	background-position: center;
}

.food_place h2 {
	margin: 0px;
	line-height: 200px;
	text-align: center;
	color: white;
}

.black {
	/* position: absolute; */
	display: none;
	background-color: black;
	opacity: 0.3;
	width: 100%;
	height: 200px;
}

.review_wrap {
	width: 100%;
}

.review_wrap h1, h4 {
	text-align: center;
}

.review_wrap h4 {
	margin-bottom: 40px;
}

.review {
	width: 280px;
	margin: 2px;
	height: 285px;
	float: left;
}

/* 맛집, 놀거리 hover */
div.snip1200 {
	position: relative;
	overflow: hidden;
	background: #000000;
	color: #ffffff;
	text-align: center;
	/* box-shadow: 0 0 5px rgba(0, 0, 0, 0.15); */
}

div.snip1200 * {
	/* -webkit-box-sizing: border-box;
	box-sizing: border-box; */
	-webkit-transition: all 0.45s ease-in-out;
	transition: all 0.45s ease-in-out;
}

div.snip1200 img {
	max-width: 100%;
	position: relative;
	opacity: 0.9;
}

div.snip1200 figcaption {
	position: absolute;
	top: 45%;
	left: 7%;
	right: 7%;
	bottom: 45%;
	/*   border: 1px solid white;
  border-width: 1px 1px 0; */
}

div.snip1200 .heading {
	overflow: hidden;
	-webkit-transform: translateY(50%);
	transform: translateY(50%);
	position: absolute;
	bottom: 0;
	width: 100%;
}

div.snip1200 h2 {
	display: block;
	margin: 0 auto;
	padding: 0 10px;
	position: relative;
	text-align: center;
	width: auto;
	text-transform: uppercase;
	/*  font-weight: 400; */
}
/* div.snip1200 h2 span {
  font-weight: 800;
} */
div.snip1200 h2:before, div.snip1200 h2:after {
	position: absolute;
	display: block;
	width: 1000%;
	height: 1px;
	content: '';
	background: white;
	top: 50%;
}

div.snip1200 h2:before {
	left: -1000%;
}

div.snip1200 h2:after {
	right: -1000%;
}

div.snip1200 p {
	top: 50%;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%);
	position: absolute;
	width: 100%;
	padding: 0 20px;
	margin: 0;
	opacity: 0;
	line-height: 1.6em;
	font-size: 20px;
}

div.snip1200 a {
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	position: absolute;
	z-index: 1;
}

div.snip1200:hover img, div.snip1200.hover img {
	opacity: 0.25;
	-webkit-transform: scale(1.1);
	transform: scale(1.1);
}

div.snip1200:hover figcaption, div.snip1200.hover figcaption {
	top: 7%;
	bottom: 35%;
}

div.snip1200:hover p, div.snip1200.hover p {
	opacity: 1;
	-webkit-transition-delay: 0.35s;
	transition-delay: 0.35s;
}

/* 리뷰 hover */
.snip1273 {
  position: relative;
  float: left;
  color: #ffffff;
  text-align: left;
  background-color: #000000;
}
.snip1273 * {
 /*  -webkit-box-sizing: border-box;
  box-sizing: border-box; */
  -webkit-transition: all 0.3s ease-in;
  transition: all 0.3s ease-in;
}
.snip1273 img {
  position: relative;
  max-width: 100%;
  vertical-align: top;
}
.snip1273 figcaption {
  position: absolute;
  top: 0;
  right: 0;
  width: 100%;
  height: 100%;
  z-index: 1;
  opacity: 0;
  padding: 20px 30px;
}
.snip1273 figcaption:before,
.snip1273 figcaption:after {
  width: 1px;
  height: 0;
}
.snip1273 figcaption:before {
  right: 0;
  top: 0;
}
.snip1273 figcaption:after {
  left: 0;
  bottom: 0;
}
.snip1273 h3,
.snip1273 p {
  line-height: 1.5em;
}
.snip1273 h3 {
  margin: 0 0 5px;
  font-weight: 700;
  text-transform: uppercase;
}
.snip1273 p {
  font-size: 0.9em;
  font-weight: 500;
  margin: 0 0 15px;
}
.snip1273 a {
  position: absolute;
  top: 0;
  bottom: 0;
  right: 0;
  left: 0;
  z-index: 1;
}
.snip1273:before,
.snip1273:after,
.snip1273 figcaption:before,
.snip1273 figcaption:after {
  position: absolute;
  content: '';
  /* background-color: #ffffff; */
  z-index: 1;
  -webkit-transition: all 0.2s ease-in;
  transition: all 0.4s ease-in;
  opacity: 0.8;
}
.snip1273:before,
.snip1273:after {
  height: 1px;
  width: 0%;
}
.snip1273:before {
  top: 0;
  left: 0;
}
.snip1273:after {
  bottom: 0;
  right: 0;
}
.snip1273:hover img,
.snip1273.hover img {
  opacity: 0.4;
}
.snip1273:hover figcaption,
.snip1273.hover figcaption {
  opacity: 1;
}
.snip1273:hover figcaption:before,
.snip1273.hover figcaption:before,
.snip1273:hover figcaption:after,
.snip1273.hover figcaption:after {
  height: 100%;
}
.snip1273:hover:before,
.snip1273.hover:before,
.snip1273:hover:after,
.snip1273.hover:after {
  width: 100%;
}
.snip1273:hover:before,
.snip1273.hover:before,
.snip1273:hover:after,
.snip1273.hover:after,
.snip1273:hover figcaption:before,
.snip1273.hover figcaption:before,
.snip1273:hover figcaption:after,
.snip1273.hover figcaption:after {
  opacity: 0.3;
}
</style>
<script type="text/javascript">
	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});

</script>
</head>
<body>
   <div class="container-fluid">
      <div class="fotorama" data-width="100%" data-ratio="800/600" data-width="100%" data-height="450px" data-nav="false"
         data-transition="slide" data-clicktransition="crossfade" data-loop="true" data-autoplay="true">
         <div data-fit="cover" style="background-image: url(image/couple2.jpg); background-size:100%;background-position: center">
            <div style="background-color: black; width: 100%; height: 450px; opacity:0.3"></div>
         </div>
         <div data-fit="cover" style="background-image: url(image/couple3.jpg); background-size:100%;background-position: center">
            <div style="background-color: black; width: 100%; height: 450px; opacity:0.3"></div>
         </div>
         <div data-fit="cover" style="background-image: url(image/couple4.jpg); background-size:100%;background-position: center">
            <div style="background-color: black; width: 100%; height: 450px; opacity:0.3"></div>
         </div>
         <div data-fit="cover" style="background-image: url(image/couple5.jpg); background-size:100%;background-position: center bottom">
            <div style="background-color: black; width: 100%; height: 450px; opacity:0.3"></div>
         </div>
         <div data-fit="cover" style="background-image: url(image/couple7.png); background-size:100%;background-position: center">
            <div style="background-color: black; width: 100%; height: 450px; opacity:0.3"></div>
         </div>
      </div>
      <div class="course_wrap">
         <div id="course_main">
         <c:forEach var="i" begin="1" end="4">
            <div class="course" style="background-image: url(image/couple${i}.jpg);">
               <h2>데이트 코스${i }</h2>
               <a href="#"></a>
            </div>
         </c:forEach>
         </div>
         <div id="course_sub">
            <center><h1>가성비 데이트</h1></center>
         </div>
      </div>
      
      <div class="container">
      <!-- BEST 맛집/놀거리 -->
      <div class="best_wrap" id="best_food">
         <h1>BEST 맛집</h1>
         <c:forEach var="i" begin="1" end="3">
            <div class="food_place snip1200">
               <img src="image/food${i }.jpg">
               <figcaption>
    			<p>서울시 마포구 동동동</p>
    			<div class="heading">
      			<h2>맛집${i }</h2>
    			</div>
  				</figcaption>
  				<a href="#"></a>
			</div>
         </c:forEach>
      </div>
      
      <div class="best_wrap" id="best_place">
         <h1>BEST 놀거리</h1>
         <c:forEach var="i" begin="1" end="3">
            <div class="food_place snip1200">
               <img src="image/place${i }.jpg">
               <figcaption>
    			<p>서울시 마포구 동동동</p>
    			<div class="heading">
      			<h2>놀거리${i }</h2>
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