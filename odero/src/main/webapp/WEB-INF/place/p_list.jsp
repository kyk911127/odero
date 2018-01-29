<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="css/p_list.css">
<!-- 이미지슬라이드  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> <!-- 충돌 -->
  
<style>
input[type=radio]
{
	display: none;
}
</style>
<script type="text/javascript">
$(function(){
   
   $('.loc_pick').hide();
   $('.gangnam_d').hide();
   $('.gangbuk_d').hide();
   
   
   $('input:radio').click(function(){
      
      var S=$(this).val();    //value
      var N=$(this).attr('name'); //name : 공통값
 
     if(S=="이색/체험" || S=="맛집/카페")
    	 {
    	 	
    	 	if(S=="이색/체험")
    	 		{
    	 		$('#l_food').css("background", "rgb(203, 203, 203)");
        	 	$('#l_play').css("background", "rgb(3, 32, 95)");
    	 		}
    	 	else
    	 		{
    	 		
    	 		$('#l_play').css("background", "rgb(203, 203, 203)");
        	 	$('#l_food').css("background", "rgb(3, 32, 95)");
    	 		}
    	 
    	 }
    

   if(S=="강남"|| N=="gn")
	   {
		   if(S=="강남")
		   {
		     
		     $('#l_gangbuk').css("background", "rgb(203, 203, 203)");
	  	     $('#l_gangnam').css("background", "rgb(3, 32, 95)");
	         $('.gangbuk_d').hide();
	         $('.loc_pick').show();
	         $('.gangnam_d').show();
		   }
	   else
		   {
		   		
		   		$(".gn_ul>.tp_li >label").css("background", "rgb(203, 203, 203)");  //초기화
		   		
		   	 	var gn_size=$(".gangnam_d >.tp_ul > li").length;
		     	var str='';
			 	for(var i=0; i<gn_size; i++)
	            {
	               str=$("input[name=gn]:eq("+i+")").val();
	              
	               if(S==str)
	               {
	                  $(".gn_ul>.tp_li >label:eq("+i+")").css("background", "rgb(3, 32, 95)");
	                  return;
	               }
	            }
		   }
		   
		
	   }
	  
   if(S=="강북"|| N=="gb")
	   {
	   		if(S=="강북")
	   			{
			   		
				     $('#l_gangnam').css("background", "rgb(203, 203, 203)");
			  	     $('#l_gangbuk').css("background", "rgb(3, 32, 95)");
			         $('.gangnam_d').hide();
			         $('.loc_pick').show();
			         $('.gangbuk_d').show();
	   			}
	   		else
	   			{
			   		$(".gb_ul>.tp_li >label").css("background", "rgb(203, 203, 203)");  //초기화
			   		
			   	 	var gn_size=$(".gangbuk_d >.tp_ul > li").length;
			     	var str='';
				 	for(var i=0; i<gn_size; i++)
		            {
		               str=$("input[name=gb]:eq("+i+")").val();
		               if(S==str)
		               {
		               
		                  $(".gb_ul>.tp_li >label:eq("+i+")").css("background", "rgb(3, 32, 95)");
		                  return;
		               }
		            
		            }
	   				
	   			}
	   		
	   }
   
   
   });
   
  
   
   $('#Sbtn').click(function(){
      $('.btn-navy').css("background", "rgb(203, 203, 203)");
      var arr_sn=[];
      var sn_1=$("input[type=radio][name=ca]:checked").val();
      arr_sn.push(sn_1);
      var sn_2=$("input[type=radio][name=loc]:checked").val();
      
       
       
      if(sn_2=="강남")
    	  {
    	  var sn_3=$("input[type=radio][name=gn]:checked").val();    	 
    	  }
      
      else if(sn_2=="강북")
    	  {
    	  var sn_3=$("input[type=radio][name=gb]:checked").val();
    	  }
   
     arr_sn.push(sn_3); 
     alert("최종: "+arr_sn);
      
   });
  
   
   
   $('.jjimbtn').click(function(){
      var Jbtn=$(this).css("color");
      if(Jbtn=="rgb(51, 51, 51)")
         {
          $(this).css("color", "#F3ABBA"); //rgb(243, 171, 186)
            $(this).css("font-weight","bold");
         }
      else{
         $(this).css("color","rgb(51, 51, 51)")
         } 
   });
   
   
});


</script>
</head>
<body>
<div class="container-fluid">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    
    <!-- Wrapper for slides -->
    <div class="carousel-inner ">
      <div class="item active tp_slideimg">
        <img src="#" alt="Best 놀거리" style="width:100%; height:100%;">
           <ol class="tp_imgol">
              <li class="tp_imgloc">서울시 강동구 천호동</li>
              <li class="tp_imgname">"쭈꾸쭈꾸쭈꾸미"</li>
           </ol>
      </div>

      <div class="item tp_slideimg">
        <img src="img/la.jpg" alt="Best 맛집" style="width:100%; height:100%;">
        <ol class="tp_imgol">
              <li class="tp_imgloc">서울시 마포구 서교동</li>
              <li class="tp_imgname">"대패삼겹살"</li>
           </ol>
      </div>
    
      <div class="item tp_slideimg">
        <img src="" alt="Best 카페" style="width:100%; height:100%;">
        <ol class="tp_imgol">
              <li class="tp_imgloc">서울시 강남구 역삼동</li>
              <li class="tp_imgname">"내가좋아하는피자"</li>
           </ol>
      </div>
    </div>
  </div>
