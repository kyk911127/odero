<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${placeCheck==true }">
		<table class="tmap_wrap">
			<tr>
				<td style="padding: 3%;">
					<h4 style="float: left;">
						<scan class="glyphicon glyphicon-home" style="margin-right:10px;">${vo.p_name }
					</h4>
				</td>
			</tr>
			<tr>
				<td><span class="tmap_detail">&nbsp;${vo.p_addr }</span></td>
			</tr>
			<tr>
				<td class="text-right"><span
					class="tmap_detail glyphicon glyphicon-eye-open">${vo.p_hit }&nbsp;&nbsp;</span>
			</tr>
		</table>
	</c:if>
	<c:if test="${placeCheck==false }">
	</c:if>
</body>
</html>