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
//선택할 때 선택해제할 때 모양 바꾸기 => 동적으로 추가된 태그에는 일반적인 이벤트는 동작하지 않음
$(document).on("click", ".p_btn", function() {
	
	var btn_bc = $(this).css("background-color");
	if (btn_bc == "rgb(0, 0, 0)") { // 선택 해제 => 선택
		alert("$(this).attr('value') : " + $(this).attr("value"));
		
		keylist_p = $(this).attr("value");
		$(this).css("background", "rgb(243, 171, 186)");
		$(this).css("opacity", "1");
		for (var i = 0; i < cnt; i++) {
			var key_id = $("#p_" + i);
			   if($(this).attr("id") != key_id.attr("id")){
				   if(key_id.css("background-color") == "rgb(243, 171, 186)") {   // 선택 해제 => 선택
					   keylist_p = keylist_p + "|" + key_id.attr("value");
				   	   alert("keylist_p : " + keylist_p);
				   }
			   }
		}
	} else { // 선택 => 선택 해제
		keylist = "";
		$(this).css("background", "rgb(0, 0, 0)");
		$(this).css("opacity", "0.3");
		for (var i = 0; i < cnt; i++) {
			var key_id = $("#p_" + i);
			 if($(this).attr("id") != key_id.attr("id")){
				   if(key_id.css("background-color") == "rgb(243, 171, 186)") {   // 선택 해제 => 선택
					   keylist_p = keylist_p + key_id.attr("value") + "|";
				   }
			   }
		}
	}
	$("#key_hidden").append("<input type='hidden' name='keylist_p' value='"+ keylist_p +"'>");
});
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