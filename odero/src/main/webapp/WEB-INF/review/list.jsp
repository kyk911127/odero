<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- gallery css -->
<link rel="stylesheet" type="text/css" href="review/css/gallery.css" />
<script type="text/javascript">
$(".hover").mouseleave(
	function () {
		$(this).removeClass("hover");
	}
);
function insert(){
	location.href="review_insert.do"
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
				<c:forEach var="vo" items="${list }">
				<figure class="snip1432 col-sm-4">
					<div>
						<a href="review_detail.do">
						<img src="review/${vo.r_imgname }" alt="${vo.r_imgname }" style=" width: 100%; height:350px;">
						</a>
					</div>
					<figcaption>
						<div>
						    <h3>${vo.r_pname }</h3>
						    <h3>${vo.m_id }</h3>
					    </div>
					    <div>
					    	<h2>${vo.r_subject }</h2>
			    		</div>
					</figcaption>
					<a href="review_detail.do?r_no=${vo.r_no }"></a>
				</figure>
				</c:forEach>
				<div class="text-center col-sm-12" style="height: 100px;">
					<a href="#">&lt;</a>&emsp;
						<c:forEach var="i" begin="1" end="${totalpage<1?1:totalpage }">&nbsp;
							<a href="review_list.do?page=${curpage }">
								<c:choose>
									<c:when test="${i==curpage }"><font size="4pt">${i }</font></c:when>
									<c:otherwise><font color="black">${i }</font></c:otherwise>
								</c:choose>
							</a>
						</c:forEach>&emsp;
					<a href="#">&gt;</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>