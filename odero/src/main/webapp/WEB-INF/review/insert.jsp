<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="board/css/map.css" />
<style type="text/css">
.row{
	margin: 0px auto;
	width: 100%;
}
#btn,#okbtn{
	border-radius:10%;
	border:#002060;
	width:55px;
	height:35px;	
	background-color:#002060; 
	color:#DEEBF7;
}
#file{
	font-size: 13px;
}
</style>
<script type="text/javascript">
var fileIndex=0;
$(function(){
	$('#add').click(function(){
		$('#fileView').append(
			'<tr id="f'+(fileIndex)+'">'+
				'<td width="20%" id="file">사진'+(fileIndex+1)+'</td>'+
				'<td width="80%" align="left">'+
					'<input type="file" name="files['+fileIndex+']" size="15" id="file">'+
				'</td>'+
			'</tr>');
		fileIndex=fileIndex+1;
	});
	$('#cancel').click(function(){
		$('#f'+(fileIndex-1)).remove();
		fileIndex -= 1;
		if(fileIndex<0)
			fileIndex=0;
	});
		
	$('#okbtn').click(function(){		
		var title = $('#title').val();
		var store = $('#store').val();
		var title = $('#title').val();
		var content = $('#content').val();
		if(title.trim()==""){
			alert('제목을 입력해주세요');
			$('#title').focus();
			return false;
		} else if(store.trim()==""){
			alert('가게명을 입력해주세요');
			$('#store').focus();
			return false;
		} else if(content.trim()==""){
			alert('내용을 입력해주세요');
			$('#content').focus();
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
		<center><h3><b>후기 작성</b></h3><br></center>
		<form action="insert_ok.do" method="post">
		<table class="table table-hover" style="width: 70%; margin: 0px auto;" >
			<tr>
				<td width="20%" class="text-center">제목</td>
				<td width="80%" class="text-left">
					<input type="text" name="title" id="title" size="50">
				</td>
			</tr>
			<tr>
				<td width="20%" class="text-center">가게명</td>
				<td width="80%" class="text-left">
					<input type="text" name="store" id="store" size="30">
				</td>
			</tr>
			<tr>
				<td width="20%" class="text-center">작성자</td>
				<td width="80%" class="text-left">
					<input type="text" name="name" size="15" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td width="20%" class="text-center">첨부파일</td>
				<td width="80%" class="text-left">
					<table class="table table-hover">
						<tr>
							<td class="text-right">
								<input type="button" class="btn btn-xs btn-info" id="add" value="추가">
								<input type="button" class="btn btn-xs btn-danger" id="cancel" value="취소">
							</td>
						</tr>
					</table>
					<table class="table table-hover" id="fileView">
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="map_wrap">
						<div id="map" style="width:100%;height:100%;"></div>
						<div id="menu_wrap" class="bg_white">
       						<div class="option">
           						<div>
                					키워드 : <input type="text" id="keyword" size="15" value="상호명 입력"> 
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
				<td colspan="2" class="text-center">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea rows="10" cols="100%" name="content" id="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<input type="button" value="등록" id="okbtn">&nbsp;
					<input type="button" value="취소" id="btn" onclick="javascript:history.back();">
				</td>
			</tr>
		 </table>
		 </form>
	</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=641146c1d3ef1301e2a1f709fdc1b146&libraries=services"></script>
<script>
//마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = $('#keyword').val();

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    } 
    if (keyword=="상호명 입력"){
    	return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {
        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
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

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
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
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

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

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
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

  //마커에 click 이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'click', function() {
    	alert(marker[1]);
        // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
        // 마커의 이미지를 클릭 이미지로 변경합니다
        if (!selectedMarker || selectedMarker !== marker) {

            // 클릭된 마커 객체가 null이 아니면
            // 클릭된 마커의 이미지를 기본 이미지로 변경하고
            !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);

            // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
            marker.setImage(clickImage);
        }

        // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
        selectedMarker = marker;
    });
    
    return marker;
}



// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

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

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}

</script>

<script type="text/javascript">
// 마커에 이벤트 등록
ar MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
    MARKER_HEIGHT = 36, // 기본, 클릭 마커의 높이
    OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
    OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
    OVER_MARKER_WIDTH = 40, // 오버 마커의 너비
    OVER_MARKER_HEIGHT = 42, // 오버 마커의 높이
    OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
    OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
    SPRITE_MARKER_URL = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites2.png', // 스프라이트 마커 이미지 URL
    SPRITE_WIDTH = 126, // 스프라이트 이미지 너비
    SPRITE_HEIGHT = 146, // 스프라이트 이미지 높이
    SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격

var markerSize = new daum.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // 기본, 클릭 마커의 크기
    markerOffset = new daum.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
    overMarkerSize = new daum.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT), // 오버 마커의 크기
    overMarkerOffset = new daum.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y), // 오버 마커의 기준 좌표
    spriteImageSize = new daum.maps.Size(SPRITE_WIDTH, SPRITE_HEIGHT); // 스프라이트 이미지의 크기

