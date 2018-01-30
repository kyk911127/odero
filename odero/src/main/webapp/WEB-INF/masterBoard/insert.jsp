<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="masterBoard/masterBoard.css" type="text/css">
<script type="text/javascript" src="masterBoard/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<style>
.row{
	width:1200px
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<center>
				<h3>공사중</h3>
				<form method="post" action="MasterBoardInsert_ok.do">
				<table class="table aa">
					<tr>
						<td width=15% class="text-right">제목</td>
						<td width=85%><input type=text name=subject size=50></td>
					</tr>
					<tr>
						<td width=15% class="text-right">내용</td>
						<td width=85%>
							<textarea name=content id="ir1" rows="10" cols="100" style="width: 966px; height: 412px; display: none;">
							</textarea>
						</td>
					</tr>
					<tr>
						<td width=15% class="text-right">비밀번호</td>
						<td width=85%><input type=password name=pwd size=10>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<input type="button" onclick="submitContents(this);" value="글쓰기" class="btn btn-info" />
							<input type="button" value="취소 " class="btn btn-success" onclick="javascript:history.back()">
						</td>
					</tr>
				</table>
				</form>
			</center>
		</div>
	</div>
<script type="text/javascript" src="masterBoard/masterBoard.js" charset="utf-8"></script>


</body>
</html>