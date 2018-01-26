<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- css, js 연결하기 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="review/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="review/js/bootstrap.min.js"></script>
<script src="/js/jquery.bxslider.min.js"></script>
<style type="text/css">
.carousel-inner{
	height: 450px;
}
</style>
</head>
<body>
	<div class="container" style="margin-top: 50px">
		<div class="row">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<c:forEach var="i" items="${images }" >
					<li data-target="#myCarousel" data-slide-to="0"></li>
					</c:forEach>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner">
					<c:forEach var="img" items="${images }">
					<div class="item">
						<img src="/review/review_img/${img }" alt="${img }" style="width: 100%;">
					</div>
					</c:forEach>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
			<table class="table table-hover">
				<tr>
					<td class="text-center info" width="20%">번호</td>
					<td class="text-center" width="30%">${vo.r_no }</td>
					<td class="text-center info" width="20%">작성일</td>
					<td class="text-center" width="30%"><fmt:formatDate value="${vo.r_regdate }" pattern="yyyy.MM.dd" ></fmt:formatDate></td>
				</tr>
				<tr>
					<td class="text-center info" width="20%">작성자</td>
					<td class="text-center" width="30%">${vo.m_id }</td>
					<td class="text-center info" width="20%">조회수</td>
					<td class="text-center" width="30%">${vo.r_hit }</td>
				</tr>
				<tr>
					<td class="text-center info" width="20%">제목</td>
					<td class="text-center" colspan="3">${vo.r_subject }</td>
				</tr>
				<tr>
					<td class="text-left" colspan="4" valign="top" height="150px">
						${vo.r_content }
					</td>
				</tr>
				<tr>
					<td class="text-right" colspan="4">
						<a href="review_update.do?no=${vo.r_no }" class="btn btn-sm btn-primary">수정</a>
						<a href="review_delete.do?no=${vo.r_no }" class="btn btn-sm btn-success">삭제</a>
						<a href="review_list.do" class="btn btn-sm btn-info">목록</a>
					</td>
				</tr>
			</table>
			
			
			
		</div>
	</div>

</body>
</html>