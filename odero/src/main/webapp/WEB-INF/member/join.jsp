<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style>
.con font{
 font-size: 15px;
}
</style>
<script type="text/javascript">
$(function(){
 var phonetest =/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;// 핸드폰번호 정규식
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
  $('#pwdcon').html("");
 });
 var idcheck = 0; //0이면 중복버튼 클릭, 1이면 안함
 // 회원가입
 $('#joinBtn').click(function(){
  $('#namecon').html("");
  $('#idcon').html("");
  $('#pwdcon').html("");
  var join_name = $("#join_name").val();
  var join_id = $("#join_id").val();
  var join_pwd = $("#join_pwd").val();
  var join_pwd2 = $("#join_pwd2").val();
  // 이메일
  if(join_name.trim()==""){ //이름
   $('#namecon').html("<font color=red>이름을 입력해주세요</font>");
   $("#join_name").focus();
   return;
  }else if(join_id.trim()==""){
   $('#idcon').html("<font color=red>아이디를 입력해주세요</font>");
   $('#join_id').focus();
   return;
  } else if(join_pwd.trim()==""){ //비번
   $('#pwdcon').html("<font color=red>비밀번호를 입력해주세요</font>");
   $('#join_pwd').focus();
   return;
  } else if(join_pwd2.trim()==""){ //비번
   $('#pwdcon').html("<font color=red>비밀번호를 확인을 입력해주세요</font>");
   $('#join_pwd2').focus();
   return;
  } else{
   if(idcheck==0){
    $('#idcon').html("<font color=red>아이디 중복을 확인해주세요</font>"); 
    $('#join_id').focus();
   }else if(idcheck==1){
    $.ajax({
     type : "post",
     url : "idCheck.do",
     data : {"id" : join_id},
     success : function(data) {
      idcount = data;
      if (idcount == 0) {
       $("#form").submit();
      } else if(idcount==1){
       $('#idcon').html("<font color=red>아이디 중복을 확인해주세요</font>");
       $('#join_id').val("");
       $('#join_id').focus();
       idcheck=0;
      }
     }
    }); 
    
   }
  }
  
 });

 // id 중복체크
 $('#id_check').click(function(){
  $('#idcon').html("");
  var id = $("#join_id").val();
  if(id.trim()==""){
   $("#join_id").focus();
   return;
  } else if(id.trim().length < 11 || phonetest.test(id)==false){
   $('#idcon').html("<font color=red>아이디(핸드폰번호)를 정확하게 입력해주세요</font>"); 
  } else if(id.trim().length == 11 && phonetest.test(id)==true){
   $.ajax({
    type : "post",
    url : "idCheck.do",
    data : {"id" : id},
    success : function(data) {
     idcount = data;
     if (idcount == 0) {
      $('#idcon').html("<font color=blue>"+id+"은(는) 사용 가능한 아이디입니다</font>");
      idcheck=1;
     } else {
      $('#idcon').html("<font color=red>"+id+"은(는) 이미 사용중인 아이디입니다</font>");
      $('#join_id').val("");
      $('#join_id').focus();
      idcheck=0;
     }
    }
   });   
  }
  
 });
 
});
</script>
</head>
<body>
<center>
 <form method="post" action="join.do" id="form">
  <table width="400px" height="400px" style="vertical-align: middle;" align="center">
   <tr>
    <td colspan="3">
     <div id="namecon" class="con"></div>
    </td>
   </tr>
   <tr>
    <td width="30%">이름</td>
    <td width="70%">
     <input class="login_join" type="text" id="join_name" name="m_name" autocomplete="off" placeholder="이름을 입력하세요.">
    </td>
   </tr>
   <tr>
    <td colspan="3">
     <div id="idcon" class="con"></div>
    </td>
   </tr>
   <tr>
    <td width="30%">아이디(핸드폰번호)</td>
    <td width="65%">
     <input class="login_join" type="text" id="join_id" name="m_id" autocomplete="off" placeholder="'-'를 제외한 핸드폰 번호를 입력하세요." maxlength="11">
    </td>
    <td width="5%">
     <input type="button" class="btn btn-default btn-md" id="id_check" value="중복확인">
    </td>
   </tr> 
   <tr>
    <td colspan="3">
     <div id="pwdcon" class="con"></div>
    </td>
   </tr>
   <tr>
    <td width="30%">비밀번호</td>
    <td width="70%">
     <input class="login_join" type="password" id="join_pwd" name="m_pwd" autocomplete="off" placeholder="비밀번호를 입력하세요.">
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
     <input id="joinBtn" class="btn btn-lg btn-default" type="button" value="JOIN">
    </td>
   </tr>
  </table>
  </form>
 </center>
</body>
</html>