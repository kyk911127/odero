<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<title>Welcome BoardMaster</title>
<link rel="stylesheet" href="css/masterBoard.css" type="text/css">
</head>
<body>
	<div class="container">
		<div class="row">
			<h3>������ <img alt="����" src="masterBoard_img/Settings.png"/></h3>
			<table class="table table-hover" width="700">
				<tr>
					<td class="text-left">
						<a href="MasterBoardInsert.do" class="btn btn-sm btn-primary">����</a>
					</td>
				</tr>
			</table>
			<table class="table table-hover" width="700">
				<tr class="table-th">
					<th class="text-center" width="10%">��ȣ</th>
					<th class="text-center" width="45%">����</th>
					<th class="text-center" width="15%">�̸�</th>
					<th class="text-center" width="20%">�ۼ���</th>
					<th class="text-center" width="10%">��ȸ��</th>
				</tr>
				<c:forEach var="vo" items="${list}">
					<tr class="aa">
						<td class="text-center" width="10%">${vo.no}</td>
						<td class="text-center" width="45%">
							<a href="MasterBoardContent.do?no=${vo.no}">${vo.subject}</a>
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
       		<li><a href="selectsave.do?page=${curpage<11?curpage:curpage-10}&saveNum=${num}">����</a></li>
       		<li><a href="selectsave.do?page=${curpage<2?curpage:curpage-1}&saveNum=${num}">��</a></li>
       				
       		<fmt:parseNumber var="num1" value="${curpage/10}" integerOnly="true"/>
       		<c:set var="num1" value="${num1<=0?1:num1*10}"/>  
       		<c:forEach var="i"  begin="${num1}" end="${num1==1?num1+8:num1+9}">
       			<c:choose>
       				<c:when test="${i > totalpage }"></c:when>
       				<c:when test="${i==curpage}">
	    				<li class="active">
	    					<a href="selectsave.do?page=${i}&saveNum=${num}">	${i} </a>
	    				</li>
       				</c:when>
       				<c:when test="${i <= totalpage}">
       					<li>
       						<a href="selectsave.do?page=${i}&saveNum=${num}"> ${i} </a>
       					</li>
       				</c:when>
       			</c:choose>
       		</c:forEach>
       		<li><a href="selectsave.do?page=${curpage<totalpage?curpage+1:curpage}&saveNum=${num}">��</a></li>
            <li><a href="selectsave.do?page=${curpage<=totalpage-10?curpage+10:curpage}&saveNum=${num}">����</a></li>
		</ul>
	</div>
	<div class="container" style="height:300px;"></div>




</body>
</html>