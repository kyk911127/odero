<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style type="text/css">
/* div{
	border : 1px solid black;
} */
 .sc_box{
	margin-top:7%;
	width:100%;
	margin: 0px auto;
}

/*소제목 1틀  */
.sc_title{
	width:60%;
	margin:2% auto; 
	border:1px solid #E6E6E6; 
	padding:1%;
		margin-bottom: 30px;
}

.tag-title {
	margin-top: 8px;
	float:left;
}
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
  border:2px dashed #DFE2E6;
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
.rc_box{
	padding-top:3%;
}
.title{
	 margin:2%; 
}
.big_title{
	width:50%; padding:2%;background-color:#fff; margin:0px auto;
}

	#Mymodal{
   position: fixed;
   top:25%;
     height: 300px;}



.tmap_1{
	width:80%; 
	height:70%; 
	margin:0px auto;
	
}
.tmap_2{
	width:63%; 
	height:230px;  
	background-color:#FAFAFA;
	padding:1%;
}

.btn-like{
	height:50px;
}

.like{
	background-color:#F3ABBA; 
	font-color:#ffffff;
}
.tmap_td {
	border-bottom: 1.5px solid #888; 
}
.tmap_td_b {
	border-top: 2px solid #888; 
}
.tmap_table {
	width:100%;
	height:50px;
}
.tmap_title {
	font-size: 18px;
	float:left;
}
.tmap_detail {
	font-size: 12px;
}

.tmap_res {
	font-size: 13px;
}
.tmap_wrap {
	padding:2%;
	background: #666;
	color:#fff;
	 width:100%; 
}
.rc_title{
	margin:2%;
}
.rc{
	background-color:#FAFAFA; 
	margin-top:0%;
}
.sc_ti{
	color:#2E2E2E;; height:30px; font-weight: bold;
}

.rc_detail{
	font-size:5px;
}

</style>

<!-- <script type="text/javascript">
	$(document).ready(function() {
	}); 
</script> -->

