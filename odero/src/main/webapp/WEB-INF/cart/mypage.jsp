<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta charset=UTF-8">
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
	

	<!-- <span class="tab">내 정보</span> -->
	<a href="mypage_list.do"><span class="tab">찜 리스트</span></a>
	</div>
		
	
	<%-- c:forEach var="i" begin="1" end="3"> --%>
<div class="row cart">

<div class="table_wrap">
	<hr class="soften" /><h3 class="sub_text">내 정보 &nbsp;
	<a href="mypage_list.do"><button class="btn btn-success btn-xs">더보기 </button></a> <hr class="soften" /> </h3> 

           
          <table class="table table-hover" id="table_content" width=600>
          
          </table>
</div>
         
<div class="table_wrap">
	<hr class="soften" /><h3 class="sub_text">추천 가게 리스트  Best5 &nbsp;
	<a href="mypage_list.do"><button class="btn btn-success btn-xs">더보기 </button></a> <hr class="soften" /> </h3> 

           
          <table class="table table-hover" width=600>
 			<tr>
 				<th width="5%">번호</th>
 				<th width="30%" class="text-center">가게이름</th>
 				<th width="40%" class="text-center">가게경로</th>
 				<th width="15%">추천</th>
 				<th width="5%">자세히</th>
 				<th width="5%">삭제</th>
 			</tr>
 			
 			<c:forEach var="i" begin="1" end="5">
 			<tr>
 				<td width="5%">${i}</td>
 				<td width="30%" class="text-center">$코스이름</td>
 				<td width="40%" class="text-center">$코스경로</td>
 				<td width="15%">$추천</td>
 				<td width="5%"><button class="btn btn-info btn-xs">보기</button></td>
 				<td width="5%"><button class="btn btn-danger btn-xs">삭제</button></td>
 			</tr>
 			  </c:forEach>
 			<tr>
 				<td colspan="6" class="text-right"> 자세한 목록은 자세히보기를 누르세요</td>
 			</tr> 			
          </table>

        <!--   <hr class="hr" /> -->
       


	
	</div>
	
	
	<br><br>
<div class="table_wrap">


	<hr class="soften" /><h3 class="sub_text">추천 코스 리스트 Best5 &nbsp;
	<a href="mypage_list.do"><button class="btn btn-success btn-xs">더보기 </button></a> <hr class="soften" /> 
	
	</h3> 
	

         
          <table class="table table-hover" id="table_content" width=600>
 			<tr>
 				<th width="5%">번호</th>
 				<th width="30%" class="text-center">코스이름</th>
 				<th width="40%" class="text-center">코스경로</th>
 				<th width="15%">추천</th>
 				<th width="5%">자세히</th>
 				<th width="5%">삭제</th>
 			</tr>
 			  <c:forEach var="i" begin="1" end="5">
 			<tr>
 				<td width="5%">${i}</td>
 				<td width="30%" class="text-center">$코스이름</td>
 				<td width="40%" class="text-center">$코스경로</td>
 				<td width="15%">$추천</td>
 				<td width="5%"><button class="btn btn-info btn-xs">보기</button></td>
 				<td width="5%"><button class="btn btn-danger btn-xs">삭제</button></td>
 			</tr>
 			      </c:forEach>
 			      
 			<tr>
 				<td colspan="6" class="text-right"> 자세한 목록은 자세히보기를 누르세요</td>
 			</tr>
          </table>
			
       
   

	</div>
</div>

</div>
	<%-- </c:forEach> --%>


</body>
</html>