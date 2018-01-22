<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko" xml:lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<style>
html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre,
	code, form, fieldset, legend, input, textarea, p, blockquote, th, td,
	img {
	margin: 0;
	padding: 0;
}

#front-linker {
	z-index: 250;
	position: fixed;
	left: 0px;
	top: 0px;
	right: 0px;
	min-width: 950px;
	height: 61px;
	background:
		url(//img.echosting.cafe24.com/smartAdmin/img/design/sfix_linker.png)
		repeat 0px 0px;
}

#front-linker {
	min-width: 890px;
}

body, code {
	font: 0.75em "돋움", Dotum, AppleGothic, sans-serif;
	color: #1c1c1c;
	background: #fff;
}

body {
	min-width: 1280px;
}

body {
	min-width: 1180px;
}

html {
	width: 100%;
	height: 100%;
}

html {
	-webkit-text-size-adjust: none;
}

#front-linker .show-ctrl {
	position: relative;
}

#front-linker .hide-ctrl {
	position: absolute;
	right: 20px;
	bottom: -18px;
}

button {
	overflow: visible;
	padding: 0;
	margin: 0;
	border: 0;
	cursor: pointer;
}

#front-linker .hide-ctrl .open {
	overflow: hidden;
	float: right;
	width: 104px;
	height: 30px;
	text-indent: -9999px;
	background:
		url(//img.echosting.cafe24.com/smartAdmin/img/design/sfix_linker.png)
		no-repeat -68px -191px;
}

#front-linker .show-ctrl h2 {
	position: absolute;
	left: 0px;
	top: 0px;
	overflow: hidden;
	width: 210px;
	height: 50px;
	text-indent: -9999px;
	background:
		url(//img.echosting.cafe24.com/smartAdmin/img/design/sfix_linker.png)
		repeat 0px -71px;
}

#front-linker .show-ctrl h2 {
	z-index: 260;
}

#front-linker .show-ctrl .admin {
	position: absolute;
	right: 58px;
	top: 0px;
	width: 164px;
	height: 50px;
	background:
		url(//img.echosting.cafe24.com/smartAdmin/img/design/sfix_linker.png)
		no-repeat 0px -131px;
}

#front-linker .show-ctrl .use {
	position: absolute;
	left: 50%;
	top: 18px;
	overflow: hidden;
	width: 242px;
	height: 15px;
	margin-left: -216px;
	background:
		url(//img.echosting.cafe24.com/smartAdmin/img/design/sfix_linker.png)
		no-repeat 0px -413px;
}

#front-linker .show-ctrl .manual {
	position: absolute;
	right: 222px;
	top: 0px;
	overflow: hidden;
	width: 78px;
	height: 50px;
	background:
		url(//img.echosting.cafe24.com/smartAdmin/img/design/sfix_linker.png)
		no-repeat -174px -131px;
}

#front-linker .show-ctrl .choice {
	position: absolute;
	top: 13px;
	width: 240px;
	margin-left: 30px;
}

#front-linker .show-ctrl .choice {
	margin-left: 0px;
	right: 300px;
	background:
		url(//img.echosting.cafe24.com/smartAdmin/img/design/sfix_linker.png)
		no-repeat 0px 0px;
}

#introduce {
	display: none;
	z-index: 260;
	position: absolute;
	top: 42px;
	left: 50%;
	margin-left: -250px;
	width: 468px;
	padding: 10px 20px;
	font-size: 11px;
	line-height: 1.5;
	background-color: #fff;
	border: 1px solid #565960;
}

#introduce {
	position: relative;
}

#front-linker .show-ctrl .close {
	border: 0;
	position: absolute;
	right: 0px;
	top: 0px;
	overflow: hidden;
	width: 58px;
	height: 50px;
	text-indent: -9999px;
	background:
		url(//img.echosting.cafe24.com/smartAdmin/img/design/sfix_linker.png)
		no-repeat 0px -191px;
}

#introduce .title {
	font-weight: bold;
	color: #010101;
	letter-spacing: -1px;
}

#introduce p {
	margin: 5px 0 0;
	color: #787880;
	letter-spacing: -1px;
}

#introduce ul {
	margin: 15px 0 0;
	color: #3c3f48;
}

#introduce .hide {
	position: absolute;
	right: 13px;
	top: 8px;
	overflow: hidden;
	width: 7px;
	height: 7px;
	text-indent: -9999px;
	border: 0;
	background:
		url(//img.echosting.cafe24.com/smartAdmin/img/design/sfix_linker.png)
		no-repeat -22px -361px;
}

