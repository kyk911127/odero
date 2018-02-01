<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title></title>
<style>
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	min-height: 100%;
	font-size: 12px;
}

body, div, li, dd, dt, td, select, textarea, input {
	font-family: "돋움", dotum, Helvetica, sans-serif;
	font-size: 12px;
}

ul, ol, dl, li, dd, dt, p, form, div {
	list-style: none;
	margin: 0;
	padding: 0;
}

.u_cbox {
	position: relative;
	color: #000;
	text-align: left;
	-webkit-text-size-adjust: none;
}

input {
	color: #333;
}

.se2_line_layer button {
	border: 0;
	background: none;
	font-size: 11px;
	vertical-align: top;
	cursor: pointer;
}

.se2_line_sticker_set {
	position: absolute;
	top: 1px;
	left: 0px;
	width: 458px;
	margin: 0 !important;
	padding: 1px 30px 0 28px !important;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
}

.filter-30 {
	filter: alpha(opacity = 30);
	-ms-filter: "alpha(opacity=30)";
	opacity: 0.3;
}

.filter-50 {
	filter: alpha(opacity = 50);
	-ms-filter: "alpha(opacity=50)";
	opacity: 0.5;
}

.filter-70 {
	filter: alpha(opacity = 70);
	-ms-filter: "alpha(opacity=70)";
	opacity: 0.7;
}

.filter-20, .filter-30, .filter-50, .filter-60, .filter-70, .filter-80 {
	zoom: 1;
}

.u_cbox, .u_cbox p, .u_cbox h1, .u_cbox h2, .u_cboxh3, .u_cbox h4,
	.u_cbox h5, .u_cbox h6, .u_cbox ul, .u_cbox ol, .u_cbox li, .u_cbox dl,
	.u_cbox dt, .u_cbox dd, .u_cbox table, .u_cbox th, .u_cbox td, .u_cbox form,
	.u_cbox fieldset, .u_cbox legend, .u_cbox input, .u_cbox textarea,
	.u_cbox button, .u_cbox select {
	margin: 0;
	padding: 0;
	font-family: "돋움", dotum, Helvetica, sans-serif;
}

.u_cbox, .u_cbox input, .u_cbox textarea, .u_cbox select, .u_cbox button,
	.u_cbox table {
	font-size: 12px;
	line-height: 1.25em;
}

#main-area .bg-color {
	background-color: #f9f9f9;
}

#content-area .box-reply2 {
	zoom: 1;
	margin: 0;
	padding: 11px 26px 16px 24px;
}

#main-area .bg-color {
	background-color: #fbe3e3;
}

.list-blog .inbox {
	width: 743px;
	margin: 14px;
	_zoom: 1;
}

.list-blog {
	clear: both;
	width: 771px;
	margin: 0;
	border-style: solid;
	border-width: 1px;
	_zoom: 1;
}

#main-area .border-sub {
	border-color: #facaca;
}

#main-area {
	width: 773px !important;
}

#content-area {
	position: relative;
	clear: both;
	width: 100%;
	*zoom: 1:;
}

#content-area::after {
	display: block;
	clear: both;
	content: "";
}

body {
	background-color: transparent;
}

.u_cbox ul, .u_cbox ol {
	list-style: none;
}

#content-area .cmlist {
	margin: 0;
	padding: 0;
}

#content-area .cc_paginate {
	height: 51px;
	padding: 7px 0 0;
	text-align: center;
}

#content-area .cmt.cc_paginate {
	height: 29px;
}

.u_cbox table {
	border-collapse: collapse;
}

#content-area .cminput {
	margin: 14px 0 0;
	padding: 0;
	width: 100%;
	border-collapse: collapse;
	table-layout: fixed;
}