var positions = [  // 마커의 위치
        new daum.maps.LatLng(33.44975, 126.56967),
        new daum.maps.LatLng(33.450579, 126.56956),
        new daum.maps.LatLng(33.4506468, 126.5707)
    ],
    selectedMarker = null; // 클릭한 마커를 담을 변수

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도 위에 마커를 표시합니다
for (var i = 0, len = positions.length; i < len; i++) {
    var gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
        originY = (MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
        overOriginY = (OVER_MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
        normalOrigin = new daum.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
        clickOrigin = new daum.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
        overOrigin = new daum.maps.Point(gapX * 2, overOriginY); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표
        
    // 마커를 생성하고 지도위에 표시합니다
    addMarker(positions[i], normalOrigin, overOrigin, clickOrigin);
}

// 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
function addMarker(position, normalOrigin, overOrigin, clickOrigin) {

    // 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
    var normalImage = createMarkerImage(markerSize, markerOffset, normalOrigin),
        overImage = createMarkerImage(overMarkerSize, overMarkerOffset, overOrigin),
        clickImage = createMarkerImage(markerSize, markerOffset, clickOrigin);
    
    // 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: position,
        image: normalImage
    });

    // 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
    marker.normalImage = normalImage;

    // 마커에 mouseover 이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'mouseover', function() {

        // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
        // 마커의 이미지를 오버 이미지로 변경합니다
        if (!selectedMarker || selectedMarker !== marker) {
            marker.setImage(overImage);
        }
    });

    // 마커에 mouseout 이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'mouseout', function() {

        // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
        // 마커의 이미지를 기본 이미지로 변경합니다
        if (!selectedMarker || selectedMarker !== marker) {
            marker.setImage(normalImage);
        }
    });

    // 마커에 click 이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'click', function() {
		alert("떠라!");
        // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
        // 마커의 이미지를 클릭 이미지로 변경합니다
        if (!selectedMarker || selectedMarker !== marker) {

            // 클릭된 마커 객체가 null이 아니면
            // 클릭된 마커의 이미지를 기본 이미지로 변경하고
            !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);

            // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
            marker.setImage(clickImage);
        }

        // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
        selectedMarker = marker;
    });
}

// MakrerImage 객체를 생성하여 반환하는 함수입니다
function createMarkerImage(markerSize, offset, spriteOrigin) {
    var markerImage = new daum.maps.MarkerImage(
        SPRITE_MARKER_URL, // 스프라이트 마커 이미지 URL
        markerSize, // 마커의 크기
        {
            offset: offset, // 마커 이미지에서의 기준 좌표
            spriteOrigin: spriteOrigin, // 스트라이프 이미지 중 사용할 영역의 좌상단 좌표
            spriteSize: spriteImageSize // 스프라이트 이미지의 크기
        }
    );
    
    return markerImage;
}
</script>
</div>
</body>
</html>