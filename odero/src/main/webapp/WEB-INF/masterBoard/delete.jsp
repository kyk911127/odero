<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<style type="text/css">
		.row {
			margin: 0 auto;
			width: 300px;
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<center>
				<h3>�����ϱ�</h3>
			</center>
			<form method="post" action="MasterBoardDelete_ok.do">
			<table class="table table-hover" width="300">
				<tr>
					<td width="30%" class="text-right">��й�ȣ</td>
					<td width="70%" class="text-left">
						<input type="password" name="pwd" size="13" />
						<input type="hidden" name="no" value="${no}"/>
					</td>
				</tr>
				<tr>
					<td class="text-center" colspan="2">
						<input type="submit" value="����"/>
						<input type="button" onclick="javascript:history.back();" value="�ڷΰ���"/>
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</body>
</html>















