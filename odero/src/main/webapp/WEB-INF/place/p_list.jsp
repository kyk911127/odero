<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

 
<!-- 이미지슬라이드  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> <!-- 충돌 -->

<style type="text/css">

.row{
   margin: 0px; auto;
   height:auto;
   border:1px solid black;
}
.tp_slideimg
{
   height:400px;
   border:1px solid black;
}
.tp_list{
   
   margin-top: 100px;
   margin-bottom: 100px;
}
.tp_select{
   
   height: auto;
   border:1px solid black;
   
}
.tp_imgol{
   position: absolute;
    bottom: 10px;
    left: 80%;
    z-index: 15;
    width: 50%;
    padding-left: 0;
    text-align: right;
    list-style: none;
    border:1px solid black;
}
.tp_imgloc{
   color:black;
   left: 50%;
}
.tp_imgname{
   color:black;
   left: 50%;
}
.tp_ul{
   list-style:none;
   hight: auto;
}

.tp_li{
   display: inline;
}
.play_li{
   margin-right: 2%;
}
.gangnam_li{
   margin-right: 2%;   
}
.loc_pick{
   width: auto;
   height: 200px;
   border: 1px solid black;
   
}
.tp_loc{
   width: 20% auto;
   margin:0px; auto;
   text-align: center;
}

.tp_loc_li{
   margin:2%;
}
.tp_search{
   text-align: center;
   overflow:hidden;
    height:auto;
    margin-bottom:2%;
    border: 1px solid white;  
}

.tp_list{
   padding: 2%;
}
.tp_dlist_1 {
   padding:2%;
   overflow:hidden;
    height:auto;
    width:auto;
   border:1px solid black;
}

.tp_dlist_2{
   padding:2%;
   overflow:hidden;
    height:auto;
    width:auto;
   border:1px solid black;
}

.tp_dimg{
   width:100%; 
   height:100%;
}
.card {
    font-size: 1em;
    overflow: hidden;
    padding: 0;
    border: none;
    border-radius: .28571429rem;
    box-shadow: 0 1px 3px 0 #d4d4d5, 0 0 0 1px #d4d4d5;
}
.card-block {
    font-size: 1em;
    position: relative;
    margin: 0;
    padding: 1em;
    border: none;
    border-top: 1px solid rgba(34, 36, 38, .1);
    box-shadow: none;
}
.card-footer {
    font-size: 1em;
    position: static;
    top: 0;
    left: 0;
    max-width: 100%;
    padding: .75em 1em;
    color: rgba(0, 0, 0, .4);
    border-top: 1px solid rgba(0, 0, 0, .05) !important;
    background: #fff;
    
    
}
.tp_tname {
    display: inline-block;
    margin-left: 4px;
    vertical-align: top;
    font-weight: bold;
}
.tp_locname {
    font-size: 1em;
    color: rgba(0, 0, 0, .68);
}
.tp_keyword {
   font-size: 0.9em;
    color: rgba(0, 0, 0, .4);
    /* padding-left:12%; */
    padding:5%;
}
.tp_price{
   font-size: 0.9em;
    color: rgba(0, 0, 0, .4);
    margin:0px;
   
}
.jjimbtn{
   float:right;
   line-height: 5%;
}

.btn-navy{
   background-color: rgb(203, 203, 203);
   color: white;   
}
.btn-navy:hover{
   color: white;
   font-weight:bold;
}
.btn-pink{
   background-color:#F3ABBA;
   color: white;
}
.btn-pink:hover{
   color: white;
   font-weight:bold;
}
.btn-pink:active{
   color: white;
}
</style>

