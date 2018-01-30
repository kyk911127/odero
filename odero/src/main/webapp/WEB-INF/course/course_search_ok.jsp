<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f71a358ab1852f4a6dd2eee5070f7a02&libraries=services"></script>
<script>
	var p_addr = [];
	var strPosition = "";
	var strPno = "";
</script>
<c:forEach var="vo" items="${p_list }">
	<script>
		
		var geocoder = new daum.maps.services.Geocoder();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch("${vo.p_addr}", function(result, status) {
		// 정상적으로 검색이 완료됐으면 
		  if (status === daum.maps.services.Status.OK) {
		     var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		     strPosition = strPosition + coords.toString() + "_";
		     strPno = strPno + "${vo.p_no}" + "_";
		     if(strPosition.split("_").length > 9) {
		      form_data(true);
		     } else {
		      form_data(false);
		     }
		 } 
		});
		  function form_data(bCheck) {
			  if(bCheck==true) {
			   var form = document.createElement("form");     
			   form.setAttribute("method","post");                    
			   form.setAttribute("action","course_search.do");          
			   document.body.appendChild(form);                       

			   //input - p_no
			   var input_id = document.createElement("input");  
			   input_id.setAttribute("type", "hidden");                 
			   input_id.setAttribute("name", "strPno");                        
			   input_id.setAttribute("value", strPno);
			   form.appendChild(input_id);
			   
			   //input - p_coords
			   var input_id2 = document.createElement("input");  
			   input_id2.setAttribute("type", "hidden");                 
			   input_id2.setAttribute("name", "strPosition");                        
			   input_id2.setAttribute("value", strPosition);
			   form.appendChild(input_id2);

			   //폼전송
			   form.submit();
			  }
			 } 
	</script>
</c:forEach>


<!-- <script>
//마커 위치
var p_addr = [];
var strPosition = "";
var strPno = "";
var geocoder = new daum.maps.services.Geocoder();
<c:forEach var="addr" items="${p_addrList }">
  p_addr.push("${addr}");
</c:forEach> 
var strPosition = "";
var selectedMarker = null; // 클릭한 마커를 담을 변수

 for(var i=0; i<9; i++) {
 // 주소로 좌표를 검색합니다
 geocoder.addressSearch(p_addr[i], function(result, status) {
 // 정상적으로 검색이 완료됐으면 
  if (status === daum.maps.services.Status.OK) {
     var coords = new daum.maps.LatLng(result[0].y, result[0].x);
      positions.push(coords.toString());
     strPosition = strPosition + coords.toString() + "_";

     if(strPosition.split("_").length > 9) {
      form_data(true);
     } else {
      form_data(false);
     }
 } 
 });
 
 function form_data(bCheck) {
  if(bCheck==true) {
   var form = document.createElement("form");     
   form.setAttribute("method","post");                    
   form.setAttribute("action","course_search.do");          
   document.body.appendChild(form);                       

   //input - p_no
   var input_id = document.createElement("input");  
   input_id.setAttribute("type", "hidden");                 
   input_id.setAttribute("name", "strPno");                        
   input_id.setAttribute("value", strPno);
   form.appendChild(input_id);
   
   //input - p_coords
   var input_id2 = document.createElement("input");  
   input_id2.setAttribute("type", "hidden");                 
   input_id2.setAttribute("name", "strPosition");                        
   input_id2.setAttribute("value", strPosition);
   form.appendChild(input_id2);

   //폼전송
   form.submit();
  }
 }
 }
 

</script> -->