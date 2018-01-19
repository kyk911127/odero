<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" href="http://fonts.googleapis.com/earlyaccess/hanna.css">
<link rel="stylesheet" href="https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css">

<link href="" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
@font-face {
    font-family: 'NanumBarunGothic';
    src: url('NanumBarunGothic.eot');
         url('NanumBarunGothic.woff') format('woff'),
         url('NanumBarunGothic.ttf') format('truetype'),
    font-weight: normal;
    font-style: normal;
}

.body, pre{
background-image: url("");
font-family: 'NanumBarunGothic', serif;
color: black;
font-size:12px;
/* background-color:#DEEBF7; */
}
.tab_wrap{
	padding: 5% 0 5% 0;
	font-size:20px;
}
.cart_wrap{
	text-align:center;
}

.cart {
	border: 0px solid black;
	margin-top : 10px;
	
}
.cart h3 {
	margin: 20px;
}
.cart_div {
	background-color: #DEEBF7;
	border: 0px solid gray;
	margin: 40px 0px 40px 43px;
 	height : 430px;
	width: 330px;
	text-align: left;
	font-size:15px;
	
}	
.cart_div:hover {
	opacity : 0.6;
}

.container {
/* background-color:rgba(1, 1, 1, 0.3); */
   /*  padding-bottom: 5%; */
 /*    border : 1px solid gray; */
}

.cart_img {
	padding : 10px 0 30px 0;
	width:100%;
	height: 300px;

}
.tab {
	padding : 20px;
	height:50px;
	width : 50px;
	border : 1px solid black;
	margin : 10px;
	background-color: #DEEBF7;
}
.tab:HOVER {
background-color:#002060;
color: white;
 
}
.map_img
{
	width:95%;
	height: 10%;
	border : 1px solid black;
}
.map_div{

}
.map {
 text-align: center;
 margin-bottom: 50px;
}

.info {
font-size:18px;
}

.explain {
font-size:15px;
}
hr.soften {
  height: 1px;
  background-image: -webkit-linear-gradient(left, rgba(0,0,0,0), rgba(0,0,0,.8), rgba(0,0,0,0));
  background-image:    -moz-linear-gradient(left, rgba(0,0,0,0), rgba(0,0,0,.8), rgba(0,0,0,0));
  background-image:     -ms-linear-gradient(left, rgba(0,0,0,0), rgba(0,0,0,.8), rgba(0,0,0,0));
  background-image:      -o-linear-gradient(left, rgba(0,0,0,0), rgba(0,0,0,.8), rgba(0,0,0,0));
  border: 0;
}
.table_wrap {
	margin: 20px;
}
.table_img {
	height:300px;
	margin:0 10px 0 20px;
	
}
@media screen and (min-width: 480px) {
   .table_img {
        height:100px;
        width:100px;
    }
}
.sub_text {
	color:#002060;
}
.main_text{
	padding-left:10px;
}
.hr {
	border-top: 1px dashed #8c8b8b;
}

</style>

<!-- <script>
$(document).ready(function(){
	$(".cart_div").click(function(){
    	/* $(".map_div").show(200,'swing'); */
		$(".map_div").slideDown(200);
	});
	$(".map_div").click(function(){
    	/* $(".map_div").hide(200); */
		$(".map_div").slideUp(200);
	});
}); 


</script> -->


</head>
<body class="body">
<div class="container">
	<div class="tab_wrap">
	

	<span class="tab">찜 삭제</span>
	|
	<span class="tab">목록</span>
	<span class="tab">메인</span>
	</div>
		
	
	<%-- c:forEach var="i" begin="1" end="3"> --%>
	<div class="row cart">
	
	<div class="cart_wrap">
	<hr class="soften"><h3 class="sub_text text-left main_text">코스  전체보기</h3><hr class="soften">
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
			&nbsp;
			<span class="glyphicon glyphicon-thumbs-up">5</span>
			</td>
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
			<img src="res2.jpg" class="cart_img">
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
	<hr class="soften" /><h3 class="sub_text">코스 경로</h3><hr class="soften" /> 
		<div class="map">
		
		<br>
		<img src="c_image/map1.jpg" class="map_img">
		</div>
	
		</div>
	</div>
	<div class="table_wrap">


	<hr class="soften" /><h3 class="sub_text">코스 개별정보</h3><hr class="soften" /> 
	
	
	<br><br>
	<table class="info" id="table_content">
      
         <tr>
           <c:forEach var="i" begin="1" end="3">
          <table id="table_content">
           <tr>
            <td width=30% align=center rowspan="5">
             <img src="date1.jpg" width=300>
            </td>
           </tr>
           <tr>
             <td width=20% align=center><h4> ${i }번째 장소 </h4> </td>
             <td width=50% align=left class="explain">$ 장소종류 - 식당 / 놀거리 / 카페</td>
           </tr>
           <tr>
             <td width=20% align=center><h4>  장소 이름  </h4> </td>
             <td width=50% align=left class="explain"> $ 장소이름 - 00 식당</td>
           </tr>
           <tr>
             <td width=20% align=center><h4>지역 설명</h4></td>
             <td width=50% align=left class="explain">$ 서울 마포구 00동 00번지</td>
           </tr>
           <tr>
             <td width=20% align=center><h4>  장소 설명 </h4></td>
             <td width=50% align=left class="explain">
             $ 장소 설명 - 해당 장소는 정말 끝내주는 장소이며
		아주지리고요오지고요고요고요고요한밤이고요리얼팩트반박불가입니다
		$ 장소 설명 - 해당 장소는 정말 끝내주는 장소이며
		아주지리고요오지고요고요고요고요한밤이고요리얼팩트반박불가입니다
		$ 장소 설명 - 해당 장소는 정말 끝내주는 장소이며
		아주지리고요오지고요고요고요고요한밤이고요리얼팩트반박불가입니다
		$ 장소 설명 - 해당 장소는 정말 끝내주는 장소이며
		아주지리고요오지고요고요고요고요한밤이고요리얼팩트반박불가입니다
		$ 장소 설명 - 해당 장소는 정말 끝내주는 장소이며
		아주지리고요오지고요고요고요고요한밤이고요리얼팩트반박불가입니다
		$ 장소 설명 - 해당 장소는 정말 끝내주는 장소이며
		아주지리고요오지고요고요고요고요한밤이고요리얼팩트반박불가입니다
		$ 장소 설명 - 해당 장소는 정말 끝내주는 장소이며
		아주지리고요오지고요고요고요고요한밤이고요리얼팩트반박불가입니다</td>
           </tr>
          </table>
         
          <br><br>
          <hr class="hr" />
          <br><br>
         </c:forEach>
          </tr>
       </table>
	<br><br>

	
	</div>


</div>
	<%-- </c:forEach> --%>


</body>
</html>