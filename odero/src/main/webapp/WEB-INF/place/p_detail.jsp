<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> -->
<link rel="stylesheet" type="text/css" href="css/p_detail.css">
<!-- <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script> -->

<!-- 1. Link to jQuery (1.8 or later), -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
 
<!-- fotorama.css & fotorama.js. -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
<script type="text/javascript">
/* window.onload = function(){
	var modal = document.getElementById('myModal');
	var img = document.getElementById('myImg');
	var modalImg = document.getElementById("img01");

	   img.onclick = function() {
		  alert(modal);
		  alert(img);
		  alert(modalImg);
	      modal.style.display = "none";
	      modalImg.src = this.src;
	      captionText.innerHTML = this.alt;
	   } 
} */
$(function(){
	$('.detail_img').find('.place_img').each(function(){     
		
		$('.place_img').click(function(){     
			var pp =$(this).attr('src');
			$('.fo').html("<img src='" + pp + "'>");   
		});  
	}); 
	
	
});   
</script>
</head>
<body>
   <div class="container-fluid top_container">
      <div class="row imagerow" style="position: relative;">
         <c:forEach var="i" items="${timg }" varStatus="a">
            <div class="detail_img" data-target="#myModal" data-toggle="modal">
               <div style="border-left: 8px solid #fff;">
                  <img class="place_img" id="pimg${a.index }" src="${i }">
               </div>
            </div> 
         </c:forEach>
         <div>
            <a href="#" data-target="#myModal" data-toggle="modal">
               <div class="img_more">
                  <p class="i_more">사진 더보기 &nbsp;<img src="p_image/right-arrow.png"></p>
               </div>
            </a>
         </div>
      </div>
   </div>
   
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg bora">
         <div class="modal-content mo_content">
          	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
            <div id="modal-body">	<!--  data-thumbmargin="20px 0"  -->
               <div class="fotorama fo" data-width="800" data-maxwidth="100%" data-ratio="16/9" data-allowfullscreen="true" data-nav="thumbs" data-thumbfit="cover">
     				<%-- <c:forEach var="i" items="${timg }">
                        <img src="${i }">
                     </c:forEach>  --%>
               </div>
               
<!--                <div class="fotorama" data-nav="thumbs">
                  <a href="p_image/top.jpg"><img src="p_image/top.jpg" width="144" height="96"></a>
                  <a href="p_image/top.jpg"><img src="p_image/top.jpg" width="64" height="128"></a>
               </div> -->
            </div>
            <%-- <div id="modal-footer" style="height: 90px; margin-top: 40px;">
               <div class="fotorama_img" style="width: 1000px; padding: 10px;">
                  <c:forEach var="i" begin="1" end="13">
                     <div class="small_img" style="float: left; width: 70px; margin-right: 5px;">
                        <img alt="" src="p_image/top2.jpg" style="width: 100%">
                     </div>
                  </c:forEach>
               </div>
            </div> --%>
         </div>
      </div>
   </div>
   <div class="container mid_container">
      <div class="row row_info">
         <h3>엉망징창키친 홍대점</h3>
         <div style="padding: 15px; border-bottom: 1px solid #dbdbdb;">
         	<!-- <span class="glyphicon glyphicon-tent" aria-hidden="true"></span> 이색/체험 -->
            <span class="cate_span">
               <img class="cate_icon" src="p_image/tent.png">&nbsp; 이색/체험
            </span>
             <span class="cate_span">
               <img class="cate_icon" src="p_image/restaurant.png">&nbsp; 맛집
            </span>
             <span class="cate_span">
               <img class="cate_icon" src="p_image/coffee.png">&nbsp; 까페
            </span>
            <table style="margin: 20px 0;">
               <tr>
                  <td width="20%">주소</td>
                  <td>서울특별시 마포구 서교동 358-113 5층 노란색문</td>
               </tr>
               <tr>
                  <td width="20%">전화번호</td>
                  <td>02-313-9977</td>
               </tr>
               <tr>
                  <td width="20%">가격대</td>
                  <td>2만원 ~ 5만원</td>
               </tr>
               <tr>
                  <td width="20%">키워드</td>
                  <td> 
                     <ul class="tags">
                        <li class="li_1">
                           <div class="tag_1">기분내기</div>
                           <div class="tag_1">고백하기좋은</div>
                           <div class="tag_1">기념일</div>
                           <div class="tag_1">진도나가기</div>
                           <div class="tag_1">프로포즈</div> <br>
                        </li>
                        <li class="li_2">
                           <div class="tag_2">힐링</div>
                           <div class="tag_2">휴식하기</div> <br>
                        </li>
                     </ul>
                  </td>
               </tr>
            </table>
         </div>
      </div> 

      <div class="row row_map">
         <h3>지도</h3>
         <div id="map" style="width:100%;height:400px;">
         <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=90ca2826f787f6d4fc01f89cb8bcdce3"></script>
		 <script>
			var container = document.getElementById('map');
			var options = {
				center: new daum.maps.LatLng(33.450701, 126.570667),
				level: 3
			};
	
			var map = new daum.maps.Map(container, options);
		  </script>
            <!-- <img src="p_image/map.PNG" width="100%"> -->
         </div>
      </div>
      <div class="row row_review">
         <h3>엉망징창키친의 리뷰(10)</h3>
         <table class="review_list">
            <c:forEach var="i" begin="1" end="3">
               <tr style="border-bottom: 1px solid #dbdbdb;">
                  <td width="13%">
                     <div class="user_info">
                        <div class="user_img">
                           <img src="p_image/user.png" class="im">
                        </div>
                        <div class="user_name" style="margin-top: 10px">달해</div>
                     </div>
                  </td>
                  <td width="87%" style="padding: 20px 0">
                     <div class="review_info">
                        <p class="review_content">
                           외국에 온 것 같은 느낌이 드는 카페. 천장도 높고 문도
                           크으고. 벽면의 그림들도 큼직큼직. 시원시원해서 좋아요! 테이블 사이 간격도 넓습니다. 핸드 드립 커피도 마실 수
                           있고요 아침에는 모닝 빵 뷔페도 해요! 음료 가격 + 9,000원(?) 정도 내면 그날 갓 구운 빵과 샐러드,
                           햄, 스크램블 등을 드실 수 있습니다. 저는 페퍼민트 티와 티라미수를 주문했어요. 페퍼민트티는 질 안 좋은 거
                           마시면 되게 역한데.. 여기는 향과 맛이 훌륭했어요! 브루잉 도구도 같이 줘서 좋구요. 티라미수는 마스카포네의
                           깊은 맛이 잘 느껴져요. 밑의 시트는 에스프레소에 흥건히 적셔져 있습니다. 퀄리티있는 커피라 맛은 있지만 조금 덜
                           적셔주면 더 좋을 것 같아요.</p>
                        <span class="review_date">2018-01-02</span>
                     </div>
                  </td>
               </tr>
            </c:forEach>
         </table>
      </div>
      
      <div class="row row_reply">
         <div class="col-md-12" style="padding: 0px 20px">
            <h4>
               <span class="com_title"><b>리뷰쓰기</b></span>
            </h4>
            <div class="reply_write">
               <form method=post action="">
                  <input type="hidden" name=bno value="">
                  <textarea class="reply_ta" rows="4" cols="140" name="msg"></textarea>
                  <input type="button" class="btn btn-info btn-sm pull-right" value="등    록" style="width: 75px; height: 90px">
               </form>
            </div>
         </div>
      </div>
   </div>
</body>
</html>