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

/*������ 1Ʋ  */
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
		position:relative; /*���δ� ���̾ ������ �Ӽ��� ����ִ� �� �ʼ�!(relative, absolute, fixed �� ��1*/ 
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
				<h2 class="sc_ti text-center">�� õ �� ��</h2><br>
				<h4 class="sc_ti text-center">������</h4>
			</div>
			<div class="sc_box">
				<!--����  -->
				<div class="tmap_1">
					<div id="map_div"></div>  
				</div>

				<center>
					<div class="tmap_2">
						<center>
						<table class="tmap_table">
							<tr>
								<td width=47% class="tmap_td"></td>
								<td width=6% rowspan="2" class="text-center"><h4><b>�Ÿ����</b></h4></td>
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
						<!--1��  -->
								<td width="24%">
									<table class="tmap_wrap">
										<tr>
											<td style="padding:3%;">
												<scan class="glyphicon glyphicon-home">�����̸�
											</td>
										</tr>
										<tr>
											<td>
												<span class="tmap_detail">&nbsp;��õ�� ������ ����2��</span>
											</td>
										</tr>
										<tr>
											<td class="text-right">
												<span class="tmap_detail glyphicon glyphicon-eye-open">��ȸ��</span>
												<span class="tmap_detail glyphicon glyphicon-heart">��&nbsp;</span>
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
													<span>�̵� �Ÿ� </span><span>100m</span>
												</td>
												<td rowspan="2"><span class="glyphicon glyphicon-chevron-right"></span></td>
											</tr>
											<tr>
											
												<td class="tmap_res">
													<span>�̵� �ð� </span><span>3��</span>
												</td>
												
											</tr>
										</table>
									</center>
								</td>
						<!--2��  -->
								<td width="24%">
									<table class="tmap_wrap">
										<tr>
											<td style="padding:3%;">
												<scan class="glyphicon glyphicon-home">�����̸�
											</td>
										</tr>
										<tr>
											<td>
												<span class="tmap_detail">&nbsp;��õ�� ������ ����2��</span>
											</td>
										</tr>
										<tr>
											<td class="text-right">
												<span class="tmap_detail glyphicon glyphicon-eye-open">��ȸ��</span>
												<span class="tmap_detail glyphicon glyphicon-heart">��&nbsp;</span>
											</td>
										</tr>
									</table>
								</td>
								<td width="13%">
									<center>
									
										<table style="float:left; margin:3%;">
											<tr>
												<td class="tmap_res">
													<span>�̵� �Ÿ� </span><span>100m</span>
												</td>
												<td rowspan="2">
													<span class="glyphicon glyphicon-chevron-right"></span><!-- �̵��Ÿ� ȭ��ǥ -->
												</td>
											</tr>
											<tr>
												<td class="tmap_res">
													<span>�̵� �ð� </span><span>3��</span>
												</td>
											</tr>
										</table>
									</center>
								</td>
						<!-- 3�� -->
								<td width="24%">
									<table class="tmap_wrap">
										<tr>
											<td style="padding:3%;">
												<scan class="glyphicon glyphicon-home">�����̸�
											</td>
										</tr>
										<tr>
											<td>
												<span class="tmap_detail">&nbsp;��õ�� ������ ����2��</span>
											</td>
										</tr>
										<tr>
											<td class="text-right">
												<span class="tmap_detail glyphicon glyphicon-eye-open">��ȸ��</span>
												<span class="tmap_detail glyphicon glyphicon-heart">��&nbsp;</span>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
				<!--�ڽ� �� �ϱ� ��ư  -->
						<table>
							<tr>
								<td class="btn-like text-center">
									<button type="button" class="btn like" data-toggle="modal" data-target="#myModal" aria-hidden="true" style=" outline: none;">
										<b>�ڽ� ���ϱ�</b>
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
	      <!-- ��� �ݱ� -->
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	        	<span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <!-- ��� ���� -->
	      <div class="modal-body">
	      	<center>
	        	<img src="img_1/date.jpg" width="300px" height="300px">
	        	<br clear=left>
	        		<h5 style="margin-top:2%;"><b>�����Ͻ� ����Ʈ �ڽ��� �� �Ͻðڽ��ϱ�?</b></h5>
	        </center>
	      </div>
	      <div class="modal-footer">
	      	<center>
		      	<button type="button" class="btn btn-default" style="background-color:white;outline: none;"><b>�ڽ� ��</b></button>
		        <button type="button" class="btn btn-default" style="background-color:white;outline: none;" data-dismiss="modal" ><b>���</b></button>
	        </center>
	      </div>
	    </div>
	  </div>
	  </center>
	</div>
	
	<div class="container rc">
		<div class="rc_box">
		<!--���� ����Ʈ  -->
        <div class="row">
           	<div style="width:100%; height:25px;"	> 
           		<h4 style="margin:0px; float:left"><b>�� ��õ</b><b style="color:#DF0101;">����</b></h4>
           	</div>
           	<c:forEach begin="1" end="3">
	     	   <div class="col-md-4 text-center">
	        	   <div class="box">
	               	<div class="box-content">
	               	<!--���� �̸�  -->
	               		<a href="#" style="color: black; text-decoration:none;">
			                <h4><span class="glyphicon glyphicon-cutlery" style="float:left; margin:2%"></span></h4>
			                <h4 class="tag-title text-left">�����̸�</h4><br>
		                </a>
	                    <hr style="margin:2%;">
	                <!-- ���� �̹��� -->
	                	<div class=rc_img>
		                    <img src="img_1/food3.jpg" style="width:100%; height:250px;">
		                    <br>
		                    <hr style="margin:3px;">
		                </div>
		            <!-- �������� -->
		                <div class="rc_detail">
		                	<table width=100%>
		                		<tr>
		                			<td class="text-left">
		                				<h5><span class="glyphicon glyphicon-map-marker"><b> ������</b></span></h5>
		                			</td>
		                		</tr>
		                		<tr>
		                			<td class="text-left">
		                				<h5><span class="glyphicon glyphicon-usd"><b> ����</b></span></h5>
		                			</td>
		                		</tr><tr>
		                			<td class="text-left">
		                				<h5><span class="glyphicon glyphicon-time"><b> ���� 11:00~20:00</b></span></h5>
		                			</td>
		                		</tr><tr>
		                			<td class="text-right">
		                				<h5>
				                			<span class="glyphicon glyphicon-eye-open" style="margin:2px;">88</span><!--��ȸ��  -->
				                			<span class="glyphicon glyphicon-heart" style="margin:2px;">4</span><!--�� ��   -->
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
            
        
       
        
        <!--��Ÿ� ����Ʈ  -->
            <div class="row">
            	<div style="width:100%; height:25px;"> 
            		<h4 style="margin:0px; float:left"><b>�� ��õ</b><b style="color:#DF0101;">��Ÿ�</b></h4>
            	</div>
            	<c:forEach begin="1" end="3">
	                <div class="col-md-4 text-center">
	                    <div class="box">
	                        <div class="box-content">
		                        <a href="#" style="color: black; text-decoration:none;">
			                		<h4><span class="glyphicon glyphicon-map-marker" style="float:left; margin:2%"></span></h4>
			                		<h4 class="tag-title text-left">�����̸�</h4><br>
		                		</a>
	                            <hr style="margin:2%;">
	                            <img src="img_1/play1.jpg" style="width:100%; height:250px;">
	                            <br>
	                            <hr style="margin:3px;">
		            <!-- �������� -->
		                <div class="rc_detail">
		                	<table class="" width=100%>
		                		<tr>
		                			<td class="text-left">
		                				<h5><span class="glyphicon glyphicon-map-marker"><b> ������</b></span></h5>
		                			</td>
		                		</tr>
		                		<tr>
		                			<td class="text-left">
		                				<h5><span class="glyphicon glyphicon-usd"><b> ����</b></span></h5>
		                			</td>
		                		</tr><tr>
		                			<td class="text-left">
		                				<h5><span class="glyphicon glyphicon-time"><b> ���� 11:00~20:00</b></span></h5>
		                			</td>
		                		</tr><tr>
		                			<td class="text-right">
		                				<h5>
				                			<span class="glyphicon glyphicon-eye-open" style="margin:2px;">88</span><!--��ȸ��  -->
				                			<span class="glyphicon glyphicon-heart" style="margin:2px;">4</span><!--�� ��   -->
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
            <!-- ī�� ����Ʈ -->
            <div class="row">
            	<div style="width:100%; height:25px;">
            		<h4 style="margin:0px; float:left"><b>�� ��õ</b><b style="color:#DF0101;">ī��</b></h4>
            	</div>
            	<c:forEach begin="1" end="3">
	                <div class="col-md-4 text-center">
	                    <div class="box">
	                        <div class="box-content">
		                        <a href="#" style="color: black; text-decoration:none;">
			                		<h4><span class="glyphicon glyphicon-glass" style="float:left; margin:2%"></span></h4>
			                		<h4 class="tag-title text-left">�����̸�</h4><br>
		                		</a>
	                            <hr style="margin:2%;">
	                            <img src="img_1/cafe1.png" style="width:100%; height:250px;">
	                            <br>
	                            <hr style="margin:3px;">
		            <!-- �������� -->
				                <div class="rc_detail">
				                	<table width=100%>
				                		<tr>
				                			<td class="text-left">
				                				<h5><span class="glyphicon glyphicon-map-marker"><b> ������</b></span></h5>
				                			</td>
				                		</tr>
				                		<tr>
				                			<td class="text-left">
				                				<h5><span class="glyphicon glyphicon-usd"><b> ����</b></span></h5>
				                			</td>
				                		</tr><tr>
				                			<td class="text-left">
				                				<h5><span class="glyphicon glyphicon-time"><b> ���� 11:00~20:00</b></span></h5>
				                			</td>
				                		</tr><tr>
				                			<td class="text-right">
				                				<h5>
				                					<span class="glyphicon glyphicon-eye-open" style="margin:2px;">88</span><!--��ȸ��  -->
				                					<span class="glyphicon glyphicon-heart" style="margin:2px;">4</span><!--�� ��   -->
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