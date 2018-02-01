<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
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
var curpage=1;
var totalpage=0;

var s_curpage=1;
var s_totalpage=0;


$(function(){
   
	
   $('.loc_pick').hide();
   $('.gangnam_d').hide();
   $('.gangbuk_d').hide();
   $('#pg').html(
		   '<ul class="pagination">'
			+'<li><span aria-hidden="true" class="btn btn-sm btn-info" id="prev">이전</span></li>'
			+'<li><span aria-hidden="true" class="btn btn-sm btn-info" id="next">다음</span></li>'
		   +'</ul>'	   
   );
   $.ajax({
       type:"POST",
       url:"s_list_start.do",
       dataType:'json',
       success: function(response){
      	   var data="";
      	   curpage=response[0].p_curpage;
      	   totalpage=response[0].p_totalpage;
      	   for(i=0;i<response.length;i++)
      		{
      		   data+='<div class="col-sm-6 col-md-4 col-lg-3 mt-4">'
                    +'<div class="card">'
                    +'<a href="p_detail.do?p_no='+response[i].p_no+'">'
                    +'<img class="card-img-top tp_dimg" src="'+response[i].p_img+'">'
                    +'</a>'
                    +'<div class="card-block">'
                    +'<h4 class="tp_tname">'+response[i].p_name +'</h4>'
                    +'<div class="tp_locname">'
                    +'<span class="glyphicon glyphicon-map-marker"></span>'
		               +response[i].p_addr
		             +'</div>'
		             +'<div class="tp_keyword">'
		                 +response[i].p_keyword
		             +'</div>'
		             +'</div>'
		             +'<div class="card-footer">'
		             +'<small>'+response[i].p_price+'</small>'
		             +'<button class="btn btn-secondary float-right btn-sm jjimbtn"><i class="icon-heart">♥찜하기</i></button>'
		             +'</div>'
		             +'</div>'
		             +'</div>'
		             
      			} 
      	   
          $('#tp').html(data);
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
       }
   });
   
   $('#prev').click(function(){
	   
	   curpage=(curpage>1?curpage-1:curpage);
	   
	   $.ajax({
	       type:"POST",
	       url:"s_list_start.do",
	       data:{"page":curpage},
	       dataType:'json',
	       success: function(response){
	      	   var data="";
	      	   var page="";
	      	   curpage=response[0].p_curpage;
	      	   totalpage=response[0].p_totalpage;
	      	   for(i=0;i<response.length;i++)
	      		{
	      		   data+='<div class="col-sm-6 col-md-4 col-lg-3 mt-4">'
	                    +'<div class="card">'
	                    +'<a href="p_detail.do?p_no='+response[i].p_no+'">'
	                    +'<img class="card-img-top tp_dimg" src="'+response[i].p_img+'">'
	                    +'</a>'
	                    +'<div class="card-block">'
	                    +'<h4 class="tp_tname">'+response[i].p_name +'</h4>'
	                    +'<div class="tp_locname">'
	                    +'<span class="glyphicon glyphicon-map-marker"></span>'
			               +response[i].p_addr
			             +'</div>'
			             +'<div class="tp_keyword">'
			                 +response[i].p_keyword
			             +'</div>'
			             +'</div>'
			             +'<div class="card-footer">'
			             +'<small>'+response[i].p_price+'</small>'
			             +'<button class="btn btn-secondary float-right btn-sm jjimbtn"><i class="icon-heart">♥찜하기</i></button>'
			             +'</div>'
			             +'</div>'
			             +'</div>'
			             
	      			}
	      	
	      	   
	          $('#tp').html(data);
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
	       }
   });
   });
   
   $('#next').click(function(){
	   curpage=(curpage<totalpage?curpage+1:curpage);
	  
	   $.ajax({
	       type:"POST",
	       url:"s_list_start.do",
	       data:{"page":curpage},
	       dataType:'json',
	       success: function(response){
	      	   var data="";
	      	 
	      	   curpage=response[0].p_curpage;
	      	   totalpage=response[0].p_totalpage;
	      	   for(i=0;i<response.length;i++)
	      		{
	      		   data+='<div class="col-sm-6 col-md-4 col-lg-3 mt-4">'
	                    +'<div class="card">'
	                    +'<a href="p_detail.do?p_no='+response[i].p_no+'">'
	                    +'<img class="card-img-top tp_dimg" src="'+response[i].p_img+'">'
	                    +'</a>'
	                    +'<div class="card-block">'
	                    +'<h4 class="tp_tname">'+response[i].p_name +'</h4>'
	                    +'<div class="tp_locname">'
	                    +'<span class="glyphicon glyphicon-map-marker"></span>'
			               +response[i].p_addr
			             +'</div>'
			             +'<div class="tp_keyword">'
			                 +response[i].p_keyword
			             +'</div>'
			             +'</div>'
			             +'<div class="card-footer">'
			             +'<small>'+response[i].p_price+'</small>'
			             +'<button class="btn btn-secondary float-right btn-sm jjimbtn"><i class="icon-heart">♥찜하기</i></button>'
			             +'</div>'
			             +'</div>'
			             +'</div>'
			             
	      			}
	          $('#tp').html(data);
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
	       }
   });
   });
   
   
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
   
  
 //////////검색
   $('#Sbtn').click(function(){
	   
	   $('#pg').html(
			   '<ul class="pagination">'
				+'<li><span aria-hidden="true" class="btn btn-sm btn-info" onclick="prev_click()">이전</span></li>'
				+'<li><span aria-hidden="true" class="btn btn-sm btn-info" onclick="next_click()">다음</span></li>'
			   +'</ul>'	   
	   );
     
      var arr_sn=[];
      var sn_1=$("input[type=radio][name=ca]:checked").val();
      var sn_2=$("input[type=radio][name=loc]:checked").val();
      var sn_3="";
      
      if(sn_1==null)
    	  {
    	  	alert("카테고리를 선택하세요");
    	  	return;
    	  }
      
      else if(sn_2==null)
    	  {
    	   	alert("지역을 선택하세요");
    	   	return;
    	  }
      else
    	  {
    	  	  arr_sn.push(sn_1);
    	  		
	    	  if(sn_2=="강남")
	    	  {
	    	  		sn_3=$("input[type=radio][name=gn]:checked").val();
	    	  		if(sn_3==null)
	    	  			{
	    	  			 	alert("구를 선택하세요!");
	    	  			 	return;
	    	  			}
	    	  }
	      
	     	 if(sn_2=="강북")
	    	  {
	    	 		 sn_3=$("input[type=radio][name=gb]:checked").val();
		    	  		if(sn_3==null)
	    	  			{
	    	  			 	alert("구를 선택하세요!");
	    	  			 	return;
	    	  			}
	    	  }
	     	
	   
		     arr_sn.push(sn_3); 
		     //alert("최종: "+arr_sn);
		     
		         $.ajax({
		             type:"POST",
		             url:"s_list.do",
		             data : {"sn_1":sn_1,"sn_3":sn_3},
		             dataType:'json',
		             success: function(response){
		            	   var data="";
		            	   s_curpage=response[0].p_curpage;
		                 s_totalpage=response[0].p_totalpage;
		            	   for(i=0;i<response.length;i++)
		            		{
		            		    data+='<div class="col-lg-3">'
		                          +'<div class="card">'
		                          +'<a href="p_detail.do?p_no='+response[i].p_no+'">'
		                          +'<img class="card-img-top tp_dimg" src="'+response[i].p_img+'">'
		                          +'</a>'
		                          +'<div class="card-block">'
		                          +'<h4 class="tp_tname">'+response[i].p_name +'</h4>'
		                          +'<div class="tp_locname">'
		                          +'<span class="glyphicon glyphicon-map-marker"></span>'
		      		               +response[i].p_addr
		      		             +'</div>'
		      		             +'<div class="tp_keyword">'
		      		                 +response[i].p_keyword
		      		             +'</div>'
		      		             +'</div>'
		      		             +'<div class="card-footer">'
		      		             +'<small>'+response[i].p_price+'</small>'
		      		             +'<button class="btn btn-secondary float-right btn-sm jjimbtn"><i class="icon-heart">♥찜하기</i></button>'
		      		             +'</div>'
		      		             +'</div>'
		      		             +'</div>'
		      		             
		            		}
		                $('#tp').html(data);
		             }
		             });
    	  }
    
     /*  //버튼 초기화
     $('.btn-navy').css("background", "rgb(203, 203, 203)");
      $("input:radio").prop("checked",false);
      $('.loc_pick').hide();
      $('.gangnam_d').hide();
      $('.gangbuk_d').hide(); */
      
   });
  
});


