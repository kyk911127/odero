<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/p_detail.css">
<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<!-- 1. Link to jQuery (1.8 or later), -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- fotorama.css & fotorama.js. -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
<script type="text/javascript">
	var modal = document.getElementById('myMordal');
	var img = document.getElementById('myImg');
	var modalImg = document.getElementById("img01");
	var captionText = document.getElementById("caption");
	img.onclick = function() {
		modal.style.display = "block";
		modalImg.src = this.src;
		captionText.innerHTML = this.alt;
	}
	span.onclick = function() {
		modal.style.display = "none";
	}
</script>
</head>
<body>
	<div class="container-fluid top_container">
		<div class="row imagerow" style="position: relative;">
			<c:forEach var="i" begin="1" end="5">
				<div class="detail_img" data-target="#myModal" data-toggle="modal">
					<div style="border-left: 8px solid #fff;">
						<img class="place_img" id="myImg" src="p_image/top.jpg">
					</div>
				</div>
			</c:forEach>
			<div>
				<a href="#" data-target="#myModal" data-toggle="modal">
					<div class="img_more">
						<p class="i_more">���� ������ &nbsp;<img src="p_image/right-arrow.png"></p>
					</div>
				</a>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<button type="button" class="close" data-dismiss="modal"><img src="p_image/closebtn.png"></button>
				<div id="modal-body">
					<div class="fotorama" data-nav="thumbs" style="margin: 20px auto; width: 510px; height: 580px">
						<c:forEach var="i" begin="1" end="3">
							<img id="img01" src="p_image/top.jpg"> 
							<img id="img01" src="p_image/top1.jpg"> 
							<img id="img01" src="p_image/top2.jpg">
							<img id="img01" src="p_image/top3.jpg">
						</c:forEach>
					</div>
<!-- 					<div class="fotorama" data-nav="thumbs">
						<a href="p_image/top.jpg"><img src="p_image/top.jpg" width="144" height="96"></a>
						<a href="p_image/top.jpg"><img src="p_image/top.jpg" width="64" height="128"></a>
					</div> -->
				</div>
				<%-- <div id="modal-footer" style="height: 90px; margin-top: 40px;">
					<div class="fotorama_img" style="width: 1000px; padding: 10px;">
						<c:forEach var="i" begin="1" end="13">
							<div class="small_img" style="float: left; width: 70px; margin-right: 5px;">
								<img alt="" src="p_image/top2.jpg" style="width: 100%">
							</div>
						</c:forEach>
					</div>
				</div> --%>
			</div>
		</div>
	</div>
	<div class="container mid_container">
		<div class="row row_info">
			<h3>����¡âŰģ ȫ����</h3>
			<div style="padding: 15px; border-bottom: 1px solid #dbdbdb;">
				<ul>
					<li><img src="#" style="margin-right: 10px;">�̻�/ü��</li>
				</ul>
				<table>
					<tr>
						<td width="20%">�ּ�</td>
						<td>����Ư���� ������ ������ 358-113 5�� �������</td>
					</tr>
					<tr>
						<td width="20%">��ȭ��ȣ</td>
						<td>02-313-9977</td>
					</tr>
					<tr>
						<td width="20%">���ݴ�</td>
						<td>2���� ~ 5����</td>
					</tr>
					<tr>
						<td width="20%">Ű����</td>
						<td>
							<ul class="tags">
								<li class="li_1">
									<div class="tag_1">��г���</div>
									<div class="tag_1">�����ϱ�����</div>
									<div class="tag_1">�����</div>
									<div class="tag_1">����������</div>
									<div class="tag_1">��������</div> <br>
								</li>
								<li class="li_2">
									<div class="tag_2">����</div>
									<div class="tag_2">�޽��ϱ�</div> <br>
								</li>
							</ul>
						</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="row row_map">
			<h3>����</h3>
			<div>
				<img src="p_image/map.PNG" width="100%">
			</div>
		</div>
		<div class="row row_review">
			<h3>����¡âŰģ�� ����(10)</h3>
			<table class="review_list">
				<c:forEach var="i" begin="1" end="3">
					<tr style="border-bottom: 1px solid #dbdbdb;">
						<td width="13%">
							<div class="user_info">
								<div class="user_img">
									<img src="p_image/user.png" class="im">
								</div>
								<div class="user_name" style="margin-top: 10px">����</div>
							</div>
						</td>
						<td width="87%" style="padding: 20px 0">
							<div class="review_info" style="line-height: 2.2rem;">
								<p class="review_content">
									�ܱ��� �� �� ���� ������ ��� ī��. õ�嵵 ���� ����
									ũ����. ������ �׸��鵵 ŭ��ŭ��. �ÿ��ÿ��ؼ� ���ƿ�! ���̺� ���� ���ݵ� �н��ϴ�. �ڵ� �帳 Ŀ�ǵ� ���� ��
									�ְ��� ��ħ���� ��� �� ���䵵 �ؿ�! ���� ���� + 9,000��(?) ���� ���� �׳� �� ���� ���� ������,
									��, ��ũ���� ���� ��� �� �ֽ��ϴ�. ���� ���۹�Ʈ Ƽ�� Ƽ��̼��� �ֹ��߾��. ���۹�ƮƼ�� �� �� ���� ��
									���ø� �ǰ� ���ѵ�.. ����� ��� ���� �Ǹ��߾��! ����� ������ ���� �༭ ������. Ƽ��̼��� ����ī������
									���� ���� �� ��������. ���� ��Ʈ�� ���������ҿ� ����� ������ �ֽ��ϴ�. ����Ƽ�ִ� Ŀ�Ƕ� ���� ������ ���� ��
									�����ָ� �� ���� �� ���ƿ�.</p>
								<span class="review_date">2018-01-02</span>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<div class="row row_reply">
			<div class="col-md-12" style="padding: 0px 20px">
				<h4>
					<span class="com_title"><b>���侲��</b></span>
				</h4>
				<div class="reply_write">
					<form method=post action="">
						<input type="hidden" name=bno value="">
						<textarea class="reply_ta" rows="4" cols="123" name="msg"></textarea>
						<input type="button" class="btn btn-info btn-sm pull-right" value="��    ��" style="width: 75px; height: 90px">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>