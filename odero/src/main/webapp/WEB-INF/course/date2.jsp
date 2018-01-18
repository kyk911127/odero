<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style type="text/css">

 .box1{
	margin-top:7%;
	width:80%;
	margin: 0px auto;
}

/*������ 1Ʋ  */
.box1_title{
	width:60%;
	margin:2% auto; 
	border:1px solid #E6E6E6; 
	padding:1%;
}
.box1_title {
	margin-bottom: 30px;
}

.tag-title {
	margin-top: 8px;
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
	margin-top:3%;
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
	float:left;
}
.tmap_2{
	width:20%; 
	height:550px; 
	float:left; 
	background-color:#FAFAFA;
}
.route-title{
	height:50px;
}
.route-content{
	height:450px;
}

.route-name{
	background-color:#424242; color:white; width:90%; height:75px; margin-left:3%; margin:0px auto; padding:3%;
}

.route-time{
	background-color:white;  width:100%; height:70px; padding-left:10%;
}
.btn-like{
	height:50px;
}

.like{
	background-color:#F3ABBA; 
	font-color:#ffffff;
}

</style>

<!-- <script type="text/javascript">
	$(document).ready(function() {
	}); 
</script> -->

</head>
<body>
		<div class="container-fluid">
			<div class="box1_title">
				<h2 class="text-center" style="color:#000; height:30px; font-weight: bold">�� õ �� ��</h2><br>
				<h4 class="text-center" style="color:#2E2E2E; height:30px;font-weight: bold">������</h4>
			</div>
			<div class="box1">
				
				<!--����  -->
				<div class="tmap_1">
					<div id="map_div"></div>  
				</div>
				<!--�Ÿ����  -->
				<div class="tmap_2">
					<!-- �Ÿ���� ����  -->
					<div class="route-title">
						<h4 class="text-center" style="padding:0%;">
							<img src="img_1/foot.png" style="padding:0%; padding-left:0%;">
								<b>�Ÿ����</b>
						</h4>
					</div>
					
					<!-- �Ÿ���곻�� -->
					<div class="route-content">
						<c:forEach begin="1" end="3">
						<!-- �����̸�/�ּ� -->
						<div class="route-name">
							<font size="4pt"><b>1. ���̳�����</b></font>
							<hr style="margin:0px auto; width:90%; padding-bottom:1%;">
							<font size="1.5pt">����Ư���� ������ â���� 45 ������ȭ��������ũ����</font>
						</div>
						<!-- �̵��Ÿ�/�ð� -->
						<div class="route-time">
							<h5>�̵��Ÿ� : 400M</h5>
							<h5>�̵��ð� : 7��</h5>
						</div>
						</c:forEach>
					</div>
					
					<!-- �ڽ� ���ϱ� ��ư -->
					<div class="btn-like">
					<center>
						<button type="button" class="btn like" data-toggle="modal" data-target="#myModal" aria-hidden="true">
							<b>�ڽ����ϱ�</b>
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
	        		<h5><b>�����Ͻ� ����Ʈ �ڽ��� �� �Ͻðڽ��ϱ�?</b></h5>
	        </center>
	      </div>
	      <div class="modal-footer">
	      	<center>
		      	<button type="button" class="btn btn-default" style="background-color:white;"><b>�ڽ� ��</b></button>
		        <button type="button" class="btn btn-default" style="background-color:white" data-dismiss="modal"><b>���</b></button>
	        </center>
	      </div>
	    </div>
	  </div>
	  </center>
	</div>
	

	
	<div class="container" style="background-color:#FAFAFA; margin-top:3%;">
		<div class="small">
		
		<!--���� ����Ʈ  -->
        <div class="row">
           	<div class="title"> 
           		<h4 style="margin:0px; float:left"><b>�� ��õ</b></h4>
           		<h4 style="margin:0px; color:#DF0101;"><b>����</b></h4>
           	</div>
           	<c:forEach begin="1" end="3">
	     	   <div class="col-md-4 text-center">
	        	   <div class="box">
	               	<div class="box-content">
	               	<!--���� �̸�  -->
		            	<a href="#" style="color: black; text-decoration:none;">
		                	<img src="img_1/food.png" style="float:left; margin:2%">
		                    <h5 class="tag-title text-left">�����̸�</h5>
		                </a>
	                   	<hr style="margin:2%;">
	                <!-- ���� �̹��� -->
	                    <img src="img_1/food3.jpg" style="width:100%; height:250px;">
	                    <br>
	                    <hr style="margin:2%;">
	                    <p></p>
	                </div>
	           	   </div>
	           </div>
            </c:forEach>
        </div> 
        
        <!--��Ÿ� ����Ʈ  -->
            <div class="row">
            	<div class="title"> 
            		<h4 style="margin:0px; float:left"><b>�� ��õ</b></h4>
           		<h4 style="margin:0px; color:#DF0101;"><b>��Ÿ�</b></h4>
            	</div>
            	<c:forEach begin="1" end="3">
	                <div class="col-md-4 text-center">
	                    <div class="box">
	                        <div class="box-content">
		                        <a href="#" style="color: black; text-decoration:none;">
			                        <img src="img_1/play.png" style="float:left; margin:2%">
			                        <h5 class="tag-title text-left">���̳�����</h5>
		                        </a>
	                            <hr style="margin:2%;">
	                            <img src="img_1/play1.jpg" style="width:100%; height:250px;">
	                            <br><br>
	                            <hr style="margin:2%;">
	                            <p>��¼�� ��¼��</p>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>  
            
            
            <!-- ī�� ����Ʈ -->
            <div class="row">
            	<div class="title"> 
            		<h4 style="margin:0px; float:left"><b>�� ��õ</b></h4>
           		<h4 style="margin:0px; color:#DF0101;"><b>ī��</b></h4>
            	</div>
            	<c:forEach begin="1" end="3">
	                <div class="col-md-4 text-center">
	                    <div class="box">
	                        <div class="box-content">
		                        <a href="#" style="color: black; text-decoration:none;">
		                            <img src="img_1/cafe.png" style="float:left; margin:2%">
		                            <h5 class="tag-title text-left">���̳�����</h5>
		                        </a>
	                            <hr style="margin:2%;">
	                            <img src="img_1/cafe1.png" style="width:100%; height:250px;">
	                            <br><br>
	                            <hr style="margin:2%;">
	                            <p>��¼�� ��¼��</p>
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