<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<style>
  /* ���̵�� ���� ��Ÿ�� */
  
  #page-wrapper {
    padding-left: 250px;
  }
  
  #sidebar-wrapper {
    position: fixed;
    width: 250px;
    height: 100%;
    margin-left: -250px;
    background: #DEEBF7;
    overflow-x: hidden;
    overflow-y: auto;
  }
  
  #page-content-wrapper {
    width: 100%;
    padding: 20px;
  }
  /* ���̵�� ��Ÿ�� */
  
  .sidebar-nav {
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
  .sidebar-nav li {
    text-indent: 1.5em;
    line-height: 2.8em;
  }
  
  .sidebar-nav li a strong {
  	font-size: 20px;
    display: block;
    text-decoration: none;
    color: #002060;
  }
  
  .sidebar-nav li a strong:hover {
    color: black;
    /* background: rgba(255, 255, 255, 0.2); */
  }
  
  .sidebar-nav > .sidebar-brand {
    /* font-size: 1.3em; */
    line-height: 3em;
  }
* {
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	text-decoration: none;
	font-family:'����ǹ��� �־�';
}

a:link {
	text-decoration: none;
}

a {
	color: black;
}

.header {
	background: rgb(222,235,247);
	/* background: #ffde00; */ 
	/* background: rgb(239,249,255);  */
	/* 
	background: rgb(251,229,214); */
	height: 170px;
	border: none;
}

#nav{
	height:170px;
}

/* #nav li a{
	line-height: 170px;
	padding: 0px 10px;
}
 */
/* .nav_main:hover {
	border-bottom: 5px solid rgb(162, 0, 0);
} */

#navbar-main {
	height: 170px;/* 
	margin-top: 10px;
	margin-right: 5px; */
}
#logo_img {
	padding: 5px;
	height: 170px;
	margin-bottom: 30px;
}

.dropdown-menu {
	-webkit-box-shadow: none;
	box-shadow: none;
	border: none;
	background: #DEEBF7;
}

#dropdown_sub h5 {
	/* font-size: 15px; */
	color: #fff;
}

#dropdown_sub {
	border: none;
}

#dropdown_sub:hover {
	background: #DEEBF7;
}

.navbar-inverse 
.navbar-inverse .navbar-nav>.open>a:focus, .navbar-inverse .navbar-nav>.open>a:hover
	{
	background: #DEEBF7;
}
 .navbar-inverse .navbar-nav > .open > a:focus {
   color:black;
} 
#footer {
	background: #ededed;
	width: 100%;
	height: 140px;
	position: absolute;
	left: 0;
	bottom: 0;
	color: rgb(170, 170, 170);
	margin: 0px auto;
}

#footer span {
	font-size: 13px;
}

html, body {
	height: 100%;
}

.main_wrap {
	position: relative;
	min-height: 100%;
	padding-bottom: 120px;
	margin: 0px auto;
	width: 100%;
}

#footer_1, #footer_2, #footer_3, #footer_4 {
	display: inline;
	margin: 0px auto;
}

@media screen and (min-width: 769px) {
	#user_img {
		width: 80px;
		height: 80px;
	}
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
<div id="page-wrapper">
  <!-- ���̵�� -->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a href="#">
        	<img id="logo_img" src="../image/logo.PNG">
        </a>
      </li>
	  <li class="nav_main"><a href="#"><strong>����Ʈ�ڽ�</strong></a></li>
	  <li class="nav_main"><a href="#"><strong>����</strong></a></li>
	  <li class="nav_main"><a href="#"><strong>��Ÿ�</strong></a></li>
	  <li class="dropdown nav_main">
	  	<a href="#" class="dropdown-toggle" data-toggle="dropdown"><strong>Ŀ�´�Ƽ
	  		<b class="caret"></b></strong> </a>
	  		<ul class="dropdown-menu">
	  			<li><a id="dropdown_sub" href="#"><h5>�Խ���</h5></a></li>
	  			<li><a id="dropdown_sub" href="#"><h5>�ı�</h5></a></li>
	  		</ul>
	  </li>
	  <li class="nav_main"><a href="#"><strong>��</strong></a></li>
	</ul>
	<div class="include_wrap">
			<div style="height: 102px"></div>
			<div id="footer" class="text-center">
				<div id="footer_1">
					<strong>COMPANY&nbsp;&nbsp;&nbsp;</strong> <span>���������۴�</span>
					&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<div id="footer_2">
					<strong>OWNER&nbsp;&nbsp;&nbsp;</strong> <span>������ ���±� �ڼ��� �ǿ��� �纸�� ������ ��ټ� ������ 
					
					</span> &nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<div id="footer_3">
					<strong>TEL&nbsp;&nbsp;&nbsp;</strong> <span>02-1234-1234</span>
					&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<div id="footer_4">
					<strong>E-MAIL&nbsp;&nbsp;&nbsp;</strong> <span>o@dego.com</span>
					&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<br> <br>
				<div id="footer_5">
					<strong>ADDRESS&nbsp;&nbsp;&nbsp;</strong> <span>����Ư���� ���빮��
						�Ͼ����� 125-44 4��</span>
				</div>
			</div>
		</div>
  </div>
  <!-- /���̵�� -->

  <!-- ���� -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
      <h1>������ ���̵��</h1>
      <jsp:include page="${main_jsp}"></jsp:include>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
      <p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p><p>�޴��� ���Ƽ� �� �������� ������ ���� ��ũ�ѹ� ����</p>
    </div>
  </div>
  <!-- /���� -->
</div>
</body>
</html>