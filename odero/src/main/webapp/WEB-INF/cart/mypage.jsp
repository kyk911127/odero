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
   /*  border : 1px solid gray; */
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
	

	<!-- <span class="tab">�� ����</span> -->
	<a href="mypage_list.do"><span class="tab">�� ����Ʈ</span></a>
	</div>
		
	
	<%-- c:forEach var="i" begin="1" end="3"> --%>
	<div class="row cart">
<div class="table_wrap">
	<hr class="soften" /><h3 class="sub_text">��õ ���� ����Ʈ  Best5 &nbsp;
	<a href="mypage_list.do"><button class="btn btn-success btn-xs">������ </button></a> <hr class="soften" /> 
		</h3> 

           
          <table class="table table-hover" id="table_content" width=600>
 			<tr>
 				<th width="5%">��ȣ</th>
 				<th width="30%" class="text-center">�����̸�</th>
 				<th width="40%" class="text-center">���԰��</th>
 				<th width="15%">��õ</th>
 				<th width="5%">�ڼ���</th>
 				<th width="5%">����</th>
 			</tr>
 			
 			<c:forEach var="i" begin="1" end="5">
 			<tr>
 				<td width="5%">${i}</td>
 				<td width="30%" class="text-center">$�ڽ��̸�</td>
 				<td width="40%" class="text-center">$�ڽ����</td>
 				<td width="15%">$��õ</td>
 				<td width="5%"><button class="btn btn-info btn-xs">����</button></td>
 				<td width="5%"><button class="btn btn-danger btn-xs">����</button></td>
 			</tr>
 			  </c:forEach>
 			<tr>
 				<td colspan="6" class="text-right"> �ڼ��� ����� �ڼ������⸦ ��������</td>
 			</tr> 			
          </table>

        <!--   <hr class="hr" /> -->
       


	
	</div>
	</div>
	
	<br><br>
<div class="table_wrap">


	<hr class="soften" /><h3 class="sub_text">��õ �ڽ� ����Ʈ Best5 &nbsp;
	<a href="mypage_list.do"><button class="btn btn-success btn-xs">������ </button></a> <hr class="soften" /> 
	
	</h3> 
	

         
          <table class="table table-hover" id="table_content" width=600>
 			<tr>
 				<th width="5%">��ȣ</th>
 				<th width="30%" class="text-center">�ڽ��̸�</th>
 				<th width="40%" class="text-center">�ڽ����</th>
 				<th width="15%">��õ</th>
 				<th width="5%">�ڼ���</th>
 				<th width="5%">����</th>
 			</tr>
 			  <c:forEach var="i" begin="1" end="5">
 			<tr>
 				<td width="5%">${i}</td>
 				<td width="30%" class="text-center">$�ڽ��̸�</td>
 				<td width="40%" class="text-center">$�ڽ����</td>
 				<td width="15%">$��õ</td>
 				<td width="5%"><button class="btn btn-info btn-xs">����</button></td>
 				<td width="5%"><button class="btn btn-danger btn-xs">����</button></td>
 			</tr>
 			      </c:forEach>
 			      
 			<tr>
 				<td colspan="6" class="text-right"> �ڼ��� ����� �ڼ������⸦ ��������</td>
 			</tr>
          </table>
			
       
   

	</div>


</div>
	<%-- </c:forEach> --%>


</body>
</html>