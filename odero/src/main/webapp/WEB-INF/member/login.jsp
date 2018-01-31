<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LOGIN</title>

<script type="text/javascript">
$(function(){
 $(".close").click(function(){
  $('#joinModal').modal('hide');
  $('#log_id').val('');
  $('#log_pwd').val('');
  $('#join_name').val('');
  $('#join_id').val('');
  $('#join_pwd').val('');
  $('#join_pwd2').val('');
 });
 $('#modal_loginBtn').click(function(){
  var log_id = $('#log_id').val();
  var log_pwd = $('#log_pwd').val();
  if (log_id.trim()=="") {
   $('#logincon').html("<font color=red>아이디를 입력해주세요</font>");
   $('#log_id').focus();
   return;
  } else if(log_pwd.trim()==""){
   $('#logincon').html("<font color=red>비밀번호를 입력해주세요</font>");
   $('#log_pwd').focus();
   return;
  }
  
  $.ajax({
   type:"post",
   url:"login_ok.do",
   data:{"m_id":log_id,"m_pwd":log_pwd},
   success:function(data){
    var count = data.trim();
    if(count==0){
     $('#logincon').html("<font color=red>아이디기 존재하지 않습니다</font>");
     $('#log_id').val("");
     $('#log_pwd').val("");
     $('#log_id').focus();
    } else if(count==2){
     $('#logincon').html("<font color=red>비밀번호가 일치하지 않습니다</font>");
     $('#log_pwd').val("");
     $('#log_pwd').focus();
    } else {
     location.href="main.do";
    }
   }
  });
 });
});
</script>
</head>
<body>
 <center>
  <table height="200px" style="vertical-align: middle;">
   <tr>
    <td colspan="2"><div id="logincon"></div></td>
   </tr>
   <tr>
    <td width="30%">ID</td>
    <td width="70%"><input class="login_join" id="log_id"
     type="text" name="m_id" autocomplete="off"></td>
   </tr>
   <tr>
    <td width="30%">PWD</td>
    <td width="70%"><input class="login_join" id="log_pwd"
     type="password" name="m_pwd" autocomplete="off"></td>
   </tr>
   <tr>
    <td colspan="2" class="text-center"><a
     class="btn btn-md btn-default" type="button" id="join"
     href="#joinModal" data-toggle="modal">JOIN</a> <input
     class="btn btn-md btn-default" type="submit" value="LOGIN" id="modal_loginBtn">
    </td>

   </tr>
  </table>
 </center>
 <div class="modal fade" id="joinModal" tabindex="-1" role="dialog"
  aria-labelledby="myModalLabel" aria-hidden="true"
  data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog" id="join-modal">
   <div class="modal-content" id="join-content">
    <div class="modal-header">
     <button type="button" class="close">
      <span aria-hidden="true" style="color: black;">X</span><span
       class="sr-only">Close</span>
     </button>

     <h3 class="modal-title" id="myModalLabel">회원가입</h3>
    </div>
    <div class="modal-body">
     <jsp:include page="join.jsp" />
    </div>
   </div>
  </div>
 </div>
</body>
</html> 