.reply_error {
	padding: 66px 20px 27px;
	font-family: 나눔고딕, NanumGothic;
	text-align: center;
	background:
		url(https://cafe.pstatic.net/img/notice/reply_error_exclam.gif)
		no-repeat 50% 30px;
}

a:link {
	text-decoration: none;
}

.u_cbox a {
	color: #000;
	text-decoration: none;
}

.u_cbox a, .u_cbox a:link {
	background-color: transparent;
}

.u_cbox .u_cbox_addition .u_cbox_txt_upload_sticker, .u_cbox .u_cbox_addition .u_cbox_txt_upload_photo
	{
	display: inline-block;
	height: 33px;
	font-size: 12px;
	color: #000;
	opacity: 0.55;
	filter: alpha(opacity = 55);
	vertical-align: top;
}

#main-area select, #main-area textarea, #main-area .list-search input {
	background-color: #FCEBEB;
	border: 1px solid #facaca !important;
}

.list-blog .date {
	font-size: 11px;
	-ms-filter: "Alpha(opacity=50)";
	filter: alpha(opacity = 50);
	opacity: 0.5;
}

.pers_nick_area .p-nick a {
	display: inline-block;
	cursor: pointer;
}

#main-area .m-tcol-c {
	color: #666;
	word-wrap: break-word;
}

#main-area .m-tcol-c {
	color: #666666;
}

.u_cbox b, .u_cbox strong {
	font-weight: normal;
}

.reply_error strong {
	display: block;
	margin: 0 0 4px;
}

.u_cbox_link_wrap {
	display: inline-block;
	position: absolute;
	top: 0px;
	right: 0px;
	bottom: 0px;
	left: 0px;
	color: #fff;
	opacity: 0;
	filter: alpha(opacity = 0);
}

.reply_error a {
	text-decoration: underline;
}

.u_cbox .u_cbox_addition {
	position: relative;
	margin: 0;
	padding: 0 0 0 29px;
	height: 33px;
	list-style: none;
}

.u_cbox .u_cbox_addition::after {
	display: block;
	clear: both;
	content: "";
}

.u_cbox .u_cbox_addition li {
	float: left;
}

.u_cbox .u_cbox_addition .u_cbox_btn_upload_sticker, .u_cbox .u_cbox_addition .u_cbox_btn_upload_photo
	{
	display: inline-block;
	position: relative;
	overflow: hidden;
	*width: 58px:;
	height: 33px;
	line-height: 37px;
	border: 0;
	background-color: transparent;
	vertical-align: top;
}

.u_cbox .u_cbox_addition .u_cbox_btn_upload_photo {
	margin: 0 0 0 14px;
}

.u_cbox_btn_file {
	display: inline-block;
	position: absolute;
	width: 53px;
	height: 33px;
	top: 0px;
	left: 0px;
	right: 0px;
	bottom: 0px;
	z-index: 10;
}

.u_cbox .u_cbox_image_section .u_cbox_image_icon_crop, .u_cbox .u_cbox_image_section .u_cbox_image_icon_gif,
	.u_cbox .u_cbox_upload_image_wrap .u_cbox_ico_delete_thumb, .u_cbox .u_cbox_addition .u_cbox_ico_upload_sticker,
	.u_cbox .u_cbox_addition .u_cbox_ico_upload_photo, .u_cbox .u_cbox_upload_image_wrap .u_cbox_upload_thumb_add
	{
	background-image:
		url(https://ssl.pstatic.net/static/cafe/sp_cbox_160222.png);
	background-repeat: no-repeat;
}

.u_cbox .u_cbox_addition .u_cbox_ico_upload_sticker, .u_cbox .u_cbox_addition .u_cbox_ico_upload_photo
	{
	display: inline-block;
	width: 18px;
	height: 18px;
	margin: -2px -2px 0 0;
	*margin: 8px 2px 0 0:;
	vertical-align: middle;
}

.u_cbox .u_cbox_addition .u_cbox_ico_upload_photo {
	margin-right: -1px;
	*margin-right: 3px:;
}

.u_cbox .u_cbox_addition .u_cbox_ico_upload_photo {
	background-position: -46px -103px;
}

.u_cbox button, .u_cbox label, .u_cbox input[type=checkbox], .u_cbox input[type=radio],
	.u_cbox input[type=button] {
	cursor: pointer;
}

.u_cbox_btn_file label {
	position: absolute;
	width: 53px;
	height: 33px;
	top: 0px;
	left: 0px;
	right: 0px;
	bottom: 0px;
	color: transparent;
	line-height: 33px;
	cursor: pointer;
	text-align: right;
	opacity: 0;
	filter: alpha(opacity = 0);
}

.u_cbox_btn_file input[type=file] {
	position: absolute;
	overflow: hidden;
	width: 0px;
	height: 0px;
	bottom: 0px;
	border: 0;
}

#content-area .box-reply2 input {
	border: none;
	font-weight: normal;
	vertical-align: top;
}

