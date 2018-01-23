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

<script type="text/javascript">
	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});

</script>
</head>
<body>
   <div class="container-fluid" id="container">
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
               <img src="image/no_img.png" width="100%" height="auto">
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