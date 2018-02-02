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
	margin-left: 25%;
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
 	margin-top:20%;
	border-bottom: 5px solid #002060;
	line-height: 100px;
}
</style>
</head>
<body>
<div>
	<table width="100%">
		<tr>
			<td class="text-center" colspan="5">
            	<span style="color:black; font-size:28px; border: none;">대중교통 이용</span><br><br><br>
           </td>
		</tr>
		<tr>
			<td width="20%" class="text-center">
				<div class="pathmarker"><img alt="" src="img_1/m_1.png"height="100px"></div></td>
			<td width="20%" class="text-center">
				<div class="linebox"><p class="line"></p></div></td>
			<td width="20%" class="text-center">
				<div class="pathmarker"><img alt="" src="img_1/m_2.png"height="100px"></div>
			</td>
			<td width="20%" class="text-center">
				<div class="linebox"><p class="line"></p></div>
			</td>
			<td width="20%" class="text-center">
				<div class="pathmarker"><img alt="" src="img_1/m_3.png"height="100px"></div>
			</td>
		</tr>
		<tr>
			<td width="20%" class="text-center">
				출발: ${vo.firstStartStation }<br>
				<%-- <c:if test="${vo.pathtype=='버스' }">
					정류장번호: ${vo.startID }
				</c:if> --%>
				<c:if test="${vo.pathtype=='지하철' }">
					${vo.subname }
				</c:if>
			<td width="20%" class="text-center">
				총 이동수단: ${vo.pathtype }<br>
				이동시간: ${vo.min }분<br>
				이동거리: ${vo.distance }m<br>
				교통비: ${vo.payment }원
			</td>
			<td width="20%" class="text-center">
				도착: ${vo.lastEndStation }<br>
				<%-- <c:if test="${vo.pathtype=='버스' }">
					정류장번호: ${vo.endID }
				</c:if> --%>
				<br>
				출발: ${vo2.firstStartStation }
			</td>
			<td width="20%" class="text-center">
				총 이동수단: ${vo2.pathtype }<br>
				이동시간: ${vo2.min }분<br>
				이동거리: ${vo2.distance }m<br>
				교통비: ${vo2.payment }원
			</td>
			<td width="20%" class="text-center">
				도착: ${vo2.lastEndStation }<br>
				<%-- <c:if test="${vo2.pathtype=='버스' }">
					정류장번호: ${vo2.endID }
				</c:if> --%>
				<c:if test="${vo.pathtype=='지하철' }">
					${vo.subname }
				</c:if>
			</td>
		</tr>
	</table>
</div>
</body>
</html>