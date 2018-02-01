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
.pwd {
	font-family : sans-serif;
}

</style>
<link href="css/mypage.css" rel="stylesheet" type="text/css">
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
<script>
$(document).ready(function(){
	$("#jBtn").click(function(){
    	alert("찜 내역이 없습니다!!!");
    	return;
	});
}); 
$(document).ready(function(){
	$("#mBtn").click(function(){
		var old_pwd = $("#old_pwd").val();
		var pwd = $("#pwd").val();
		var pwd_check = $("#pwd_check").val();
		var session_pwd = <%=session.getAttribute("m_pwd")%>;
    	if( old_pwd == session_pwd ) {
    		if ( pwd == pwd_check ) {
    			alert("변경이 완료되었습니다. 다시 로그인 해주세요.");
    			$('#infomd').submit();
    		}
    		else {
    			alert("새로 입력한 비밀번호가 일치하지 않습니다.");
    		}
 
    	}else {
    		alert("기존 비밀번호가 일치하지 않습니다.");
    	}
	});
}); 

</script>
</head>
<body class="body">
	<div class="container">
		<div class="title_wrap">마이 페이지</div>
		<div class="tab_wrap">
			<!-- <span class="tab">내 정보</span> -->
			<br> |
			<c:if test="${size!=0 && psize!=0 }">
			<a href="mypage_list.do"><span class="tab">찜 리스트</span></a>
			</c:if>
			<c:if test="${size==0 || psize==0 }">
			<span class="tab" id="jBtn" style="cursor: pointer;">찜 리스트</span>
			</c:if>
			|
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
					<form method="POST" action="info_modify.do" id="infomd">
					<table class="table table-hover" id="info_table">
						<tr>
							<td class="text-center" rowspan="6"></td>
						</tr>
						<tr>
							<th class="text-center">아이디</th>
							<td class="text-center">${mvo.m_id }</td>
						</tr>
						<tr>
							<th class="text-center">닉네임</th>
							<td class="text-center"><input type="text" class="text-center" value="${mvo.m_name }" name=m_name id="nick"></td>
						</tr>

						<tr>
							<th class="text-center">기존 비밀번호</th>
							<td class="text-center"><input type="password" name="old_pwd" class="text-center pwd" id="old_pwd"></td>
						</tr>
						<tr>
							<th class="text-center">새 비밀번호</th>
							<td class="text-center"><input type="password" name="m_pwd" class="text-center pwd" id="pwd"></td>
						</tr>
						<tr>
							<th class="text-center">새 비밀번호 확인</th>
							<td class="text-center"><input type="password" name="pwd_check" class="text-center pwd" id="pwd_check" style="color:black;"></td>
						</tr>
						<tr>
							<td colspan="4" class="text-right"><input type=button
								value="modify" class="btn btn-sm btn-danger" id="mBtn"></td>
						</tr>
					</table>
					</form>
					</center>

			</div>
			<br> <br>
			<div class="table_wrap">
				<hr class="soften" />
				<h3 class="sub_text">
					추천 가게 리스트 Best &nbsp;
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
					<c:if test="${size!=0 }">
					<c:forEach var="je" begin="0" end="${size>6?6:size-1 }">
						<c:if test="${list[je].p_grade=='c'}">
							<c:set var="grade" value="카페" />
						</c:if>
						<c:if test="${list[je].p_grade=='f'}">
							<c:set var="grade" value="맛집" />
						</c:if>
						<c:if test="${list[je].p_grade=='p'}">
							<c:set var="grade" value="놀거리" />
						</c:if>
						<tr>
							<td>${list[je].jvo.j_no }</td>
							<td>${grade }</td>
							<td>${list[je].p_name }</td>
							<td>${list[je].p_addr }</td>
							<td>${list[je].p_price }</td>
							<td>${list[je].p_tel }</td>
							<td>${list[je].p_time }</td>
							<td>${list[je].p_hit }</td>
							
							<td width="5%"><a href="p_detail.do?p_no=${list[je].p_no }"><button class="btn btn-info btn-xs">보기</button></a></td>
							<td width="5%"><a href="place_delete.do?no=${list[je].jvo.j_no }"><button class="btn btn-danger btn-xs">삭제</button></a></td>
							
						</tr>
					</c:forEach>
					<tr>
						<td colspan="10" class="text-right">자세한 목록은 <a href="mypage_list.do?sort=place"><button
							class="btn btn-success btn-xs">더보기</button></a>를 누르세요</td>
					</tr>
					</c:if>
					<c:if test="${size==0 }">
					<tr>
						<td class="text-center" colspan=10><strong>찜 내역이 없습니다.</strong>  </td>
					</tr>
					</c:if>
				</table>
				<!--   <hr class="hr" /> -->
			</div>

			<br> <br>
			<div class="table_wrap">


				<hr class="soften" />
				<h3 class="sub_text">
					추천 코스 리스트 Best &nbsp; 
					<hr class="soften" />

				</h3>
				<table class="table table-hover" id="table_content" width=600>
					<tr>
						<th>번호</th>
						<th>맛집</th>
						<th>놀거리</th>
						<th>카페</th>
						<th>자세히</th>
						<th>삭제</th>
					</tr>
					<c:if test="${psize!=0 }">
					<c:forEach var="kk" begin="0" end="${psize>6?6:psize-1 }">
						<tr>
							<td>${flist[kk].c_no }</td>
							<td>${flist[kk].pvo.p_name }</td>
							<td>${plist[kk].pvo.p_name}</td>
							<td>${clist[kk].pvo.p_name}</td>
							<td><a href="mypage_cos.do?no=${flist[kk].c_no }"><button class="btn btn-info btn-xs">보기</button></a></td>
							<td><a href="cos_delete.do?no=${flist[kk].c_no }"><button class="btn btn-danger btn-xs">삭제</button></a></td>
						</tr>
					</c:forEach>
				
					<tr>
						<td colspan="6" class="text-right">자세한 목록은 <a href="mypage_list.do?sort=cos"><button
							class="btn btn-success btn-xs">더보기</button></a>를 누르세요</td>
					</tr>
					</c:if>
					<c:if test="${psize==0 }">
					<tr>
						<td class="text-center" colspan=6> <strong>코스 찜 내역이 없습니다.</strong> </td>
					</tr>
					</c:if>
				</table>

			</div>
		</div>

	</div>
	<%-- </c:forEach> --%>


</body>
</html>