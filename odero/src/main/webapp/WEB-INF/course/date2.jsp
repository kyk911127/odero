<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- <link rel="stylesheet"type="text/css" href="css/bootstrap.min.css" > -->
<link rel="stylesheet"type="text/css" href="css/course.css" >


<!-- 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> -->

<style type="text/css">

/* 
 div{
		border:1px solid black;
	}  */
	.date { 
		position:relative; /*감싸는 레이어에 포지션 속성을 잡아주는 게 필수!(relative, absolute, fixed 중 택1*/ 
		width:100%; 
		height:2000px;
		text-align:center; 
		line-height:100px; /* 
		margin:0 auto;   */
		color:#000; 
		font-size:12px;
		background-color:#E0ECF8; 
	}
	.date_rc {
		 position:absolute; 
		 width:70%; 
		 height:1200px; 
		 text-align:center; 
		 margin:10%;
	}
	
	
.box {
  padding:0 20px 20px 20px;
}

.box .box-content:hover {
  border:2px solid #525C7A;
}

.box .box-content {
  padding: 16px;
  border-radius: 0 0 2px 2px;
  background-clip: padding-box;
  box-sizing: border-box;
  
  background:#fff;
  transition:all 0.2s ease;
  border:1.5px dashed #DFE2E6;
  margin-top: 10px;
  box-sizing: border-box;
  border-radius: 5px;
  background-clip: padding-box;
  padding:0 20px 20px 20px;
  min-height:340px;
}
.box .box-content p {
  color:#515c66;
  text-transform:none;
}
.row{
	margin:0px;
	 margin-bottom:30px;
}
.small{
	margin-top:100px;
}
.title{
	 margin:2%; 
}
.big_title{
	width:50%; padding:2%;background-color:#fff; margin:0px auto;
}

	 
</style>

<script type="text/javascript">

	$(document).ready(function() {

	}); 
</script>

