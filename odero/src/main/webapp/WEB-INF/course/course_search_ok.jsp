<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
     src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f71a358ab1852f4a6dd2eee5070f7a02&libraries=services"></script>
<script>
//��Ŀ ��ġ
var p_addr = [];
<c:forEach var="addr" items="${p_addrList }">
  p_addr.push("${addr}");
</c:forEach>
var positions = []; 
var strPosition = "";
var selectedMarker = null; // Ŭ���� ��Ŀ�� ���� ����
var geocoder = new daum.maps.services.Geocoder();

for(var i=0; i<9; i++) {
 // �ּҷ� ��ǥ�� �˻��մϴ�
 geocoder.addressSearch(p_addr[i], function(result, status) {
 // ���������� �˻��� �Ϸ������ 
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

   //input
   var input_id = document.createElement("input");  
   input_id.setAttribute("type", "hidden");                 
   input_id.setAttribute("name", "strPosition");                        
   input_id.setAttribute("value", strPosition);
   form.appendChild(input_id);

   //������
   form.submit();
  }
 }
}

</script>