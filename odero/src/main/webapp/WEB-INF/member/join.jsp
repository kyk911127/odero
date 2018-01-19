<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>

<script type="text/javascript">
$(function(){
	var flag=false;
	$('#join_pwd').keyup(function(){
		var pwd = $('#join_pwd').val().trim();
		var pwd2 = $('#join_pwd2').val().trim();
		if(pwd==""){
			$('#pwdcheck').html('');
		}
		if(pwd!=""&&pwd2!=""){
			if(pwd==pwd2){
				$('#pwdcheck').html('<span style="color:gray;font-size:12px;">비밀번호가 일치합니다.</span>');
				flag=true;
			}else{
				$('#pwdcheck').html('<span style="color:red;font-size:12px;">비밀번호가 일치하지 않습니다.</span>');
				flag=false;
			}
		}
	});
	$('#join_pwd2').keyup(function(){
		var pwd = $('#join_pwd').val().trim();
		var pwd2 = $('#join_pwd2').val().trim();
		if(pwd!=""&&pwd2!=""){
			if(pwd==pwd2){
				$('#pwdcheck').html('<span style="color:gray;font-size:12px;">비밀번호가 일치합니다.</span>');
				flag=true;
			}else{
				$('#pwdcheck').html('<span style="color:red;font-size:12px;">비밀번호가 일치하지 않습니다.</span>');
				flag=false;
			}
		}
	});
	$('#join_pwd').blur(function(){
		if(flag==false){
			$('#join_pwd2').val('');
			$('#join_pwd2').focus();
			flag=true;
			$('#pwdcheck').html('');
		}
	});
	$('#join_pwd2').blur(function(){
		if(flag==false){
			$('#join_pwd2').val('');
			$('#join_pwd2').focus();
			flag=true;
			$('#pwdcheck').html('');
		}
	});
	
});
</script>
</head>
<body>
<center>
		<table width="400px" height="400px" style="vertical-align: middle;" align="center">
			<tr>
				<td width="30%">이름</td>
				<td width="70%">
					<input class="login_join" type="text" id="join_name" name="name" autocomplete="off" placeholder="이름을 입력하세요." required>
				</td>
			</tr>
			<tr>
				<td width="30%">아이디</td>
				<td width="65%">
					<input class="login_join" type="text" id="join_id" name="id" autocomplete="off" placeholder="'-'를 제외한 핸드폰 번호를 입력하세요." maxlength="11" required>
				</td>
				<td width="5%">
					<input type="button" class="btn btn-default btn-md" name="id" value="중복확인">
				</td>
			</tr>	
			<tr> 
				<td width="30%">비밀번호</td>
				<td width="70%">
					<input class="login_join" type="password" id="join_pwd" name="pwd" autocomplete="off" placeholder="비밀번호를 입력하세요.">
				</td>
			</tr>
			<tr>
				<td width="30%">비밀번호 확인</td>
				<td width="65%">
					<input class="login_join" type="password" id="join_pwd2" name="pwd2" autocomplete="off" placeholder="비밀번호를 한번 더 입력하세요.">
				</td>
				<td width="5%"class="text-center"><span id="pwdcheck"></span></td>
			</tr>	
			<tr>
				<td colspan="3" class="text-center">
					<input id="joinBtn" class="btn btn-lg btn-default" type="submit" value="JOIN">
				</td> 
			</tr>
		</table>
	</center>
</body>
</html>