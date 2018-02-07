<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>여러개 마커에 이벤트 등록하기1</title>
<!--     <style>
    .overlay_info {border-radius: 6px; margin-bottom: 12px; float:left;position: relative; border: 1px solid #ccc; border-bottom: 2px solid #ddd;background-color:#fff;}
    .overlay_info:nth-of-type(n) {border:0; box-shadow: 0px 1px 2px #888;}
    .overlay_info a {display: block; background: #d95050; background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center; text-decoration: none; color: #fff; padding:12px 36px 12px 14px; font-size: 14px; border-radius: 6px 6px 0 0}
    .overlay_info a strong {background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_icon.png) no-repeat; padding-left: 27px;}
    .overlay_info .desc {padding:14px;position: relative; min-width: 190px; height: 56px}
    .overlay_info img {vertical-align: top;}
    .overlay_info .address {font-size: 12px; color: #333; position: absolute; left: 80px; right: 14px; top: 24px; white-space: normal}
    .overlay_info:after {content:'';position: absolute; margin-left: -11px; left: 50%; bottom: -12px; width: 22px; height: 12px; background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png) no-repeat 0 bottom;}
</style> -->

</head>
<body>

	<div id="map" style="width: 100%; height: 350px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d7e1caf16f1fe180e708f6b17474f2fa&libraries=services"></script>
	<script>
var point1;
var point2;
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 8 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다

var geocoder1 = new daum.maps.services.Geocoder();
geocoder1.addressSearch('서울시 마포구 월드컵북로 47길 8', function(result, status) {
     if (status === daum.maps.services.Status.OK) 
        var coords1 = new daum.maps.LatLng(result[0].y, result[0].x);
     point1=   new daum.maps.LatLng(result[0].y, result[0].x);
     var marker1 = new daum.maps.Marker({
            map: map,
            position: coords1
        });
     
        var infowindow1 =  new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">1</div>'
        });
        infowindow1.open(map, marker1);
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
   	
  

}); 
var geocoder2 = new daum.maps.services.Geocoder();
geocoder2.addressSearch('	서울 강서구 화곡동 897-18', function(result, status) {
     if (status === daum.maps.services.Status.OK) 
        var coords2 = new daum.maps.LatLng(result[0].y, result[0].x);
     point2=   new daum.maps.LatLng(result[0].y, result[0].x);
        var marker2 = new daum.maps.Marker({
            map: map,
            position: coords2
        });
        var infowindow2 = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">2</div>'
        });
        infowindow2.open(map, marker2);
 
});   
var geocoder3 = new daum.maps.services.Geocoder();
geocoder3.addressSearch('서울 강서구 화곡4동 779-11', function(result, status) {
     if (status === daum.maps.services.Status.OK) 
        var coords3 = new daum.maps.LatLng(result[0].y, result[0].x);
        var marker3 = new daum.maps.Marker({
            map: map,
            position: coords3
        });
        var content = '<div class="overlay_info">';
        content += '    <a href="http://place.map.daum.net/17600274" target="_blank"><strong>월정리 해수욕장</strong></a>';
        content += '    <div class="desc">';
        content += '        <img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">';
        content += '        <span class="address">서울 강서구 화곡4동 779-11</span>';
        content += '    </div>';
        content += '</div>';
        var infowindow3  =new daum.maps.InfoWindow({
            content: content
        });
         infowindow3.open(map, marker3);   
		// 3곳의 평균좌표 로 센터설정
		var center = new daum.maps.LatLng((point1.getLat()+point2.getLat()+coords3.getLat())/3, (point1.getLng()+point2.getLng()+coords3.getLng())/3);
		alert(center);
        
        map.setCenter(center);

});   

</script>

</body>
</html>