.line_stc_sec {
	position: relative;
	margin-top: -3px;
}

.se2_line_layer {
	overflow: hidden;
	display: none;
	position: absolute;
	top: 52px;
	border: 1px solid #9b9b9b;
	text-align: left;
}

.line_stc_sec .se2_line_layer {
	display: none;
	overflow: visible;
	position: absolute;
	top: 0px;
	left: 1px;
	z-index: 100;
}

.se2_line_layer .se2_in_layer {
	float: left;
	border-top: 1px solid #fcfcfc;
	border-bottom: 1px solid #fcfcfc;
}

.se2_line_sticker {
	overflow: hidden;
	float: left;
	width: 458px;
	height: 381px;
	background: #fff;
}

.se2_line_sticker button.se2_prev, .se2_line_sticker button.se2_next,
	.se2_line_sticker button.se2_prev_off, .se2_line_sticker button.se2_next_off,
	.se2_line_sticker_set li button, .se2_line_sticker_set div.se2_linesticker_list li
	{
	z-index: 20;
	top: 0px;
	width: 29px;
	height: 74px;
	background:
		url("https://cafe.pstatic.net/editor/linesticker/sp_line_sticker_140429.gif")
		no-repeat;
}

.se2_line_sticker button.se2_prev {
	position: relative;
	float: left;
	background-position: -3px 16px;
}

.se2_line_sticker button.se2_next {
	position: relative;
	float: right;
	background-position: -74px 16px;
}

.se2_line_layer button span, .se2_line_layer button em {
	visibility: hidden;
	overflow: hidden;
	position: absolute;
	top: 0px;
	font-size: 0px;
	line-height: 0;
}

.u_cbox .u_cbox_addition .u_cbox_ico_upload_sticker {
	background-position: -24px -103px;
}

#content-area .cminput .i1 {
	width: 29px;
	white-space: nowrap;
	vertical-align: top;
}

#content-area .cminput .i2 {
	*padding-right: 2px:;
}

#content-area .cminput .i3 {
	position: relative;
	width: 89px;
	text-align: right;
	vertical-align: bottom;
}

.u_cbox .u_cbox_btn_upload {
	display: inline-block;
	position: absolute;
	bottom: 0px;
	right: 0px;
	z-index: 10;
	width: 84px;
	height: 61px;
	border: 1px solid #ccc;
	background: #fff !important;
	font-size: 13px;
	font-weight: bold;
	line-height: 61px;
	text-align: center;
}

.u_cbox .u_cbox_btn_upload a {
	display: inline-block;
	width: 100%;
	height: 100%;
	color: #666;
}

#main-area .skin-bgcolor {
	background-color: #fcebeb;
	background-image: none;
	background-repeat: repeat;
}

#content-area .cminput .comm_write_wrap {
	clear: both;
	padding: 10px;
	border-width: 1px;
	border-style: solid;
}

#main-area select, #main-area textarea, #main-area .list-search input {
	background-color: #fff;
	border: 1px solid #e5e5e5 !important;
}

#content-area .cminput .textarea {
	width: 100%;
	margin: 0;
	padding: 1px 0;
	overflow: auto;
	-webkit-appearance: none;
	-webkit-border-radius: 0;
	resize: none;
}

#content-area .cminput .comm_write_wrap .textarea {
	border: 0 !important;
}

.u_cbox .u_cbox_upload_image {
	position: relative;
	z-index: 1;
	padding: 0;
	margin: 1px 0 0 0;
	border-top: 0;
	*zoom: 1:;
}

