<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
	// ���� �߰�
	$('#add').click(function(){
		$('#fileView').append(
			'<tr id="f'+(fileIndex)+'">'+
				'<td width="20%" id="file">����'+(fileIndex+1)+'</td>'+
				'<td width="80%" align="left">'+
					'<input type="file" name="images['+fileIndex+']" size="15" id="file'+(fileIndex)+'">'+
				'</td>'+
			'</tr>');
		$('#file'+(fileIndex)).on('change', function() {
            	$('#freeview').show();
            readURL(this);
         });
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
	
	//�̹��� ����
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
	   }
	
	
	// �ּ�ã��
	var keyword = $('#keyword').val();
	$('#keyword').click(function(){
		if(keyword=='��ȣ�� �Է�'){
			$('#keyword').val('');
		}	
	});
	
	// ���
	$('#okbtn').click(function(){		
		var title = $('#title').val();
		var store = $('#store').val();
		var title = $('#title').val();
		var content = $('#content').val();
		if(title.trim()==""){
			alert('������ �Է����ּ���');
			$('#title').focus();
			return false;
		} else if(store.trim()==""){
			alert('���Ը��� �Է����ּ���');
			$('#store').focus();
			return false;
		} else if(content.trim()==""){
			alert('������ �Է����ּ���');
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
		<center><h3><b>�ı� �ۼ�</b></h3><br></center>
		<form action="review_insert_ok.do" method="post" id="frm">
		<table class="table table-hover" style="width: 70%; margin: 0px auto;" >
			<tr>
				<td width="20%" class="text-center">����</td>
				<td width="80%" class="text-left">
					<input type="text" name="r_subject" id="title" size="50">
				</td>
			</tr>
			<tr>
				<td width="20%" class="text-center">���Ը�</td>
				<td width="80%" class="text-left">
					<input type="text" name="r_pname" id="storthisElement').show()e" size="30">
				</td>
			</tr>
			<tr>
				<td width="20%" class="text-center">�ۼ���</td>
				<td width="80%" class="text-left">
					<input type="text" name="m_id" size="15" readonly="readonly" value="1">
				</td>
			</tr>
			<tr>
				<td width="20%" class="text-center">�ּ�</td>
				<td width="80%" class="text-left">
					<input type="text" name="r_addr" id="addr" size="50" readonly placeholder="�ּҸ� �˻� �� �������ּ���!">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="map_wrap">
						<!-- ���� -->
						<div id="map" style="width:100%;height:100%;"></div>
						<!-- �˻�â -->
						<div id="menu_wrap" class="bg_white">
       						<div class="option">
           						<div>
                					�˻� : <input type="text" id="keyword" size="15" value="��ȣ�� �Է�"> 
                    				<input type="button" value="�˻�" id="mapsearch" onclick="searchPlaces(); return false;"> 
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
				<td width="20%" class="text-center">÷������</td>
				<td width="80%" class="text-left">
					<table class="table table-hover">
						<tr>
							<td class="text-right">
								<input type="button" class="btn btn-xs btn-info" id="add" value="�߰�">
								<input type="button" class="btn btn-xs btn-danger" id="cancel" value="���">
							</td>
						</tr>
					</table>
					<table class="table table-hover" id="fileView">
					</table>
				</td>
			</tr>
			<tr style="display: none;" id="freeview">
				<td colspan="2" class="text-center">
					<div style="display: inline-block;">
						<div id="myimg" style="display: inline;"></div>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea rows="10" cols="100%" name="content" id="content" placeholder="�����Է�"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<input type="button" value="���" id="okbtn">&nbsp;
					<input type="button" value="���" id="btn" onclick="javascript:history.back();">
				</td>
			</tr>
		 </table>
		 </form>
	</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=641146c1d3ef1301e2a1f709fdc1b146&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), 	// ���� ǥ���� div 
    mapOption = { 									// ���� �ɼ�
        center: new daum.maps.LatLng(33.450701, 126.570667), // ���� �߽���ǥ
        level: 3 // ���� Ȯ�뷹��
    };

// ������ ǥ���� div��  ���� �ɼ�����  ���� ����
var map = new daum.maps.Map(mapContainer, mapOption); 


//------------------------------------------------------------ ��Ŀ ------------------------------------------------------------
//��Ŀ�� ���� �迭
var markers = [];


//------------------------------------------------------------ �˻� ------------------------------------------------------------
//��� �˻� ��ü ����
var ps = new daum.maps.services.Places(); 

//�˻� ��� ����̳� ��Ŀ�� Ŭ������ �� ��Ҹ��� ǥ���� ���������츦 ����
var infowindow = new daum.maps.InfoWindow({zIndex:1});

//Ű����� ��Ҹ��˻�
searchPlaces();

//Ű���� �˻��� ��û�ϴ� �Լ�
function searchPlaces() {
	var keyword = $('#keyword').val();

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('Ű���带 �Է����ּ���!');
        return false;
    } 
    if (keyword=="��ȣ�� �Է�"){
    	return false;
    }
    // ��Ұ˻� ��ü�� ���� Ű����� ��Ұ˻��� ��û
    ps.keywordSearch(keyword, placesSearchCB); 
}

//��Ұ˻��� �Ϸ���� �� ȣ��Ǵ� �ݹ��Լ�
function placesSearchCB(data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {
        // ���������� �˻��� �Ϸ������ �˻� ��ϰ� ��Ŀ�� ǥ��
        displayPlaces(data);

        // ������ ��ȣ�� ǥ���մϴ�
        displayPagination(pagination);

    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('�˻� ����� �������� �ʽ��ϴ�.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('�˻� ��� �� ������ �߻��߽��ϴ�.');
        return;

    }
}

//---------------------------------------------------------- �˻� �Ϸ� ----------------------------------------------------------
// �˻� ��� ��ϰ� ��Ŀ�� ǥ���ϴ� �Լ�
function displayPlaces(places) {
	
    var listEl = document.getElementById('placesList'), // �˻� ���
    menuEl = document.getElementById('menu_wrap'),		// �˻� Ʋ
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // �˻� ��� ��Ͽ� �߰��� �׸���� ����
    removeAllChildNods(listEl);
    // ������ ǥ�õǰ� �ִ� ��Ŀ�� ����
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {
        // ��Ŀ�� �����ϰ� ������ ǥ��
        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), // ��Ŀ
            itemEl = getListItem(i, places[i]); // �˻� ��� �׸� Element�� ����
            
        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ����� LatLngBounds ��ü�� ��ǥ�� �߰�
        bounds.extend(placePosition);

        // ��Ŀ�� �˻���� �׸� mouseover ������ �ش� ��ҿ� ���������쿡 ��Ҹ��� ǥ���մϴ� mouseout ���� ���� ���������츦 �ݽ��ϴ�
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
            // Ŭ���� �ּ� ��������
            daum.maps.event.addListener(marker, 'click', function() {
                getAddr(addr);
            });
            
            itemEl.onclick =  function () {
                getAddr(addr);
            };
        })(marker, places[i].place_name,places[i].address_name); //������ �ѱ��

        fragment.appendChild(itemEl);
    }

    // �˻���� �׸���� �˻���� ��� Elemnet�� �߰�
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // �˻��� ��� ��ġ�� �������� ���� ������ �缳��
    map.setBounds(bounds);
}

