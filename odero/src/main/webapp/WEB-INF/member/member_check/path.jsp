<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

.pathmarker{
	width: 100px;
	height: 100px;
	border-radius : 50%;
	background-color: black;
	margin-right: 0px;
	float: left;
}
.linebox{
 	width:100%;
 	height: 100px;
 	line-height: 100px;
	float: left;
}
.line{
 	width:100%;
	border-bottom: 3px solid black;
	line-height: 100px;
}
</style>
</head>
<body>
<div>
	<table width="100%">
		<tr>
			<td width="20%" class="text-center">
				<div class="pathmarker"></div></td>
			<td width="20%" class="text-center">
				<div class="linebox"><p class="line"></p></div></td>
			<td width="20%" class="text-center">
				<div class="pathmarker"></div>
			</td>
			<td width="20%" class="text-center">
				<div class="linebox"><p class="line"></p></div>
			</td>
			<td width="20%" class="text-center">
				<div class="pathmarker"></div>
			</td>
		</tr>
		<tr>
			<td width="20%" class="text-center">
				${vo.firstStartStation }<br>
				<c:if test="${vo.pathtype=='버스' }">
					정류장번호: ${vo.startID }
				</c:if>
				<c:if test="${vo.pathtype=='지하철' }">
					${vo.subname }
				</c:if>
			<td width="20%" class="text-center">
				이동수단: ${vo.pathtype }<br>
				이동시간: ${vo.min }분<br>
				이동거리: ${vo.distance }<br>
				교통비: ${vo.payment }
			</td>
			<td width="20%" class="text-center">
				${vo.lastEndStation }<br>
				<c:if test="${vo.pathtype=='버스' }">
					정류장번호: ${vo.endID }
				</c:if>
			</td>
			<td width="20%" class="text-center">
				
			</td>
			<td width="20%" class="text-center">
				
			</td>
		</tr>
	</table>
</div>
</body>
</html>