<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="review/css/map.css" />
<style type="text/css">
.row{
	margin: 0px auto;
	width: 100%;
}
#okbtn,#btn{
	border-radius:10%;
	border:#002060;
	width:55px;
	height:35px;	
}
#okbtn{
	background-color:#002060; 
	color:white
}
#btn{
	background-color:#F3ABBA; 
	color:white;
}
#file{
	font-size: 13px;
}
#add{
	background-color:#002060; 
	color:white
}
#cancel{
	background-color:#F3ABBA; 
	color:white;
}
</style>
<script type="text/javascript">
var fileIndex=0;
$(function(){
	// 사진 추가
	$('#add').click(function(){
		$('#fileView').append(
			'<tr id="f'+(fileIndex)+'">'+
				'<td width="20%" id="file">사진'+(fileIndex+1)+'</td>'+
				'<td width="80%" align="left">'+
					'<input type="file" name="images['+fileIndex+']" size="15" id="images'+(fileIndex)+'" accept="image/gif,image/jpeg,image/png">'+
				'</td>'+
			'</tr>');
		/* $('#images'+(fileIndex)).on('change', function() {
            	$('#freeview').show();
            readURL(this);
         }); */
		fileIndex=fileIndex+1;
	});
	$('#cancel').click(function(){
		$('#f'+(fileIndex-1)).remove();
		fileIndex -= 1;
		if(fileIndex<0)
			fileIndex=0;
		$('#ff' + (fileIndex+1)).remove();
		if(fileIndex==0){
			$('#freeview').hidden();
		}
	});
	
	/* //이미지 띄우기
	function readURL(input) {
	      if (input.files && input.files[0]) {
	         var reader = new FileReader();
	         
	         reader.onload = function(e) {
	            $('#myimg').append('<div id="img"'+(fileIndex)+' style="display:inline-block;">'+
	               '<img id=ff' + (fileIndex) + ' style="border:1px solid black;" src="#" width="200px;"; height="280px";/>'+      
	               '</div>');
	            $('#ff'+(fileIndex)).attr('src', e.target.result);
	         }
	         reader.readAsDataURL(input.files[0]);
	      }
	   } */
	
	// 주소찾기
	var keyword = $('#keyword').val();
	$('#keyword').click(function(){
		if(keyword=='상호명 입력'){
			$('#keyword').val('');
		}	
	});
	
	// 등록
	$('#okbtn').click(function(){		
		var subjecr = $('#r_subject').val();
		var pname = $('#r_pname').val();
		var addr = $('#r_addr').val();
		var content = $('#r_content').val();
		if(subjecr.trim()==""){
			alert('제목을 입력해주세요');
			$('#r_subject').focus();
			return false;
		} else if(pname.trim()==""){
			alert('가게명을 입력해주세요');
			$('#r_pname').focus();
			return false;
		} else if(addr.trim()=="") {
			alert('주소를 등록해주세요');
			$('#keyword').focus();
			return false;
		} else if(content.trim()==""){
			alert('내용을 입력해주세요');
			$('#r_content').focus();
			return false;
		} else {
			$('#frm').submit();
		}
	});
});	
</script>
</head>
<body>
<div class="container" style="margin-top: 50px">
	<div class="row">
		<center><h3><b>게시물 작성</b></h3><br></center>
		<form:form method="post" action="review_insert_ok.do" id="frm" enctype="multipart/form-data" modelAttribute="uploadForm">
		<table class="table table-hover" style="width: 70%; margin: 0px auto;" >
			<tr>
				<td width="20%" class="text-center warning">제목</td>
				<td width="80%" class="text-left">
					<input type="text" name="r_subject" id="r_subject" size="50">
				</td>
			</tr>
			<tr>
				<td width="20%" class="text-center warning">가게명</td>
				<td width="80%" class="text-left">
					<input type="text" name="r_pname" id="r_pname" size="50">
				</td>
			</tr>
			<tr>
				<td width="20%" class="text-center warning">작성자</td>
				<td width="80%" class="text-left">
					<input type="text" name="m_id" size="20" readonly="readonly" value="${sessionScope.m_id }">
				</td>
			</tr>
			<tr>
				<td width="20%" class="text-center warning">주소</td>
				<td width="80%" class="text-left">
					<input type="text" name="r_addr" id="r_addr" size="50" readonly placeholder="주소를 검색 후 선택해주세요!">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="map_wrap">
						<!-- 지도 -->
						<div id="map" style="width:100%;height:100%;"></div>
						<!-- 검색창 -->
						<div id="menu_wrap" class="bg_white">
       						<div class="option">
           						<div>
                					검색 : <input type="text" id="keyword" size="15" value="상호명 입력"> 
                    				<input type="button" value="검색" id="mapsearch" onclick="searchPlaces(); return false;"> 
								</div>
        					</div>
        					<hr>
					        <ul id="placesList"></ul>
					        <div id="pagination"></div>
    					</div>
					</div>
				</td>
			</tr>
			<tr>
				<td width="20%" class="text-center" ><br>첨부파일</td>
				<td width="80%" class="text-left">
					<table class="table table-hover">
						<tr>
							<td class="text-right">
								<input type="button" class="btn btn-xs" id="add" value="추가">
								<input type="button" class="btn btn-xs" id="cancel" value="취소">
							</td>
						</tr>
					</table>
					<table class="table table-hover" id="fileView">
					</table>
				</td>
			</tr>
			<!-- <tr style="display: none;" id="freeview">
				<td colspan="2" class="text-center">
					<div style="display: inline-block;">
						<div id="myimg" style="display: inline;"></div>
					</div>
				</td>
			</tr> -->
			<tr>
				<td colspan="2">
					<textarea rows="10" cols="100%" name="r_content" id="r_content" placeholder="내용입력"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<input type="button" value="등록" id="okbtn">&nbsp;
					<input type="button" value="취소" id="btn" onclick="javascript:history.back();">
				</td>
			</tr>
		 </table>
		 </form:form>
	</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=641146c1d3ef1301e2a1f709fdc1b146&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), 	// 지도 표시할 div 
    mapOption = { 									// 지도 옵션
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도 중심좌표
        level: 3 // 지도 확대레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도 생성
var map = new daum.maps.Map(mapContainer, mapOption); 
//마커를 담을 배열
var markers = [];

//------------------------------------------------------------ 검색 ------------------------------------------------------------
//장소 검색 객체 생성
var ps = new daum.maps.services.Places(); 

//검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성
var infowindow = new daum.maps.InfoWindow({zIndex:1});

//키워드로 장소를검색
searchPlaces();

//키워드 검색을 요청하는 함수
function searchPlaces() {
	var keyword = $('#keyword').val();

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    } 
    if (keyword=="상호명 입력"){
    	return false;
    }
    // 장소검색 객체를 통해 키워드로 장소검색을 요청
    ps.keywordSearch(keyword, placesSearchCB); 
}