</head>
<body>
		<div class="container-fluid">
			<div class="box1_title">
				<h2 class="text-center" style="color:#000; height:30px; font-weight: bold">추 천 코 스</h2><br>
				<h4 class="text-center" style="color:#2E2E2E; height:30px;font-weight: bold">▼▼▼▼▼</h4>
			</div>
			<div class="box1">
				
				<!--지도  -->
				<div class="tmap_1" style="width:80%; height:70%; float:left;">
					<div id="map_div"></div>  
				</div>
				<!--거리계산  -->
				<div class="tmap_2" style="width:20%; height:550px; float:left; background-color:#FAFAFA">
					<!-- 거리계산 제목  -->
					<div class="map_route" style="height:50px;">
						<h4 class="text-center" style="padding:0%;"><img src="img_1/foot.png" style="padding:0%; padding-left:0%;"><b>거리계산</b></h4>
					</div>
					
					<!-- 거리계산내용 -->
					<div class="route" style="height:450px;">
						<c:forEach begin="1" end="3">
						<!-- 가게이름/주소 -->
						<div class="" style="background-color:#424242; color:white; width:90%; height:75px; margin-left:3%; margin:0px auto; padding:3%;">
							<font size="4pt"><b>1. 도미노피자</b></font>
							<hr style="margin:0px auto; width:90%; padding-bottom:1%;;">
							<font size="1.5pt">서울특별시 마포구 창전로 45 서강한화오벨리스크스위</font>
						</div>
						<!-- 이동거리/시간 -->
						<div class="" style="background-color:white;  width:100%; height:70px; padding-left:10%;">
							<h5>이동거리 : 400M</h5>
							<h5>이동시간 : 7분</h5>
						</div>
						</c:forEach>
					</div>
					
					<!-- 코스 찜하기 버튼 -->
					<div class="btn_like" style="height:50px;">
					<center>
						<button type="button" class="btn" data-toggle="modal" data-target="#myModal" aria-hidden="true" style="background-color:#F3ABBA; color:#ffffff;">
							<b>코스찜하기</b>
						</button>
					</center>
					</div>
				</div>
				</div>	
			</div>
		</div>
		
		
		<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<center>
	  <div class="modal-dialog">
	    <div class="modal-content" style="width:400px;">
	      <div class="modal-header">
	      <!-- 모달 닫기 -->
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	        	<span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <!-- 모달 내용 -->
	      <div class="modal-body">
	      	<center>
	        	<img src="img_1/date.jpg" width="300px" height="300px">
	        	<br clear=left>
	        		<h5><b>선택하신 데이트 코스를 찜 하시겠습니까?</b></h5>
	        </center>
	      </div>
	      <div class="modal-footer">
	      	<center>
		      	<button type="button" class="btn btn-default" style="background-color:white; border:1px solid balck;"><b>코스 찜</b></button>
		        <button type="button" class="btn btn-default" style="background-color:white" data-dismiss="modal"><b>취소</b></button>
	        </center>
	      </div>
	    </div>
	  </div>
	  </center>
	</div>
	

	
	<div class="container">
		
		<div class="small">
		
		<!--맛집 리스트  -->
        <div class="row">
           	<div class="title"> 
           		<h4 style="margin:0px; float:left"><b>▶ 추천</b></h4>
           		<h4 style="margin:0px; color:#DF0101;"><b>맛집</b></h4>
           	</div>
           	<c:forEach begin="1" end="3">
	     	   <div class="col-md-4 text-center">
	        	   <div class="box">
	               	<div class="box-content">
	               	<!--가게 이름  -->
		            	<a href="#" style="color: black; text-decoration:none;">
		                	<img src="img_1/food.png" style="float:left; margin:2%">
		                    <h5 class="tag-title text-left">도미노피자</h5>
		                </a>
	                   	<hr style="margin:2%;">
	                <!-- 가게 이미지 -->
	                    <img src="img_1/food3.jpg" style="width:100%; height:250px;">
	                    <br>
	                    <hr style="margin:2%;">
	                    <p>어쩌구 저쩌구</p>
	                </div>
	           	   </div>
	           </div>
            </c:forEach>
        </div> 
        
        <!--놀거리 리스트  -->
            <div class="row">
            	<div class="title"> 
            		<h4 style="margin:0px; float:left"><b>▶ 추천</b></h4>
           		<h4 style="margin:0px; color:#DF0101;"><b>놀거리</b></h4>
            	</div>
            	<c:forEach begin="1" end="3">
	                <div class="col-md-4 text-center">
	                    <div class="box">
	                        <div class="box-content">
		                        <a href="#" style="color: black; text-decoration:none;">
			                        <img src="img_1/play.png" style="float:left; margin:2%">
			                        <h5 class="tag-title text-left">도미노피자</h5>
		                        </a>
	                            <hr style="margin:2%;">
	                            <img src="img_1/play1.jpg" style="width:100%; height:250px;">
	                            <br><br>
	                            <hr style="margin:2%;">
	                            <p>어쩌구 저쩌구</p>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>  
            
            
            <!-- 카페 리스트 -->
            <div class="row">
            	<div class="title"> 
            		<h4 style="margin:0px; float:left"><b>▶ 추천</b></h4>
           		<h4 style="margin:0px; color:#DF0101;"><b>카페</b></h4>
            	</div>
            	<c:forEach begin="1" end="3">
	                <div class="col-md-4 text-center">
	                    <div class="box">
	                        <div class="box-content">
		                        <a href="#" style="color: black; text-decoration:none;">
		                            <img src="img_1/cafe.png" style="float:left; margin:2%">
		                            <h5 class="tag-title text-left">도미노피자</h5>
		                        </a>
	                            <hr style="margin:2%;">
	                            <img src="img_1/cafe1.png" style="width:100%; height:250px;">
	                            <br><br>
	                            <hr style="margin:2%;">
	                            <p>어쩌구 저쩌구</p>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div> 
          </div>
	</div>
</div>
	
</body>
</html>