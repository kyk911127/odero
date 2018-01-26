<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		.row {
			margin: 0 auto;
			width: 300px;
		}
	</style>
	<link rel="stylesheet" href="masterBoard/masterBoard.css" type="text/css">
</head>
<body>
	<div class="container">
		<div class="row">
			<center>
				<h3>삭제하기</h3>
			</center>
			<form method="post" action="MasterBoardDelete_ok.do">
			<table class="table table-hover aa" width="300">
				<tr>
					<td width="30%" class="text-right">비밀번호</td>
					<td width="70%" class="text-left">
						<input type="password" name="pwd" size="13" />
						<input type="hidden" name="no" value="${no}"/>
					</td>
				</tr>
				<tr>
					<td class="text-center" colspan="2">
						<input type="submit" value="삭제"/>
						<input type="button" onclick="javascript:history.back();" value="뒤로가기"/>
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</body>
</html>















