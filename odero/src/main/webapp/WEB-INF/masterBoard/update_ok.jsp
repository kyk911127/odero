<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${bCheck==true}">
	<c:redirect url="MasterBoardUpdate.do?no=${no}" />
</c:if>
<c:if test="${bCheck==false}">
	<script>
		alert("��й�ȣ�� Ʋ���ϴ�");
  		history.back();
  	</script>
</c:if>