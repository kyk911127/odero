<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/cart_main.css" type="text/css">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/earlyaccess/hanna.css">
<link href="css/mypage.css" rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
<script type="text/javascript">
	_headerRef = 'www.google.co.kr';
</script> 
</head>
<style>

</style>
<body>
<body class="pc">

	<script
		src="https://ssl.pstatic.net/spacecloud/static/web/js/deploy/20180112051220/min/jquery.min.js"
		type="text/javascript"></script>
	
	
	<div class="container">
		<div class="wrap main">

			<!-- //gnb -->
			<div id="_root" style="overflow: hidden; width: 100%; height: 100%;">
				<div id="_container" style="position: relative;">
					<div id="home" class="_page">

						<div id="content_wraper">
							<section class="section_search">
								<!-- <div class="head_wrap">
			<h2><strong>��� ����</strong>���ºκ�</h2>
		</div>  -->
		
		
	<div class="tab_wrap">
	<a href="mypage.do"><span class="tab">����������</span></a>
	<!-- <a href="javascript:history.back()"><span class="tab">�ڷ�</span> -->
	&nbsp;
	|
	&nbsp;
	<a href="mypage.do"><span class="tab">�ڽ� ��</span></a>
	<a href="mypage.do"><span class="tab">���� ��</span></a>
	</div>
							<!-- 	<div class="recomm_wrap">
									<h2>��õ Ű����</h2>
									<ul class="recomm_list">
										<li class="recomm_item"><a href="javascript:void(0);">�±�1</a></li>
										<li class="recomm_item"><a href="javascript:void(0);">�±�2</a></li>
										<li class="recomm_item"><a href="javascript:void(0);">�±�3</a></li>
										<li class="recomm_item"><a href="javascript:void(0);">�±�4</a></li>
										<li class="recomm_item"><a href="javascript:void(0);">�±�5</a></li>

									</ul>
								</div> -->
							</section>
							<section class="section_cont">
								<div class="space_list_wrap">
									<div id="_spaceListScrollWrap" class="space_list swiper_list"
										data-sly-wrap-mobile>
										<div class="flex_wrap column3 fluid" id="_spaceScroller">

											<c:forEach var="i" begin="1" end="3">
										 <!-- �ڽ���  -->
												<article class="box box_space _space" data-sly-item>
													<div class="inner">
														<a href="mypage_cos.do" class="_innerLink nclk">
															<div class="img_box">
																<span style="background-image: url(c_image/date1.jpg);"
																	class="img lazy"></span>

															</div> <span class="btns_reserv"><span
																class="btn_reserv_confirm">��õ<br>�ڽ�</span>
														</span>



															<div class="info_area">
																<h3 class="tit_space">${i }.��õ ����Ʈ �ڽ� : ����</h3>
																<div class="tags">
																	<span class='tag_area_name'>������ ������</span>
																	<c:forEach var="i" begin="1" end="5">
																		<span>#�±�${i }</span>
																	</c:forEach>
																</div>
																<div class="info_price_hour">
																	<strong class='price'>���ݴ�~���ݴ�</strong><span
																		class='txt_unit'>&nbsp;1�ϱ���</span>
																	<!-- 	<i class="sp_icon ico_npay">���̹����� ��밡��</i> -->
																</div>
																<div class="info_number_love">
																	<span class="txt_number_review"> <i
																		class="sp_icon ico_review">�����</i><em>3</em>
																	</span> <span class="txt_number_love"> <i
																		class="sp_icon ico_love">���ƿ�</i> <em>88</em>
																	</span>
																</div>
															</div>
														</a>
													</div>
												</article>
											<!-- ���� ��  -->
												<article class="box box_space _space" data-sly-item>
													<div class="inner">
														<a href="mypage_place.do" class="_innerLink nclk">
															<div class="img_box">
																<span style="background-image: url(c_image/date1.jpg);"
																	class="img lazy"></span>

															</div> <span class="btns_reserv"><span
																class="btn_reserv_confirm btn_store">��õ<br>����</span>
														</span>



															<div class="info_area">
																<h3 class="tit_space">${i }.��õ ����Ʈ �ڽ� : ����</h3>
																<div class="tags">
																	<span class='tag_area_name'>������ ������</span>
																	<c:forEach var="i" begin="1" end="5">
																		<span>#�±�${i }</span>
																	</c:forEach>
																</div>
																<div class="info_price_hour">
																	<strong class='price'>���ݴ�~���ݴ�</strong><span
																		class='txt_unit'>&nbsp;1�ϱ���</span>
																	<!-- 	<i class="sp_icon ico_npay">���̹����� ��밡��</i> -->
																</div>
																<div class="info_number_love">
																	<span class="txt_number_review"> <i
																		class="sp_icon ico_review">�����</i><em>3</em>
																	</span> <span class="txt_number_love"> <i
																		class="sp_icon ico_love">���ƿ�</i> <em>88</em>
																	</span>
																</div>
															</div>
														</a>
													</div>
												</article>
											</c:forEach>

										</div>
										<div class="pagination_div text-center">
											<ul class="pagination">
												<li><a href="#">����</a></li>
												<c:forEach var="i" begin="1" end="10">
													<li><a href="#">${i }</a></li>

												</c:forEach>
												<li><a href="#">����</a></li>
											</ul>
										</div>
									</div>
								</div>
							</section>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>