</div>


<div class="container tp_list">
   <div class="row">
      <div class="text-center tp_select">
       <p>
          <label>&nbsp;&nbsp;카테고리</label>
       </p>
       	 <!-- 1. 카테고리 라디오 그룹 -->
         <ul class="tp_ul">
            <li class="tp_li play_li">
            <input type="radio" name="ca" id="play" value="이색/체험">
            <label class="btn btn-lg btn-navy" for="play" id="l_play">이색/체험</label>
            </li>
            <li class="tp_li">
            <input type="radio" name="ca" id="food" value="맛집/카페">
            <label class="btn btn-lg btn-navy" for="food" id="l_food">맛집/카페</label>
            </li>
            
         </ul>
      </div>
      <hr>
       <div class="text-center tp_select">
       <p>
          <label>&nbsp;&nbsp;지역</label>
       </p>
        <!-- 2. 지역 그룹 -->
         <ul class="tp_ul">
            <li class="tp_li gangnam_li">
            <input type="radio" name="loc" id="gangnam" value="강남">
            <label class="btn btn-lg btn-navy" for="gangnam" id="l_gangnam">강남</label>
            </li>
            <li class="tp_li">
            <input type="radio" name="loc" id="gangbuk" value="강북">
            <label class="btn btn-lg btn-navy" for="gangbuk" id="l_gangbuk" >강북</label>
            </li>
         </ul>
         
      </div>
      <div class="loc_pick">
         <div class="text-center tp_loc gangnam_d">
         <!-- 3. 강남지역 그룹 -->
            <ul class="tp_ul gn_ul">
                  <li class="tp_li"><input type="radio" name="gn" id="gn_1" value="강서구">
                  <label class="btn btn-navy tp_loc_li" for="gn_1">강서구</label></li>
                  <li class="tp_li"><input type="radio" name="gn" id="gn_2" value="구로구">
                  <label class="btn btn-navy tp_loc_li" for="gn_2">구로구</label></li>
                  <li class="tp_li"><input type="radio" name="gn" id="gn_3" value="양천구">
                  <label class="btn btn-navy tp_loc_li" for="gn_3">양천구</label></li>
                  <li class="tp_li"><input type="radio" name="gn" id="gn_4" value="금천구">
                  <label class="btn btn-navy tp_loc_li" for="gn_4">금천구</label></li>
                  <li class="tp_li"><input type="radio" name="gn" id="gn_5" value="영등포구">
                  <label class="btn btn-navy tp_loc_li" for="gn_5">영등포구</label></li>
                  <li class="tp_li"><input type="radio" name="gn" id="gn_6" value="관악구">
                  <label class="btn btn-navy tp_loc_li" for="gn_6">관악구</label></li>
                  <br>
                  <li class="tp_li"><input type="radio" name="gn" id="gn_7" value="동작구">
                  <label class="btn btn-navy tp_loc_li" for="gn_7">동작구</label></li>
                  <li class="tp_li"><input type="radio" name="gn" id="gn_8" value="서초구">
                  <label class="btn btn-navy tp_loc_li" for="gn_8">서초구</label></li>
                  <li class="tp_li"><input type="radio" name="gn" id="gn_9" value="강남구">
                  <label class="btn btn-navy tp_loc_li" for="gn_9">강남구</label></li>
                  <li class="tp_li"><input type="radio" name="gn" id="gn_10" value="송파구">
                  <label class="btn btn-navy tp_loc_li" for="gn_10">송파구</label></li>
                  <li class="tp_li"><input type="radio" name="gn" id="gn_11" value="강동구">
                  <label class="btn btn-navy tp_loc_li" for="gn_11">강동구</label></li>
            </ul>
            
         </div>
         <div class="text-center tp_loc gangbuk_d">
         <!-- 4. 강북지역 그룹 -->
            <ul class="tp_ul gb_ul">
               <li class="tp_li"><input type="radio" name="gb" id="gb_1" value="마포구">
               <label class="btn btn-navy tp_loc_li" for="gb_1">마포구</label></li>
               <li class="tp_li"><input type="radio" name="gb" id="gb_2" value="서대문구">
               <label class="btn btn-navy tp_loc_li" for="gb_2">서대문구</label></li>
               <li class="tp_li"><input type="radio" name="gb" id="gb_3" value="은평구">
               <label class="btn btn-navy tp_loc_li" for="gb_3">은평구</label></li>
               <li class="tp_li"><input type="radio" name="gb" id="gb_4" value="용산구">
               <label class="btn btn-navy tp_loc_li" for="gb_4">용산구</label></li>
               <li class="tp_li"><input type="radio" name="gb" id="gb_5" value="중구">
               <label class="btn btn-navy tp_loc_li" for="gb_5">중구</label></li>
               <li class="tp_li"><input type="radio" name="gb" id="gb_6" value="종로구">
               <label class="btn btn-navy tp_loc_li" for="gb_6">종로구</label></li>
               <li class="tp_li"><input type="radio" name="gb" id="gb_7" value="성동구">
               <label class="btn btn-navy tp_loc_li" for="gb_7">성동구</label></li>
               
               <li class="tp_li"><input type="radio" name="gb" id="gb_8" value="동대문구">
               <label class="btn btn-navy tp_loc_li" for="gb_8">동대문구</label></li>
               <li class="tp_li"><input type="radio" name="gb" id="gb_9" value="성북구">
               <label class="btn btn-navy tp_loc_li" for="gb_9">성북구</label></li>
               <li class="tp_li"><input type="radio" name="gb" id="gb_10" value="광진구">
               <label class="btn btn-navy tp_loc_li" for="gb_10">광진구</label></li>
               <li class="tp_li"><input type="radio" name="gb" id="gb_11" value="중랑구">
               <label class="btn btn-navy tp_loc_li" for="gb_11">중랑구</label></li>
               <li class="tp_li"><input type="radio" name="gb" id="gb_12" value="노원구">
               <label class="btn btn-navy tp_loc_li" for="gb_12">노원구</label></li>
               <li class="tp_li"><input type="radio" name="gb" id="gb_13" value="강북구">
               <label class="btn btn-navy tp_loc_li" for="gb_13">강북구</label></li>
               <li class="tp_li"><input type="radio" name="gb" id="gb_14" value="도봉구">
               <label class="btn btn-navy tp_loc_li" for="gb_14">도봉구</label></li>
            </ul>
           </div>  
       </div>
      <div class="tp_search">
      <hr style="border:black 1px solid;">
         <input type="button" class="btn btn-pink" id="Sbtn" value="검색하기" >
            <!-- <span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;검색&nbsp; -->
      </div>
            
   </div>
   <div class="row tp_list">
      <div class="tp_dlist_1">
         <c:forEach  var="vo"  items="${list }" varStatus="s">
         <div class="col-sm-6 col-md-4 col-lg-3 mt-4">
                 <div class="card">
                     <a href="#">
                    		<img class="card-img-top tp_dimg" src="${vo.p_img }">
                     </a>
                     <div class="card-block">
                         
                         <h4 class="tp_tname">${vo.p_name }</h4>
                         <div class="tp_locname">
                         <span class="glyphicon glyphicon-map-marker"></span>
                               	 ${vo.p_addr }
                         </div>
                        
                         	<div class="tp_keyword">
                             	#${vo.p_keyword } 
                         	</div>
                         
                      
                     </div>
                     <div class="card-footer">
                         <small>${vo.p_price }</small>
                         <button class="btn btn-secondary float-right btn-sm jjimbtn"><i class="icon-heart">♥찜하기</i></button>
                         <!-- <button class="btn btn-sm jjimbtn"><span class="glyphicon glyphicon-heart">12</span></button> -->
                     </div>
                 </div>
             </div>
            </c:forEach>
         
      </div>
         
     <%--  <div class="tp_dlist_2">
         <c:forEach begin="1" end="4">
         <div class="col-sm-6 col-md-4 col-lg-3 mt-4">
                 <div class="card">
                     <a href="#"><img class="card-img-top tp_dimg" src="https://d2jx8pbs1t0zq8.cloudfront.net/v2/czM6Ly9iZXR3ZWVuZGF0ZS1qcC8zajdxQVRfNGdqNWY4X3Jfby5qcGVn/r:775:581/">
                     </a>
                     <div class="card-block">
                         
                         <h4 class="tp_tname">쭈꾸쭈꾸쭈꾸미</h4>
                         <div class="tp_locname">
                         <span class="glyphicon glyphicon-map-marker"></span>
                                	서울시 강동구 천호동
                         </div>
                         <div class="tp_keyword">
                             #기분내기 #힐링 #친절한  
                         </div>
                      
                     </div>
                     <div class="card-footer">
                         <small>1만원 ~ 2만원</small>
                         <button class="btn btn-secondary float-right btn-sm jjimbtn"><span class="glyphicon glyphicon-heart">12</span></button>
                         <!-- <button class="btn btn-sm jjimbtn"><span class="glyphicon glyphicon-heart">12</span></button> -->
                     </div>
                 </div>
             </div>
            </c:forEach>
      </div> --%>
      <div class="text-center">
         <ul class="pagination">
         	<li><a href="p_list.do?page=${curpage>=0?curpage-1:curpage }" aria-label="Previous"><span aria-hidden="true">이전</span></a></li>
         	<c:forEach var="i" begin="1" end="10">
             <li class=""><a href="p_list.do?page=${i }">${i } <span class="sr-only">(current)</span></a></li>
             </c:forEach>
              <li><a href="p_list.do?page=${curpage<totalpage?curpage+1:curpage }" aria-label="Previous"><span aria-hidden="true">다음</span></a></li>
           </ul>
      </div>
   </div>


   
</div>
</body>
</html>