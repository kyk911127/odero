<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/masterBoard.css" type="text/css">
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<center>
				<h3>������</h3>
				<form method="post" action="MasterBoardInsert_ok.do">
				<table class="table table-hover" width=600>
					<tr>
						<td width=15% class="text-right">����</td>
						<td width=85%><input type=text name=subject size=50></td>
					</tr>
					<tr>
						<td width=15% class="text-right">����</td>
						<td width=85%><textarea rows="10" cols="55" name=content></textarea>
						</td>
					</tr>
					<tr>
						<td width=15% class="text-right">��й�ȣ</td>
						<td width=85%><input type=password name=pwd size=10>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<input type="submit" value="�۾���" class="btn btn-info"> 
							<input type="button" value="��� " class="btn btn-success" onclick="javascript:history.back()">
						</td>
					</tr>
				</table>
				</form>
			</center>
		</div>
	</div>

</body>
</html>