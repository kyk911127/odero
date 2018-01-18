<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="css/bootstrap.css" /> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script> -->
<style type="text/css">
* {
   box-sizing: border-box;
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   text-decoration: none;
   font-family:'배달의민족 주아';
}

.main_wrap {
   position: relative;
   min-height: 100%;
   padding-bottom: 120px;
   margin: 0px auto;
   width: 100%;
}

a:link {
   text-decoration: none;
}

html, body {
   height: 100%;
}

/* 메뉴 */
.header {
   background: rgb(222,235,247);
   /* background: #ffde00; */ 
   /* background: rgb(239,249,255);  */
   /* 
   background: rgb(251,229,214); */
   height: 170px;
   border: none;
}

.mynav{
   height:170px;
}

.mynav li strong{
   font-size: 21px;
   color: #002060;
   line-height: 170px; 
   padding: 0px 10px;
   margin: 0px;
}
#nav-right{
	margin-right: 10px;
}

#navbar-main {
   height: 170px;/* 
   margin-top: 10px;
   margin-right: 5px; */
}

#navbar-user {
   margin-right: 10px;
}

#logo_img {
   padding: 5px;
   height: 170px;
}

/* .navbar-inverse 
.navbar-inverse .navbar-nav>.open>a:focus, .navbar-inverse .navbar-nav>.open>a:hover
   {
   background: #DEEBF7;
} */
/*  .navbar-inverse .navbar-nav > .open > a:focus {
   color:black;
}   */

/* 푸터 */
#footer {
   background: #ededed;
   width: 100%;
   height: 120px;
   position: absolute;
   left: 0;
   bottom: 0;
   padding-top: 40px;
   color: rgb(170, 170, 170);
   margin: 0px auto;
   margin-top: 50px;
}

#footer span {
   font-size: 13px;
}

.include_wrap{
	margin-bottom: 102px;
}

/* 로그인 모달 */
#login-modal{
	position: fixed;
	top:35%;
	right: 0;
  	bottom: 0;
  	left: 0;
  	height: 300px;
}
/* #login-content{
	height: 300px;
} */
/* 활성화 */
input{
	outline: none;
}
button{
	outline: none;
}
a{
	outline: none;
}


#footer_1, #footer_2, #footer_3, #footer_4 {
   display: inline;
   margin: 0px auto;
}


@media screen and (max-width: 770px) {
   #user_img {
      width: 50px;
      height: 50px;
   }
   #navbar-main {
      margin-top: 10px;
   }
   
   #username{
      display: none;
   }
}

@media ( max-width : 460px) {
   #footer {
      height: 160px;
   }
   #footer_5 {
      padding-bottom: 10px;
   }
   .main_wrap {
      padding-bottom: 160px;
   }
}
</style>
</head>
<body>
   <div class="main_wrap">
      <nav class="navbar navbar-inverse navbar-fixed-top header">
      	<tiles:insertAttribute name="header" />
      </nav>
      <div style="height:170px"></div>
      <div class="include_wrap">
         <tiles:insertAttribute name="content" />
      </div>
      <div id="footer" class="text-center">
      	 <tiles:insertAttribute name="footer" />      
      </div>
   </div>
</body>
</html>