</head>
<body>
		<div class="container-fluid sc">
			<div class="sc_title">
				<h2 class="sc_ti text-center">추 천 코 스</h2><br>
				<h4 class="sc_ti text-center">▼▼▼▼▼</h4>
			</div>
			<div class="sc_box">
				<!--지도  -->
				<div class="tmap_1">
					<div id="map_div"></div>  
				</div>

				<center>
					<div class="tmap_2">
						<center>
						<table class="tmap_table">
							<tr>
								<td width=47% class="tmap_td"></td>
								<td width=6% rowspan="2" class="text-center"><h4><b>거리계산</b></h4></td>
								<td width=47% class="tmap_td"></td>
							</tr>
							<tr>
								<td class="tmap_td_b"></td>
								<td class="tmap_td_b"></td>
							</tr>
						</table>
						</center>
						<table width="95%" height="100px">
							<tr>
						<!--1번  -->
								<td width="24%">
									<table class="tmap_wrap">
										<tr>
											<td style="padding:3%;">
												<scan class="glyphicon glyphicon-home">가게이름
											</td>
										</tr>
										<tr>
											<td>
												<span class="tmap_detail">&nbsp;인천시 연수구 연수2동</span>
											</td>
										</tr>
										<tr>
											<td class="text-right">
												<span class="tmap_detail glyphicon glyphicon-eye-open">조회수</span>
												<span class="tmap_detail glyphicon glyphicon-heart">찜&nbsp;</span>
											</td>
										</tr>
									</table>
								</td>
								<td width="13%">
									<center>
									<!-- <span class="glyphicon glyphicon-chevron-right"></span> -->
										<table style="float:left; margin:3%;">
											<tr>
												<td class="tmap_res">
													<span>이동 거리 </span><span>100m</span>
												</td>
												<td rowspan="2"><span class="glyphicon glyphicon-chevron-right"></span></td>
											</tr>
											<tr>
											
												<td class="tmap_res">
													<span>이동 시간 </span><span>3분</span>
												</td>
												
											</tr>
										</table>
									</center>
								</td>
						<!--2번  -->
								<td width="24%">
									<table class="tmap_wrap">
										<tr>
											<td style="padding:3%;">
												<scan class="glyphicon glyphicon-home">가게이름
											</td>
										</tr>
										<tr>
											<td>
												<span class="tmap_detail">&nbsp;인천시 연수구 연수2동</span>
											</td>
										</tr>
										<tr>
											<td class="text-right">
												<span class="tmap_detail glyphicon glyphicon-eye-open">조회수</span>
												<span class="tmap_detail glyphicon glyphicon-heart">찜&nbsp;</span>
											</td>
										</tr>
									</table>
								</td>
								<td width="13%">
									<center>
									
										<table style="float:left; margin:3%;">
											<tr>
												<td class="tmap_res">
													<span>이동 거리 </span><span>100m</span>
												</td>
												<td rowspan="2">
													<span class="glyphicon glyphicon-chevron-right"></span><!-- 이동거리 화살표 -->
												</td>
											</tr>
											<tr>
												<td class="tmap_res">
													<span>이동 시간 </span><span>3분</span>
												</td>
											</tr>
										</table>
									</center>
								</td>
						<!-- 3번 -->
								<td width="24%">
									<table class="tmap_wrap">
										<tr>
											<td style="padding:3%;">
												<scan class="glyphicon glyphicon-home">가게이름
											</td>
										</tr>
										<tr>
											<td>
												<span class="tmap_detail">&nbsp;인천시 연수구 연수2동</span>
											</td>
										</tr>
										<tr>
											<td class="text-right">
												<span class="tmap_detail glyphicon glyphicon-eye-open">조회수</span>
												<span class="tmap_detail glyphicon glyphicon-heart">찜&nbsp;</span>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
				<!--코스 찜 하기 버튼  -->
						<table>
							<tr>
								<td class="btn-like text-center">
									<button type="button" class="btn like" data-toggle="modal" data-target="#myModal" aria-hidden="true" style=" outline: none;">
										<b>코스 찜하기</b>
									</button>
								</td>
							</tr>
						</table>
					</center>
				</div>	
				
			</div>
			<div style="width:63%; margin:0px auto;">
				<hr>
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
	        		<h5 style="margin-top:2%;"><b>선택하신 데이트 코스를 찜 하시겠습니까?</b></h5>
	        </center>
	      </div>
	      <div class="modal-footer">
	      	<center>
		      	<button type="button" class="btn btn-default" style="background-color:white;outline: none;"><b>코스 찜</b></button>
		        <button type="button" class="btn btn-default" style="background-color:white;outline: none;" data-dismiss="modal" ><b>취소</b></button>
	        </center>
	      </div>
	    </div>
	  </div>
	  </center>
	</div>
	
	<div class="container rc">
		<div class="rc_box">
		<!--맛집 리스트  -->
        <div class="row">
           	<div style="width:100%; height:25px;"	> 
           		<h4 style="margin:0px; float:left"><b>▶ 추천</b><b style="color:#DF0101;">맛집</b></h4>
           	</div>
           	<c:forEach begin="1" end="3">
	     	   <div class="col-md-4 text-center">
	        	   <div class="box">
	               	<div class="box-content">
	               	<!--맛집 이름  -->
	               		<a href="#" style="color: black; text-decoration:none;">
			                <h4><span class="glyphicon glyphicon-cutlery" style="float:left; margin:2%"></span></h4>
			                <h4 class="tag-title text-left">가게이름</h4><br>
		                </a>
	                    <hr style="margin:2%;">
	                <!-- 맛집 이미지 -->
	                	<div class=rc_img>
		                    <img src="img_1/food3.jpg" style="width:100%; height:250px;">
		                    <br>
		                    <hr style="margin:3px;">
		                </div>
		            <!-- 맛집정보 -->
		                <div class="rc_detail">
		                	<table width=100%>
		                		<tr>
		                			<td class="text-left">
		                				<h5><span class="glyphicon glyphicon-map-marker"><b> 지역구</b></span></h5>
		                			</td>
		                		</tr>
		                		<tr>
		                			<td class="text-left">
		                				<h5><span class="glyphicon glyphicon-usd"><b> 가격</b></span></h5>
		                			</td>
		                		</tr><tr>
		                			<td class="text-left">
		                				<h5><span class="glyphicon glyphicon-time"><b> 평일 11:00~20:00</b></span></h5>
		                			</td>
		                		</tr><tr>
		                			<td class="text-right">
		                				<h5>
				                			<span class="glyphicon glyphicon-eye-open" style="margin:2px;">88</span><!--조회수  -->
				                			<span class="glyphicon glyphicon-heart" style="margin:2px;">4</span><!--찜 수   -->
				                		</h5>
		                			</td>
		                		</tr>
		                	</table>
						</div>
	                </div>
	           	   </div>
	           </div>
            </c:forEach>
            </div>
            
        
       
        
        <!--놀거리 리스트  -->
            <div class="row">
            	<div style="width:100%; height:25px;"> 
            		<h4 style="margin:0px; float:left"><b>▶ 추천</b><b style="color:#DF0101;">놀거리</b></h4>
            	</div>
            	<c:forEach begin="1" end="3">
	                <div class="col-md-4 text-center">
	                    <div class="box">
	                        <div class="box-content">
		                        <a href="#" style="color: black; text-decoration:none;">
			                		<h4><span class="glyphicon glyphicon-map-marker" style="float:left; margin:2%"></span></h4>
			                		<h4 class="tag-title text-left">가게이름</h4><br>
		                		</a>
	                            <hr style="margin:2%;">
	                            <img src="img_1/play1.jpg" style="width:100%; height:250px;">
	                            <br>
	                            <hr style="margin:3px;">
		            <!-- 가게정보 -->
		                <div class="rc_detail">
		                	<table class="" width=100%>
		                		<tr>
		                			<td class="text-left">
		                				<h5><span class="glyphicon glyphicon-map-marker"><b> 지역구</b></span></h5>
		                			</td>
		                		</tr>
		                		<tr>
		                			<td class="text-left">
		                				<h5><span class="glyphicon glyphicon-usd"><b> 가격</b></span></h5>
		                			</td>
		                		</tr><tr>
		                			<td class="text-left">
		                				<h5><span class="glyphicon glyphicon-time"><b> 평일 11:00~20:00</b></span></h5>
		                			</td>
		                		</tr><tr>
		                			<td class="text-right">
		                				<h5>
				                			<span class="glyphicon glyphicon-eye-open" style="margin:2px;">88</span><!--조회수  -->
				                			<span class="glyphicon glyphicon-heart" style="margin:2px;">4</span><!--찜 수   -->
				                		</h5>
		                			</td>
		                		</tr>
		                	</table>
						</div>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>  
            
            <!--  -->
            <!-- 카페 리스트 -->
            <div class="row">
            	<div style="width:100%; height:25px;">
            		<h4 style="margin:0px; float:left"><b>▶ 추천</b><b style="color:#DF0101;">카페</b></h4>
            	</div>
            	<c:forEach begin="1" end="3">
	                <div class="col-md-4 text-center">
	                    <div class="box">
	                        <div class="box-content">
		                        <a href="#" style="color: black; text-decoration:none;">
			                		<h4><span class="glyphicon glyphicon-glass" style="float:left; margin:2%"></span></h4>
			                		<h4 class="tag-title text-left">가게이름</h4><br>
		                		</a>
	                            <hr style="margin:2%;">
	                            <img src="img_1/cafe1.png" style="width:100%; height:250px;">
	                            <br>
	                            <hr style="margin:3px;">
		            <!-- 가게정보 -->
				                <div class="rc_detail">
				                	<table width=100%>
				                		<tr>
				                			<td class="text-left">
				                				<h5><span class="glyphicon glyphicon-map-marker"><b> 지역구</b></span></h5>
				                			</td>
				                		</tr>
				                		<tr>
				                			<td class="text-left">
				                				<h5><span class="glyphicon glyphicon-usd"><b> 가격</b></span></h5>
				                			</td>
				                		</tr><tr>
				                			<td class="text-left">
				                				<h5><span class="glyphicon glyphicon-time"><b> 평일 11:00~20:00</b></span></h5>
				                			</td>
				                		</tr><tr>
				                			<td class="text-right">
				                				<h5>
				                					<span class="glyphicon glyphicon-eye-open" style="margin:2px;">88</span><!--조회수  -->
				                					<span class="glyphicon glyphicon-heart" style="margin:2px;">4</span><!--찜 수   -->
				                				</h5>
				                			</td>
				                		</tr>
				                	</table>
								</div>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div> 
          </div>
</div>
	
</body>
</html>