//---------------------------------------------------------- �˻��� �����߰� ----------------------------------------------------------
// �˻���� �׸��� Element�� ��ȯ�ϴ� �Լ��Դϴ�
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

//---------------------------------------------------------- �˻��� ��Ŀ�߰� ----------------------------------------------------------
// ��Ŀ�� �����ϰ� ���� ���� ��Ŀ�� ǥ���ϴ� �Լ�
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // ��Ŀ �̹��� url, ��������Ʈ �̹����� ���ϴ�
        imageSize = new daum.maps.Size(36, 37),  // ��Ŀ �̹����� ũ��
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // ��������Ʈ �̹����� ũ��
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
            offset: new daum.maps.Point(13, 37) // ��Ŀ ��ǥ�� ��ġ��ų �̹��� �������� ��ǥ
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // ��Ŀ�� ��ġ
            image: markerImage 
        });

    marker.setMap(map); // ���� ���� ��Ŀ�� ǥ���մϴ�
    markers.push(marker);  // �迭�� ������ ��Ŀ�� �߰��մϴ�

    return marker;
}

//---------------------------------------------------------- �˻� ����Ʈ ������ ----------------------------------------------------------
// �˻���� ��� �ϴܿ� ��������ȣ�� ǥ�ô� �Լ��Դϴ�
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // ������ �߰��� ��������ȣ�� �����մϴ�
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

//---------------------------------------------------------- ��Ŀ Ŭ���� ���������ֱ� ----------------------------------------------------------
// �˻���� ��� �Ǵ� ��Ŀ�� Ŭ������ �� ȣ��Ǵ� �Լ�, ���������쿡 ��Ҹ��� ǥ��
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

// �ּҰ�������
function getAddr(addr) {
	$('#addr').val(addr);
}

//---------------------------------------------------------- ��Ŀ, �˻���� ���� ----------------------------------------------------------
// ���� ���� ǥ�õǰ� �ִ� ��Ŀ�� ��� ����
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// �˻���� ����� �ڽ� Element�� �����ϴ� �Լ�
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>
</div>
</body>
</html>