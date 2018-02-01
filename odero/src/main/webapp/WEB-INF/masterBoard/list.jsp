<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Welcome BoardMaster</title>
<link rel="stylesheet" href="masterBoard/masterBoard.css" type="text/css">
</head>
<body>
	<div class="container">
		<div class="row">
			<span class="text-center"><h3>공사중 <img alt="히릿" src="masterBoard/img/board/Settings.png"/></h3></span>
			<table class="table" width="700">
				<tr>
					<td class="text-right">
						<a href="MasterBoardInsert.do?page=${curpage}" class="btn btn-sm btn-primary">새글</a>
					</td>
				</tr>
			</table>
			<table class="table table-hover" width="700">
				<tr class="table-th">
					<th class="text-center" width="10%">번호</th>
					<th class="text-center" width="45%">제목</th>
					<th class="text-center" width="15%">이름</th>
					<th class="text-center" width="20%">작성일</th>
					<th class="text-center" width="10%">조회수</th>
				</tr>
				<c:forEach var="vo" items="${list}">
					<tr class="aa shake">
						<td class="text-center" width="10%">
							${count}
							<c:set var="count" value="${count=count-1}" />
						</td>
						<td class="text-left" width="45%">
							<c:if test="${vo.group_tab > 0}">
								<c:forEach var="i" begin="1" end="${vo.group_tab+1}">
									<span style="margin-left:${5*i}px"></span>
								</c:forEach>
							</c:if>
							<c:choose>
								<c:when test="${vo.subject} == '삭제한 게시물입니다'">
									<span style="color:gray">${vo.subject}</span>
								</c:when>
								<c:otherwise>
									<a href="MasterBoardContent.do?no=${vo.no}&page=${curpage}">${vo.subject}</a>
								</c:otherwise>
							</c:choose>
							<jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate	var="today" value="${now}" pattern="yyyy-MM-dd"/>
							<fmt:formatDate	var="yesterday" value="${vo.regdate}" pattern="yyyy-MM-dd"/>
							<c:if test="${today==yesterday}">
								<b style="color:red;background-color:black">new</b>
							</c:if>
						</td>
						<td class="text-center" width="15%">${vo.name}</td>
						<td class="text-center" width="20%">
							<fmt:formatDate	value="${vo.regdate}" pattern="yyyy-MM-dd"/>
						</td>
						<td class="text-center" width="10%">${vo.hit}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	
	<div class="container text-center">
		<ul class="pagination">
       		<li><a href="MasterBoard.do?page=${curpage<11?curpage:curpage-10}">◀◀</a></li>
       		<li><a href="MasterBoard.do?page=${curpage<2?curpage:curpage-1}">◀</a></li>
       				
       		<fmt:parseNumber var="num1" value="${curpage/10}" integerOnly="true"/>
       		<c:set var="num1" value="${num1<=0?1:num1*10}"/>  
       		<c:forEach var="i"  begin="${num1}" end="${num1==1?num1+8:num1+9}">
       			<c:choose>
       				<c:when test="${i > totalpage }"></c:when>
       				<c:when test="${i==curpage}">
	    				<li class="active">
	    					<a href="MasterBoard.do?page=${i}">	${i} </a>
	    				</li>
       				</c:when>
       				<c:when test="${i <= totalpage}">
       					<li>
       						<a href="MasterBoard.do?page=${i}"> ${i} </a>
       					</li>
       				</c:when>
       			</c:choose>
       		</c:forEach>
       		<li><a href="MasterBoard.do?page=${curpage<totalpage?curpage+1:curpage}">▶</a></li>
            <li><a href="MasterBoard.do?page=${curpage<=totalpage-10?curpage+10:curpage}">▶▶</a></li>
		</ul>
	</div>
	<div class="container" style="height:300px;"></div>




</body>
</html>