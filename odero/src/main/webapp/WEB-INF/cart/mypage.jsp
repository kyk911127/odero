<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="http://fonts.googleapis.com/earlyaccess/hanna.css">
<link rel="stylesheet"
	href="https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css">

<link href="css/mypage.css" rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
table tr td {
	font-size: 12px;
}

table tr th {
	background-color: #002060;
	color: white;
}

#info_table {
	width: 800px;
}

.curtab {
	background-color: #002060;
	color: white;
	margin-left: 70%;
	
}
.tab {
	
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


			<!-- <span class="tab">내 정보</span> -->
			<a href="mypage_list.do"><span class="tab">찜 리스트</span></a>
			<span class="tab curtab">마이 페이지</span>
		</div>


		<%-- c:forEach var="i" begin="1" end="3"> --%>
		<div class="row cart">

			<div class="table_wrap">
				<hr class="soften" />
				<h3 class="sub_text">
					내 정보 &nbsp;
					<hr class="soften" />
				</h3>
				<br> <br>
				<center>
					<table class="table table-hover" id="info_table">
						<tr>
							<td class="text-center" rowspan="5"></td>
						</tr>
						<tr>
							<th class="text-center">아이디</th>
							<td class="text-center">${mvo.m_id }</td>
						</tr>
						<tr>
							<th class="text-center">닉네임</th>
							<td class="text-center">${mvo.m_name }</td>
						</tr>

						<tr>
							<th class="text-center">비밀번호</th>
							<td class="text-center">${mvo.m_pwd }</td>
						</tr>
						<tr>
							<td colspan="4" class="text-right"><input type=button
								value="modify" class="btn btn-sm btn-danger"></td>
						</tr>
					</table>
				</center>
			</div>
			<br> <br>
			<div class="table_wrap">
				<hr class="soften" />
				<h3 class="sub_text">
					추천 가게 리스트 Best &nbsp; <a href="mypage_list.do"><button
							class="btn btn-success btn-xs">더보기</button></a>
					<hr class="soften" />
				</h3>


				<table class="table table-hover" width=600>
					<tr>
						<th>번호</th>
						<th>분류</th>
						<th>상호</th>
						<th>주소</th>
						<th>가격대</th>
						<th>전화번호</th>
						<th>영업시간</th>
						<th>조회수</th>
						<th width="5%">자세히</th>
						<th width="5%">삭제</th>
					</tr>

					<c:forEach var="vo" items="${list }">
						<tr>
							<td>${vo.p_no }</td>
							<td>${vo.p_grade }</td>
							<td>${vo.p_name }</td>
							<td>${vo.p_addr }</td>
							<td>${vo.p_price }</td>
							<td>${vo.p_tel }</td>
							<td>${vo.p_time }</td>
							<td>${vo.p_hit }</td>
							<td width="5%"><button class="btn btn-info btn-xs">보기</button></td>
							<td width="5%"><button class="btn btn-danger btn-xs">삭제</button></td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="10" class="text-right">자세한 목록은 자세히보기를 누르세요</td>
					</tr>
				</table>

				<!--   <hr class="hr" /> -->




			</div>


			<br> <br>
			<div class="table_wrap">


				<hr class="soften" />
				<h3 class="sub_text">
					추천 코스 리스트 Best &nbsp; <a href="mypage_list.do"><button
							class="btn btn-success btn-xs">더보기</button></a>
					<hr class="soften" />

				</h3>



				<table class="table table-hover" id="table_content" width=600>
					<tr>
						<th width="5%">번호</th>
						<th width="30%" class="text-center">코스이름</th>
						<th width="40%" class="text-center">코스경로</th>
						<th width="15%">추천</th>
						<th width="5%">자세히</th>
						<th width="5%">삭제</th>
					</tr>
					<c:forEach var="i" begin="1" end="5">
						<tr>
							<td width="5%">${i}</td>
							<td width="30%" class="text-center">$코스이름</td>
							<td width="40%" class="text-center">$코스경로</td>
							<td width="15%">$추천</td>
							<td width="5%"><button class="btn btn-info btn-xs">보기</button></td>
							<td width="5%"><button class="btn btn-danger btn-xs">삭제</button></td>
						</tr>
					</c:forEach>

					<tr>
						<td colspan="6" class="text-right">자세한 목록은 자세히보기를 누르세요</td>
					</tr>
				</table>




			</div>
		</div>

	</div>
	<%-- </c:forEach> --%>


</body>
</html>