#introduce .edge {
	position: absolute;
	left: 140px;
	top: -11px;
	width: 0px;
	height: 0px;
	border: 5px solid #373946;
	border-bottom: 6px solid #fff;
}

li {
	list-style: none;
}

#introduce li strong {
	color: #5893cf;
}

#introduce p strong {
	font-weight: normal;
	color: #5893cf;
}

#front-linker .show-ctrl .choice li {
	position: relative;
	float: left;
	margin: 0 0 0 32px;
	background:
		url(//img.echosting.cafe24.com/smartAdmin/img/design/sfix_linker.png)
		no-repeat 0 -309px;
}

#front-linker .show-ctrl .choice li.selected {
	background-position: 0px -274px;
}

#front-linker .show-ctrl .choice li label {
	display: block;
	height: 26px;
	padding: 0 0 0 31px;
	line-height: 26px;
	color: #989898;
	font-size: 12px;
	font-weight: bold;
}

#front-linker .show-ctrl .choice li.selected label {
	color: #83bfff;
}

input, select, textarea {
	font-size: 100%;
	font-family: "돋움", Dotum;
	color: #1b1b1b;
	vertical-align: middle;
}

#front-linker .show-ctrl .choice li input {
	position: absolute;
	left: 0px;
	top: 0px;
	visibility: hidden;
}

a {
	text-decoration: none;
	color: #000;
}

#front-linker .show-ctrl .manual a {
	display: block;
	overflow: hidden;
	width: 100%;
	height: 100%;
	text-indent: -9999px;
}

#front-linker .show-ctrl .use a {
	display: block;
	overflow: hidden;
	width: 100%;
	height: 100%;
	text-indent: -9999px;
}

#front-linker .show-ctrl .admin a {
	display: block;
	overflow: hidden;
	width: 100%;
	height: 100%;
	text-indent: -9999px;
}
</style>
</head>
<body id="main" style="margin-top: 61px;">
	<div id="front-linker" style="top: 0px;">
		<div class="show-ctrl">
			<h2>Front Remocon</h2>
			<p class="admin">
				<a href="/admin/php/index.php" target="_blank">쇼핑몰 관리자 바로가기</a>
			</p>
			<p class="use">
				<a href="#introduce">쇼핑몰 관리자 기능을 사용하시겠습니까?</a>
			</p>
			<p class="manual">
				<a href="//img.echosting.cafe24.com/guide/customerManual.pdf"
					target="_blank">쇼핑몰 관리자 매뉴얼</a>
			</p>
			<ul class="choice">
				<li
					title="사용함으로 설정하면, 원하는 부분을 바로 수정할 수 있도록 관리자 페이지를 링크하여 줍니다. 원하는 부분의 관리자 설정과 디자인 편집을 할 수 있습니다."
					class="yes"><label><input name="active" type="radio"
						value="1"> 사용함</label></li>
				<li title="사용안함으로 설정하면, 기존 쇼핑몰 화면의 각 페이지로 이동 할 수 있습니다."
					class="no selected"><label><input name="active"
						type="radio" value="0"> 사용안함</label></li>
			</ul>
			<div id="introduce" style="display: none;">
				<strong class="title">쇼핑몰 관리자 기능</strong>
				<p>
					쇼핑몰 관리자 기능이란? 관리자 페이지에 접속하지 않고도 쇼핑몰 화면에<br> <strong>대표운영자로
						로그인 시, 원하는 부분을 바로 수정할 수 있도록 관리자 설정 페이지를<br> 링크 또는 디자인 편집창을 링크
						해주는 기능
					</strong>을 말합니다.
				</p>
				<ul>
					<li><strong>* 사용함</strong> : 관리자 설정 페이지 및 디자인 편집창 링크하여 바로 수정할
						수 있습니다.</li>
					<li><strong>* 사용안함</strong> : 기존 쇼핑몰 화면의 페이지를 이동할 수 있습니다.</li>
				</ul>
				<button class="hide" type="button">레이어 닫기</button>
				<span class="edge"></span>
			</div>
			<button class="close" type="button" value="0">쇼핑몰 관리자 기능 접기</button>
		</div>
		<div class="hide-ctrl">
			<button class="open" style="display: none;" type="button" value="1">열기</button>
		</div>
	</div>
</body>
</html>