.u_cbox .u_cbox_upload_image::after {
	display: block;
	clear: both;
	content: "";
}

.reply-write-ico {
	width: 23px;
	height: 31px;
	border-width: 1px;
	border-style: solid;
	border-color: #C5CACD;
	text-align: center;
	background: #fff url(https://cafe.pstatic.net/cafe4/ico-black_2.gif)
		no-repeat 0 100%;
}

img {
	border: none;
}

.reply-write-ico img {
	margin-top: 1px !important;
}

.u_cbox img, .u_cbox fieldset {
	border: 0;
}

#main-area .board-box-line-dashed {
	border-bottom-style: dashed;
	border-bottom-width: 1px;
	-ms-filter: "alpha(opacity=30)";
	filter: alpha(opacity = 30);
	opacity: 0.3;
}

#main-area .board-box-line-dashed {
	border-color: #666666;
}

#content-area .cmlist li {
	list-style: none;
	margin: 0;
	padding: 0 0 7px;
	height: 1%;
}

.list-blog .board-box-line-dashed {
	height: 3px;
	font-size: 0px;
}

#content-area .cmlist .board-box-line-dashed {
	height: 1px;
	padding: 0;
	overflow: hidden;
	font: 0/0 arial;
	border-bottom-width: 1px;
	border-bottom-style: dotted;
}

#content-area .cmlist .comm_cont {
	padding-top: 10px;
}

#content-area .cmlist .h {
	height: 20px;
	margin: 0;
}

#content-area .cmlist .comm {
	padding: 0 0 3px 28px;
	margin: 3px 0 0 0;
	line-height: 15px;
	text-align: left;
	word-break: break-all;
	word-wrap: break-word;
}

.pers_nick_area {
	padding: 0 0 2px !important;
	text-align: left;
	width: 100%;
}

#content-area .box-reply2 .pers_nick_area {
	padding: 0 !important;
	margin: 0;
	text-align: left;
	width: auto;
	float: left;
}

#content-area .cmlist .date {
	float: left;
	font-size: 11px;
	font-family: "돋움", dotum, Helvetica, sans-serif;
	margin: 2px 0 0 1px;
}

#content-area .cmlist .dsc_comm {
	float: left;
	margin: 3px 0 0 7px;
	padding-left: 10px;
	background: url(https://cafe.pstatic.net/cafe4/bu_arr.png) no-repeat 0 0;
	_background: none;
	_filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='https://cafe.pstatic.net/cafe4/bu_arr.png',
		sizingMethod='crop');
	font-size: 11px;
	font-family: "돋움", Dotum;
	letter-spacing: -1px;
}

#content-area .cmlist .btn_edit {
	float: right;
	margin: 0;
	padding-top: 3px;
}

#content-area .cmlist .btn_edit a {
	display: inline-block;
	font-size: 11px;
	font-family: "돋움", dotum, Helvetica, sans-serif;
	letter-spacing: -1px;
}

#content-area .cmlist .dsc_comm a {
	float: left;
}

.pers_nick_area table {
	border: 0 !important;
	width: 100%;
	table-layout: fixed;
}

#content-area .box-reply2 .pers_nick_area table {
	width: auto;
	table-layout: auto;
}

.pers_nick_area .pc2w {
	padding: 0 !important;
	margin: 0;
	vertical-align: top;
	width: 22px;
	border: none !important;
}

#content-area .box-reply2 .pers_nick_area .pc2w {
	width: 28px;
}

.pers_nick_area .p-nick {
	padding: 1px 0 0 !important; .
	padding-top: 2px !important:;
	margin: 0;
	border: none !important;
	line-height: 1.2em;
	overflow: hidden;
}

#content-area .box-reply2 .pers_nick_area .p-nick {
	padding: 1px 0 0 !important; .
	padding-top: 2px !important:;
	margin: 0;
	font-weight: bold;
	line-height: 16px;
	overflow: visible;
}

#content-area .box-reply2 .pers_nick_area .p-nick a {
	margin-right: 6px;
	vertical-align: top;
}