<script type="text/javascript">
$(function(){
   
   $('.loc_pick').hide();
   $('.gangnam_d').hide();
   $('.gangbuk_d').hide();
   
   $('.btn-navy').click(function(){
      
      var S=$(this).attr("value"); 
      
      if(S=="이색/체험" || S=="맛집/카페")
      {
         if(S=="이색/체험")
         {
            $('#food').css("background", "rgb(203, 203, 203)");
            $(this).css("background", "rgb(3, 32, 95)");
            $(this).css("color","white");
            
         }
         else if(S=="맛집/카페")
         {
            $('#play').css("background", "rgb(203, 203, 203)");
            $(this).css("background", "rgb(3, 32, 95)");
            $(this).css("color","white");
            
         }
      }
      
      else if(S=="강남" || S=="강북")
      {
         if(S=="강남")
         {
            $('#gangbuk').css("background", "rgb(203, 203, 203)");
            $(this).css("background", "rgb(3, 32, 95)");
            $(this).css("color","white");
            $('.gangbuk_d').hide();
            $('.loc_pick').show();
            $('.gangnam_d').show();
            
         }
         else if(S=="강북")
         {
            $('#gangnam').css("background", "rgb(203, 203, 203)");
            $(this).css("background", "rgb(3, 32, 95)");
            $(this).css("color","white");
            $('.gangnam_d').hide();
            $('.loc_pick').show();
            $('.gangbuk_d').show();
            
         }
      }
      else
      {
        var gn_size=$(".gangnam_d >.tp_ul > li").length;
        var gb_size=$(".gangbuk_d>.tp_ul > li").length;
        var str='';
        
        for(var i=0; i<gn_size; i++)
        {
           str=$("input[id=gn]:eq("+i+")").val();
           if(S==str)
           {
              $("input[id=gn]").css("background", "rgb(203, 203, 203)");
              $(this).css("background", "rgb(3, 32, 95)");
              $(this).css("color","white");
             
           }
        }
         for(var i=0; i<gb_size; i++)
         {
           str=$("input[id=gb]:eq("+i+")").val();
           if(S==str)
            {
              $("input[id=gb]").css("background", "rgb(203, 203, 203)");
              $(this).css("background", "rgb(3, 32, 95)");
              $(this).css("color","white");
            }  
         } 
      }
   });
   
   
   
   $('#Sbtn').click(function(){
      $('.btn-navy').css("background", "rgb(203, 203, 203)");
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
         <ul class="tp_ul">
            <li class="tp_li play_li"><input type="button" class="btn btn-lg btn-navy" id="play" value="이색/체험"></li>
            <li class="tp_li"><input type="button" class="btn btn-lg btn-navy" id="food" value="맛집/카페"></li>
            
         </ul>
      </div>
      <hr>
       <div class="text-center tp_select">
       <p>
          <label>&nbsp;&nbsp;지역</label>
       </p>
         <ul class="tp_ul">
            <li class="tp_li gangnam_li"><input type="button" class="btn btn-lg btn-navy" id="gangnam" value="강남"></li>
            <li class="tp_li"><input type="button" class="btn btn-lg btn-navy" id="gangbuk" value="강북"></li>
         </ul>
      </div>
      <div class="loc_pick">
         <div class="text-center tp_loc gangnam_d">
            <ul class="tp_ul">
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gn" value="강서구"></li>
                  <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gn" value="구로구"></li>
                  <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gn" value="양천구"></li>
                  <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gn" value="금천구"></li>
                  <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gn" value="영등포구"></li>
                  <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gn" value="관악구"></li>
                  <br>
                  <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gn" value="동작구"></li>
                  <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gn" value="서초구"></li>
                  <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gn" value="강남구"></li>
                  <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gn" value="송파구"></li>
                  <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gn" value="강동구"></li>
               
            </ul>
         </div>
         <div class="text-center tp_loc gangbuk_d">
            <ul class="tp_ul">
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="마포구"></li>
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="서대문구"></li>
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="은평구"></li>
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="용산구"></li>
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="중구"></li>
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="종로구"></li>
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="성동구"></li>
               
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="동대문구"></li>
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="성북구"></li>
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="광진구"></li>
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="중랑구"></li>
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="노원구"></li>
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="강북구"></li>
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="도봉구"></li>
            
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
                         <button class="btn btn-secondary float-right btn-sm jjimbtn"><i class="icon-heart">♥찜하기</i></button>
                         <!-- <button class="btn btn-sm jjimbtn"><span class="glyphicon glyphicon-heart">12</span></button> -->
                     </div>
                 </div>
             </div>
            </c:forEach>
         
      </div>
         
      <div class="tp_dlist_2">
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
      </div>
      <div class="text-center">
         <ul class="pagination">
         	<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">이전</span></a></li>
         	<c:forEach var="i" begin="1" end="10">
             <li class=""><a href="#">${i } <span class="sr-only">(current)</span></a></li>
             </c:forEach>
              <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">다음</span></a></li>
           </ul>
      </div>
   </div>


   
</div>
</body>
</html>