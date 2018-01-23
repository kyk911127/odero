<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" href="http://fonts.googleapis.com/earlyaccess/hanna.css">
<link rel="stylesheet" href="https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css">

<link href="css/mypage.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">

</style>

<!-- <script>
$(document).ready(function(){
	$(".cart_div").click(function(){
    	/* $(".map_div").show(200,'swing'); */
		$(".map_div").slideDown(200);
	});
	$(".map_div").click(function(){
    	/* $(".map_div").hide(200); */
		$(".map_div").slideUp(200);
	});
}); 


</script> -->


</head>
<body class="body">
<div class="container">
	<div class="tab_wrap">
	

	<!-- <span class="tab">�� ����</span> -->
	<a href="mypage_list.do"><span class="tab">�� ����Ʈ</span></a>
	</div>
		
	
	<%-- c:forEach var="i" begin="1" end="3"> --%>
	<div class="row cart">
<div class="table_wrap">
	<hr class="soften" /><h3 class="sub_text">��õ ���� ����Ʈ  Best5 &nbsp;
	<a href="mypage_list.do"><button class="btn btn-success btn-xs">������ </button></a> <hr class="soften" /> 
		</h3> 

           
          <table class="table table-hover" id="table_content" width=600>
 			<tr>
 				<th width="5%">��ȣ</th>
 				<th width="30%" class="text-center">�����̸�</th>
 				<th width="40%" class="text-center">���԰��</th>
 				<th width="15%">��õ</th>
 				<th width="5%">�ڼ���</th>
 				<th width="5%">����</th>
 			</tr>
 			
 			<c:forEach var="i" begin="1" end="5">
 			<tr>
 				<td width="5%">${i}</td>
 				<td width="30%" class="text-center">$�ڽ��̸�</td>
 				<td width="40%" class="text-center">$�ڽ����</td>
 				<td width="15%">$��õ</td>
 				<td width="5%"><button class="btn btn-info btn-xs">����</button></td>
 				<td width="5%"><button class="btn btn-danger btn-xs">����</button></td>
 			</tr>
 			  </c:forEach>
 			<tr>
 				<td colspan="6" class="text-right"> �ڼ��� ����� �ڼ������⸦ ��������</td>
 			</tr> 			
          </table>

        <!--   <hr class="hr" /> -->
       


	
	</div>
	</div>
	
	<br><br>
<div class="table_wrap">


	<hr class="soften" /><h3 class="sub_text">��õ �ڽ� ����Ʈ Best5 &nbsp;
	<a href="mypage_list.do"><button class="btn btn-success btn-xs">������ </button></a> <hr class="soften" /> 
	
	</h3> 
	

         
          <table class="table table-hover" id="table_content" width=600>
 			<tr>
 				<th width="5%">��ȣ</th>
 				<th width="30%" class="text-center">�ڽ��̸�</th>
 				<th width="40%" class="text-center">�ڽ����</th>
 				<th width="15%">��õ</th>
 				<th width="5%">�ڼ���</th>
 				<th width="5%">����</th>
 			</tr>
 			  <c:forEach var="i" begin="1" end="5">
 			<tr>
 				<td width="5%">${i}</td>
 				<td width="30%" class="text-center">$�ڽ��̸�</td>
 				<td width="40%" class="text-center">$�ڽ����</td>
 				<td width="15%">$��õ</td>
 				<td width="5%"><button class="btn btn-info btn-xs">����</button></td>
 				<td width="5%"><button class="btn btn-danger btn-xs">����</button></td>
 			</tr>
 			      </c:forEach>
 			      
 			<tr>
 				<td colspan="6" class="text-right"> �ڼ��� ����� �ڼ������⸦ ��������</td>
 			</tr>
          </table>
			
       
   

	</div>


</div>
	<%-- </c:forEach> --%>


</body>
</html>