.pers_nick_area .pc img, .pers_nick_area .pc2w img {
	vertical-align: top;
	margin: 0 2px 0 0 !important;
}

#content-area .box-reply2 .pers_nick_area .pc2w img {
	vertical-align: top;
	margin: 0 !important;
}
</style>
</head>
<body>
	<div id="basisElement">
		<div id="content-area">
			<div id="main-area">
				<div class="list-blog border-sub" id="post_213">
					<div class="inbox">
						<div class="box-reply2 bg-color u_cbox" id="Ej8vt"
							style="display: block;">
							<!-- 댓글 리스트  -->
							<ul class="cmlist" id="cmt_list">
								<li>
									<div class="comm_cont">
										<div class="h">
											<div class="pers_nick_area">
												<table cellspacing="0" summary="퍼스나콘/아이디 영역">
													<tbody>
														<tr>
															<td class="pc2w"><a
																href="http://item.naver.com/personacon/PersonaconShop.jsp?Redirect=PersonaconSub.jsp?type=itemdetail%26itemseq=1433715"
																target="itemshop"><img width="19" height="19" alt=""
																	src="https://itemimgs.pstatic.net/personacon/15/37/1433715.gif"></a></td>
															<td class="p-nick"><a
																class="m-tcol-c _rosRestrict _nickUI" href="#">내일은 해</a></td>
														</tr>
													</tbody>
												</table>
											</div>
											<span class="date m-tcol-c filter-50">2012.09.04.
												17:25</span> <span class="dsc_comm"><a
												class="m-tcol-c  _btnReply                    m-tcol-c _btnReply"
												href="#">답글</a></span>
											<p class="btn_edit m-tcol-c">
												<a class="filter-70 m-tcol-c _btnNoti" href="#">신고</a>
											</p>
										</div>
										<p class="comm m-tcol-c">
											<span class="comm_body">좋은 정보 감사합니다.<br>아울러...
												번역하신 분께도 감사의 마음을 전합니다....ㅎㅎ
											</span>
										</p>
										<div>
											<input name="cmtid" type="hidden" value="11688615"> <input
												name="writerid" type="hidden" value="woorimaeul"> <input
												name="refcmtid" type="hidden" value="11688615"> <input
												name="replytonick" type="hidden" value=""> <input
												name="replytomemberid" type="hidden" value=""> <input
												name="stickerId" type="hidden" value=""> <input
												name="stickerOriginUrl" type="hidden" value=""> <input
												name="imagePath" type="hidden" value=""> <input
												name="imageFileName" type="hidden" value=""> <input
												name="imageWidth" type="hidden" value=""> <input
												name="imageHeight" type="hidden" value=""> <input
												name="articleId" type="hidden" value="213">
										</div>
									</div>
								</li>
								<li class="filter-30 board-box-line-dashed"></li>
								<li>
									<div class="comm_cont">
										<div class="h">
											<div class="pers_nick_area">
												<table cellspacing="0" summary="퍼스나콘/아이디 영역">
													<tbody>
														<tr>
															<td class="pc2w"><a
																href="http://item.naver.com/personacon/PersonaconShop.jsp?Redirect=PersonaconSub.jsp?type=itemdetail%26itemseq=2703121"
																target="itemshop"><img width="19" height="19" alt=""
																	src="https://itemimgs.pstatic.net/personacon/21/31/2703121.gif"></a></td>
															<td class="p-nick"><a
																class="m-tcol-c _rosRestrict _nickUI"
																style='font-family: "2827835_9"; font-size: 9pt;'
																href="#">나른한토끼</a></td>
														</tr>
													</tbody>
												</table>
											</div>
											<span class="date m-tcol-c filter-50">2013.04.03.
												22:18</span> <span class="dsc_comm"><a
												class="m-tcol-c  _btnReply  m-tcol-c _btnReply" href="#">답글</a></span>
											<p class="btn_edit m-tcol-c">
												<a class="filter-70 m-tcol-c _btnNoti" href="#">신고</a>
											</p>
										</div>
										<p class="comm m-tcol-c"
											style='font-family: "2827835_9"; font-size: 9pt;'>
											<span class="comm_body">정말 번역하신분 감사하네요^^</span>
										</p>
										<div>
											<input name="cmtid" type="hidden" value="14387405"> <input
												name="writerid" type="hidden" value="sinili"> <input
												name="refcmtid" type="hidden" value="14387405"> <input
												name="replytonick" type="hidden" value=""> <input
												name="replytomemberid" type="hidden" value=""> <input
												name="stickerId" type="hidden" value=""> <input
												name="stickerOriginUrl" type="hidden" value=""> <input
												name="imagePath" type="hidden" value=""> <input
												name="imageFileName" type="hidden" value=""> <input
												name="imageWidth" type="hidden" value=""> <input
												name="imageHeight" type="hidden" value=""> <input
												name="articleId" type="hidden" value="213">
										</div>
									</div>
								</li>
								<li class="filter-30 board-box-line-dashed"></li>
							</ul>
							<div
								style="font: 0pt/0pt arial; height: 0pt; clear: both; font-size-adjust: none; font-stretch: normal;"></div>
							<div class="cc_paginate cmt" id="cmt_paginate"
								style="display: none;"></div>




							<table class="cminput" cellspacing="0">
								<tbody>
									<tr>
										<td class="i1">
											<div class="reply-write-ico" id="refCmt_emoticon">
												<img width="19" height="19" class="myemoticon"
													style="cursor: pointer;" alt=""
													src="https://itemimgs.pstatic.net/personacon/74/89/1098974.gif">
											</div> <span style="display: none;"></span>
										</td>
										<td class="i2">
											<div class="comm_write_wrap border-sub skin-bgcolor">
												<textarea title="댓글입력" class="textarea m-tcol-c"
													id="comment_text"
													style="height: 39px; line-height: 14px; overflow: hidden; -ms-overflow-y: hidden;"
													maxlength="6000" rows="2" cols="50"></textarea>

												<div class="u_cbox_upload_image" style="display: none;">
												</div>
											</div>
										</td>
										<td class="i3">

											<div class="u_cbox_btn_upload _submitBtn">
												<a class="u_cbox_txt_upload _submitCmt" href="#">등록</a>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="3">




											<ul class="u_cbox_addition">
												<li>
													<div class="_stickerBtn u_cbox_btn_upload_sticker">
														<span class="u_cbox_ico_upload_sticker"></span> <span
															class="m-tcol-c u_cbox_txt_upload_sticker">스티커</span> <a
															class="u_cbox_link_wrap"
															onclick="clickcr(this,'cmt.sticker', '', '', event)"
															href="#">스티커 레이어 팝업</a>
													</div>

													<div class="line_stc_sec">
														<div class="se2_line_layer">
															<div class="se2_in_layer">
																<div class="se2_line_sticker">
																	<button title="이전" disabled="" class="se2_prev"
																		type="button">
																		<span>이전</span>
																	</button>
																	<ul class="se2_line_sticker_set">
																	</ul>
																	<button title="다음" class="se2_next" type="button">
																		<span>다음</span>
																	</button>
																</div>
															</div>

														</div>

													</div>
												</li>
												<li>
													<div class="u_cbox_btn_upload_photo">
														<div class="_imageBtn u_cbox_btn_file">
															<label
																onclick="clickcr(this,'cmt.image', '', '', event);"
																for="attachImageBtn213">업로드</label><input
																id="attachImageBtn213" type="file" accept="Image/*">
														</div>
														<span class="u_cbox_ico_upload_photo"></span> <span
															class="m-tcol-c u_cbox_txt_upload_photo">사진</span>
													</div>
												</li>
											</ul> <script type="text/javascript"> 
