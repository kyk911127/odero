<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style type="text/css">
.row{
	margin: 0px auto;
	width: 100%;
}
#btn,#okbtn{
	border-radius:10%;
	border:#002060;
	width:55px;
	height:35px;	
	background-color:#002060; 
	color:#DEEBF7;
}
</style>
<script type="text/javascript">
$(function(){
	$('#add').click(function(){
		alert("dd");
		$('#fileView').append(
			'<tr id="f'+(fileIndex)+'">'+
				'<td width="20%">파일'+(fileIndex+1)+'</td>'+
				'<td width="80%" align="left">'+
					'<input type="file" name="files['+fileIndex+']" size="15">'+
				'</td>'+
			'</tr>'); // 계속 추가
		fileIndex=fileIndex+1;
	});
	$('#cancel').click(function(){
		$('#f'+(fileIndex-1)).remove();	// 뒤에서부터 삭제
		fileIndex -= 1;
		if(fileIndex<0)
			fileIndex=0;
	});
});
function register(){
	var frm = document.forms[0];
	
	if(frm.title.value==''){
		alert("제목을 입력해주세요");
		frm.title.focus();
		return false;
	} 
	if(frm.store.value==''){
		alert("가게명을 입력해주세요");
		frm.store.focus();
		return false;
	}
	saveContent();

	if(check_confirm_write){
		checkUnload = false;
		frm.action='insert.do';
		frm.submit();
	} else {
		alert("사진안올라감");
		return false;
	}
}
</script>
</head>
<body>
<div class="container" style="margin-top: 50px">
	<div class="row">
		<center><h3><b>후기 작성</b></h3><br></center>
		<form method="post" name="form">
		<table class="table table-hover" style="width: 70%; margin: 0px auto;" >
			<tr>
				<td width="20%" class="text-center">제목</td>
				<td width="80%" class="text-left">
					<input type="text" name="title" size="50">
				</td>
			</tr>
			<tr>
				<td width="20%" class="text-center">가게명</td>
				<td width="80%" class="text-left">
					<input type="text" name="store" size="30">
				</td>
			</tr>
			<tr>
				<td width="20%" class="text-center">작성자</td>
				<td width="80%" class="text-left">
					<input type="text" name="name" size="15" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td width="20%" class="text-center">첨부파일</td>
				<td width="80%" class="text-left">
					<table class="table table-hover">
						<tr>
							<td class="text-right">
								<input type="button" class="btn btn-xs btn-info" id="add" value="추가">
								<input type="button" class="btn btn-xs btn-danger" id="cancel" value="취소">
							</td>
						</tr>
					</table>
					<table class="table table-hover" id="fileView">
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" id="">
					<div id="div_editor" style="height:400px; border: 1px solid black;">
						
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<input type="button" value="등록" id="okbtn" onclick="register()">&nbsp;
					<input type="button" value="취소" id="btn" onclick="javascript:history.back();">
				</td>
			</tr>
		 </table>
		 </form>
	</div>
</div>
</body>
</html>