//장소검색이 완료됐을 때 호출되는 콜백함수
function placesSearchCB(data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {
        // 정상적으로 검색이 완료됐으면 검색 목록과 마커를 표출
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

//---------------------------------------------------------- 검색 완료 ----------------------------------------------------------
// 검색 결과 목록과 마커를 표출하는 함수
function displayPlaces(places) {
	
    var listEl = document.getElementById('placesList'), // 검색 목록
    menuEl = document.getElementById('menu_wrap'),		// 검색 틀
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거
    removeAllChildNods(listEl);
    // 지도에 표시되고 있는 마커를 제거
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {
        // 마커를 생성하고 지도에 표시
        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), // 마커
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성
            
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해 LatLngBounds 객체에 좌표를 추가
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때 해당 장소에 인포윈도우에 장소명을 표시합니다 mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title, addr) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
            // 클릭시 주소 가져오기
            daum.maps.event.addListener(marker, 'click', function() {
                getAddr(addr,title);
            });
            
            itemEl.onclick =  function () {
                getAddr(addr,title);
            };
        })(marker, places[i].place_name,places[i].address_name); //데이터 넘기기

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정
    map.setBounds(bounds);
}

//---------------------------------------------------------- 검색된 내용추가 ----------------------------------------------------------
// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

//---------------------------------------------------------- 검색된 마커추가 ----------------------------------------------------------
// 마커를 생성하고 지도 위에 마커를 표시하는 함수
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

//---------------------------------------------------------- 검색 리스트 페이지 ----------------------------------------------------------
// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

//---------------------------------------------------------- 마커 클릭시 정보보여주기 ----------------------------------------------------------
// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수, 인포윈도우에 장소명을 표시
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

// 주소가져오기
function getAddr(addr,title) {
	$('#r_addr').val(addr);
	$('#r_pname').val(title);
}

//---------------------------------------------------------- 마커, 검색결과 제거 ----------------------------------------------------------
// 지도 위에 표시되고 있는 마커를 모두 제거
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록의 자식 Element를 제거하는 함수
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>
</div>
</body>
</html>