//IE6~7????????? ?????? ?½???? (10?????? ??¸?????±?³´?¸° ??????)
//box-sizing:border-box ?????? (width/height?°? ?????? border?°???´ ?????¨????²? ????¸°) 
//????????°?ª½??´ ?¿½??¤?ª¨?????¤?³´??? ??¼??¸ ??¤??°??¤ css?°? ?¿½??¤?ª¨??? ?¸°?¤???¼?¡? ????????¨. 
//css??¼ ???????????¤??´ ????ª½ ?¸°?¤???¼?¡? ?§??¶°??¼????????° ?¿½??¤?¸°?¤???¼?¡? ?§??¶???? ?°???? ????¸° ?????¸??? 
//?¿½??¤ ?¸°?¤???¼?¡? ???????????´ ie6,7 ????²½?????? borderBoxModel() ??? ??¨?¤???¼ ????????¼?¡? ?????´.
function borderBoxModel(elements, value) { 
     var element, cs, s, width, height; 
     // cicle through all DOM elements 
     for (var i=0, max=elements.length; i < max; i++) { 
             element = elements[i]; 
             s = element.style; 
             cs = element.currentStyle; 
             // check if box-sizing is specified and is equal to border-box 
             if(s.boxSizing == value || s["box-sizing"] == value 
                     || cs.boxSizing == value || cs["box-sizing"] == value) { 
                     // change width and height 
                     try { 
                     apply(); 
                     } catch(e) {} 
             } 
     } 
     function apply() { 
             width = parseInt(cs.width, 10) || parseInt(s.width, 10); 
             height = parseInt(cs.height, 10) || parseInt(s.height, 10); 
             // if width is declared (and not 'auto','',...) 
             if(width) { 
                     var // border value could be 'medium' so parseInt returns NaN 
                     borderLeft = parseInt(cs.borderLeftWidth || s.borderLeftWidth, 10) || 0, 
                     borderRight = parseInt(cs.borderRightWidth || s.borderRightWidth, 10) || 0, 
                     paddingLeft = parseInt(cs.paddingLeft || s.paddingLeft, 10), 
                     paddingRight = parseInt(cs.paddingRight || s.paddingRight, 10), 
                     horizSum = borderLeft + paddingLeft + paddingRight + borderRight; 

                     // remove from width padding and border two times if != 0 
                     if(horizSum) { 
                     s.width = width - horizSum; //width ? width - horizSum * 2 : styleWidth - horizSum; 
                     } 
             } 
             // if height is declared (and not 'auto','',...) 
             if(height) { 
                     var // border value could be 'medium' so parseInt returns NaN 
                     borderTop = parseInt(cs.borderTopWidth || s.borderTopWidth, 10) || 0, 
                     borderBottom = parseInt(cs.borderBottomWidth || s.borderBottomWidth, 10) || 0, 
                     paddingTop = parseInt(cs.paddingTop || s.paddingTop, 10), 
                     paddingBottom = parseInt(cs.paddingBottom || s.paddingBottom, 10), 
                     vertSum = borderTop + paddingTop + paddingBottom + borderBottom; 

                     // remove from height padding and border two times if != 0 
                     if(vertSum) { 
                     s.height = height - vertSum; //height ? height - vertSum * 2 : styleHeight - vertSum; 
                     } 
             } 
     } 
}

try{
	// 6,7??¼????§? ?????? (??¸?????± ?ª¨????????? userAgent??? documentMode?°? ??¤??¼??? ?????¼????¡? documentMode?¡? ?²´?????´??¼??¨) 
	if(typeof document.documentMode !== 'undefined' && document.documentMode < 8 && document.documentMode > 5){ 
	        //??¼??¸ ??´??? ?????´??´ ?????? 
		borderBoxModel(cssquery(".line_tooltip,.se2_line_sticker_set,.se2_naver_line_link_layer,.se2_naver_line_box1,.se2_naver_line_box2 input"), 'border-box');
	} 
}catch(e){}

</script>
										</td>
									</tr>
								</tbody>
							</table>



							<div class="m-tcol-c reply_error" style="display: none;">
								<strong>죄송합니다. 댓글 시스템 오류로 댓글을 읽거나 쓸 수 없습니다.</strong> 문제가 지속될 경우
								<a class="m-tcol-c" href="http://help.naver.com/"
									target="_blank">고객센터</a>에 알려주시면 친절하게 안내해 드리겠습니다.
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
