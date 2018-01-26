<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
	.row {
		margin: 0px auto;
		width: 700px;
	}
	</style>
	<link rel="stylesheet" href="masterBoard/masterBoard.css" type="text/css">
</head>
<body>
	<div class="container">
		<div class="row">
			<center>
				<h3>수정하기</h3>
			</center>
			<form method="post" action="MasterBoardUpdate_ok.do">
				<table class="table table-hover aa" width=600>
					<tr >
						<td width=15% class="text-right">이름</td>
						<td width=85%><input type=text name=name size=15
							value="${vo.name }"> <input type=hidden name=no
							value="${vo.no }"></td>
					</tr>
					<tr>
						<td width=15% class="text-right">제목</td>
						<td width=85%><input type=text name=subject size=50
							value="${vo.subject }"></td>
					</tr>
					<tr>
						<td width=15% class="text-right">내용</td>
						<td width=85%><textarea rows="10" cols="55" name=content>${vo.content }</textarea>
						</td>
					</tr>
					<tr>
						<td width=15% class="text-right">비밀번호</td>
						<td width=85%><input type=password name=pwd size=10>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
						<input type=submit	value=수정 class="btn btn-info"> 
						<input type=button	value=취소 class="btn btn-success" onclick="javascript:history.back()">
					</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
