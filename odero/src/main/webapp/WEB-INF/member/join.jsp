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
				$('#pwdcheck').html('<span style="color:gray;font-size:12px;">��й�ȣ�� ��ġ�մϴ�.</span>');
				flag=true;
			}else{
				$('#pwdcheck').html('<span style="color:red;font-size:12px;">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</span>');
				flag=false;
			}
		}
	});
	$('#join_pwd2').keyup(function(){
		var pwd = $('#join_pwd').val().trim();
		var pwd2 = $('#join_pwd2').val().trim();
		if(pwd!=""&&pwd2!=""){
			if(pwd==pwd2){
				$('#pwdcheck').html('<span style="color:gray;font-size:12px;">��й�ȣ�� ��ġ�մϴ�.</span>');
				flag=true;
			}else{
				$('#pwdcheck').html('<span style="color:red;font-size:12px;">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</span>');
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
				<td width="30%">�̸�</td>
				<td width="70%">
					<input class="login_join" type="text" id="join_name" name="name" autocomplete="off" placeholder="�̸��� �Է��ϼ���." required>
				</td>
			</tr>
			<tr>
				<td width="30%">���̵�</td>
				<td width="65%">
					<input class="login_join" type="text" id="join_id" name="id" autocomplete="off" placeholder="'-'�� ������ �ڵ��� ��ȣ�� �Է��ϼ���." maxlength="11" required>
				</td>
				<td width="5%">
					<input type="button" class="btn btn-default btn-md" name="id" value="�ߺ�Ȯ��">
				</td>
			</tr>	
			<tr> 
				<td width="30%">��й�ȣ</td>
				<td width="70%">
					<input class="login_join" type="password" id="join_pwd" name="pwd" autocomplete="off" placeholder="��й�ȣ�� �Է��ϼ���.">
				</td>
			</tr>
			<tr>
				<td width="30%">��й�ȣ Ȯ��</td>
				<td width="65%">
					<input class="login_join" type="password" id="join_pwd2" name="pwd2" autocomplete="off" placeholder="��й�ȣ�� �ѹ� �� �Է��ϼ���.">
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