<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	var cnt = 0;
	var keylist_p = "";
</script>
<c:forEach var="s" items="${key_list }">
	<script>
		cnt = cnt + 1;
	</script>
</c:forEach>
<script type="text/javascript">

</script>
</head>
<body>
	<table>
		<%-- <c:forEach var="i" begin="1" end="2">
			<tr>
				<c:forEach var="j" begin="1" end="4">
					<td><input type="submit" value="친절한" class="key_btn sel_btn"
						name="k1_${i }_${j }"></td>
				</c:forEach>
			</tr>
		</c:forEach> --%>
		<tr>
			<td><c:forEach var="s" items="${key_list }" varStatus="i">
					<input type="submit" value="${s }" class="key_btn sel_btn ${key }_btn" id="${key }_${i.index }"
						name="k_${i.index }">
					<%-- <c:if test="${(i.index+1)%4==0 }">
						<br>
					</c:if> --%>
				</c:forEach>
			<td>
		</tr>
	</table>
</body>
</html>