<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/masterBoard.css" type="text/css">
	<style type="text/css">
	.row {
		margin: 0 auto;
		width: 750px;
	}
	</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<center>
				<h3>������</h3>
				<table class="table table-hover" width="600">
					<tr>
						<td width="20%" class="text-center success">��ȣ</td>
						<td width="30%" class="text-center">${vo.no}</td>
						<td width="20%" class="text-center success">�ۼ���</td>
						<td width="30%" class="text-center">
							<fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/>
						</td>
					</tr>
					<tr>
						<td width="20%" class="text-center success">�̸�</td>
						<td width="30%" class="text-center">${vo.name}</td>
						<td width="20%" class="text-center success">��ȸ��</td>
						<td width="30%" class="text-center">${vo.hit}</td>
					</tr>
					<tr>
						<td width="20%" class="text-center success">����</td>
						<td colspan="3" class="text-center">${vo.subject}</td>
					</tr>
					<tr>
						<td colspan="4" height="150" class="text-left" valign="top" width="600"><pre style="width:750px;background-color:white;">${vo.content}</pre></td>
					</tr>
					<tr>
						<td colspan="4" class="text-right">
							<a href="MasterBoardUpdate.do?no=${vo.no}" class="btn btn-sm btn-success">����</a>
							<a href="MasterBoardDelete.do?no=${vo.no}" class="btn btn-sm btn-primary">����</a>
							<a href="MasterBoard.do" class="btn btn-sm btn-info">���</a>
						</td>
					</tr>
				</table>
			</center>
		</div>
	</div>
</body>
</html>

