function prev_click()
{
		var sn_1=$("input[type=radio][name=ca]:checked").val();
		var sn_2=$("input[type=radio][name=loc]:checked").val();
		var sn_3="";
		if(sn_2=="강남")
			{
				sn_3=$("input[type=radio][name=gn]:checked").val();
			}
		else
			{
				sn_3=$("input[type=radio][name=gb]:checked").val();
			}
	
	   s_curpage=(s_curpage>1?s_curpage-1:s_curpage);
	   
	   $.ajax({
	       type:"POST",
	       url:"s_list.do",
	       data:{"sn_1":sn_1,"sn_3":sn_3,"page":s_curpage},
	       dataType:'json',
	       success: function(response){
	      	   var data="";
	      	   
	      	   s_curpage=response[0].p_curpage;
	      	   s_totalpage=response[0].p_totalpage;
	      	   for(i=0;i<response.length;i++)
	      		{
	      		   data+='<div class="col-sm-6 col-md-4 col-lg-3 mt-4">'
	                    +'<div class="card">'
	                    +'<a href="p_detail.do?p_no='+response[i].p_no+'">'
	                    +'<img class="card-img-top tp_dimg" src="'+response[i].p_img+'">'
	                    +'</a>'
	                    +'<div class="card-block">'
	                    +'<h4 class="tp_tname">'+response[i].p_name +'</h4>'
	                    +'<div class="tp_locname">'
	                    +'<span class="glyphicon glyphicon-map-marker"></span>'
			               +response[i].p_addr
			             +'</div>'
			             +'<div class="tp_keyword">'
			                 +response[i].p_keyword
			             +'</div>'
			             +'</div>'
			             +'<div class="card-footer">'
			             +'<small>'+response[i].p_price+'</small>'
			             +'<button class="btn btn-secondary float-right btn-sm jjimbtn"><i class="icon-heart">♥찜하기</i></button>'
			             +'</div>'
			             +'</div>'
			             +'</div>'
			             
	      			}
	      	
	      	   
	          $('#tp').html(data);
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
	       }
   });
}
function next_click()
{
		var sn_1=$("input[type=radio][name=ca]:checked").val();
		var sn_2=$("input[type=radio][name=loc]:checked").val();
		var sn_3="";
		if(sn_2=="강남")
			{
				sn_3=$("input[type=radio][name=gn]:checked").val();
			}
		else
			{
				sn_3=$("input[type=radio][name=gb]:checked").val();
			}

	   s_curpage=(s_curpage<s_totalpage?s_curpage+1:s_curpage);
	
		$.ajax({
	       type:"POST",
	       url:"s_list.do",
	       data:{"sn_1":sn_1,"sn_3":sn_3,"page":s_curpage},
	       dataType:'json',
	       success: function(response){
	      	   var data="";
	      	   s_curpage=response[0].p_curpage;
	      	   s_totalpage=response[0].p_totalpage;
	      	   
	      	   for(i=0;i<response.length;i++)
	      		{
	      		   data+='<div class="col-sm-6 col-md-4 col-lg-3 mt-4">'
	                    +'<div class="card">'
	                    +'<a href="p_detail.do?p_no='+response[i].p_no+'">'
	                    +'<img class="card-img-top tp_dimg" src="'+response[i].p_img+'">'
	                    +'</a>'
	                    +'<div class="card-block">'
	                    +'<h4 class="tp_tname">'+response[i].p_name +'</h4>'
	                    +'<div class="tp_locname">'
	                    +'<span class="glyphicon glyphicon-map-marker"></span>'
			               +response[i].p_addr
			             +'</div>'
			             +'<div class="tp_keyword">'
			                 +response[i].p_keyword
			             +'</div>'
			             +'</div>'
			             +'<div class="card-footer">'
			             +'<small>'+response[i].p_price+'</small>'
			             +'<button class="btn btn-secondary float-right btn-sm jjimbtn"><i class="icon-heart">♥찜하기</i></button>'
			             +'</div>'
			             +'</div>'
			             +'</div>'
			             
	      			}
	          $('#tp').html(data);
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
	       }
   });
}

