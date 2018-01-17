<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- gallery css -->
<link rel="stylesheet" type="text/css" href="board/css/gallery.css" />
<script type="text/javascript">
$(".hover").mouseleave(
	function () {
		$(this).removeClass("hover");
	}
);
function insert(){
	location.href="insert.jsp"
}
</script>
</head>
<body>
	<div class="container" style="margin-top: 30px">
		<div class="row">
			<center><h3><b>후기 게시판</b></h3><br></center>
			<div style="height: 50px;">
				<div class="text-left col-xs-2" style="display: inline;">
					<input type="button" value="새글" id="insert" onclick="javascript:insert()">
				</div>
				<div class="text-right col-xs-10" style="display: inline;">
					<select style="height: 25px">
						<option>전체</option>
						<option>제목</option>
						<option>내용</option>
						<option>작성자</option>
					</select>
					<input type="text" placeholder="검색어 입력" size="12" style="height: 35px">
					<input type="button" value="검색" id="search">
				</div>
			</div>
			<div class="board">
				<c:forEach var="i" begin="1" end="7">
				<figure class="snip1432 col-sm-4">
					<div>
						<img src="board/img/1.jpg" style=" width: 100%; height:350px;">
					</div>
					<figcaption>
						<div>
						    <h3>가게명</h3>
						    <h3>작성자</h3>
					    </div>
					    <div>
					    	<h2>글 제목</h2>
			    		</div>
					</figcaption>
					<a href="#"></a>
				</figure>
				</c:forEach>
				<div class="text-center col-sm-12" style="height: 100px;">
					<a href="#">&lt;</a>&emsp;
						<c:forEach var="i" begin="1" end="10">&nbsp;
							<a href="#">
								${i}
							</a>
						</c:forEach>&emsp;
					<a href="#">&gt;</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>