</script>
</head>
<body>
<div class="container-fluid" style="padding-right:0px; padding-left:0px;">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    
    <!-- Wrapper for slides -->
    <div class="carousel-inner ">
      <div class="item active tp_slideimg">
        <img src="p_image/foodhd.jpg" alt="Best 놀거리" style="width:100%; height:100%;">
           <ol class="tp_imgol">
              <li class="tp_imgloc">지역별 놀거리</li>
              <li class="tp_imgname">검색하기</li>
           </ol>
      </div>
	<c:forEach var="vo" items="${list }">
      <div class="item tp_slideimg">
        <img src="${vo.p_img }" alt="Best 맛집" style="width:100%; height:100%;">
        <ol class="tp_imgol">
              <li class="tp_imgloc">${vo.p_addr }</li>
              <li class="tp_imgname">${vo.p_name }</li>
           </ol>
      </div>
    </c:forEach>
      <!-- <div class="item tp_slideimg">
        <img src="" alt="Best 카페" style="width:100%; height:100%;">
        <ol class="tp_imgol">
              <li class="tp_imgloc">서울시 강남구 역삼동</li>
              <li class="tp_imgname">"내가좋아하는피자"</li>
           </ol>
      </div> -->
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
      <div class="tp_dlist_1" id="tp"></div>
      <div class="text-center" id="pg">
	     <!--  <ul class="pagination">
				<li><span aria-hidden="true" class="btn btn-sm btn-info" id="prev">이전</span></li>
				<li><span aria-hidden="true" class="btn btn-sm btn-info" id="next">다음</span></li>
			</ul> -->
      </div>
   </div>


   
</div>
</body>
</html>