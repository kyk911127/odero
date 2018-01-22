<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

 

<!-- �̹��������̵�  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> <!-- �浹 -->

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
      
      if(S=="�̻�/ü��" || S=="����/ī��")
      {
         if(S=="�̻�/ü��")
         {
            $('#food').css("background", "rgb(203, 203, 203)");
            $(this).css("background", "rgb(3, 32, 95)");
            $(this).css("color","white");
            
         }
         else if(S=="����/ī��")
         {
            $('#play').css("background", "rgb(203, 203, 203)");
            $(this).css("background", "rgb(3, 32, 95)");
            $(this).css("color","white");
            
         }
      }
      
      else if(S=="����" || S=="����")
      {
         if(S=="����")
         {
            $('#gangbuk').css("background", "rgb(203, 203, 203)");
            $(this).css("background", "rgb(3, 32, 95)");
            $(this).css("color","white");
            $('.gangbuk_d').hide();
            $('.loc_pick').show();
            $('.gangnam_d').show();
            
         }
         else if(S=="����")
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
        <img src="#" alt="Best ��Ÿ�" style="width:100%; height:100%;">
           <ol class="tp_imgol">
              <li class="tp_imgloc">����� ������ õȣ��</li>
              <li class="tp_imgname">"�޲��޲��޲ٹ�"</li>
           </ol>
      </div>

      <div class="item tp_slideimg">
        <img src="img/la.jpg" alt="Best ����" style="width:100%; height:100%;">
        <ol class="tp_imgol">
              <li class="tp_imgloc">����� ������ ������</li>
              <li class="tp_imgname">"���л���"</li>
           </ol>
      </div>
    
      <div class="item tp_slideimg">
        <img src="" alt="Best ī��" style="width:100%; height:100%;">
        <ol class="tp_imgol">
              <li class="tp_imgloc">����� ������ ���ﵿ</li>
              <li class="tp_imgname">"���������ϴ�����"</li>
           </ol>
      </div>
    </div>
  </div>
</div>


<div class="container tp_list">
   <div class="row">
      <div class="text-center tp_select">
       <p>
          <label>&nbsp;&nbsp;ī�װ�</label>
       </p>
         <ul class="tp_ul">
            <li class="tp_li play_li"><input type="button" class="btn btn-lg btn-navy" id="play" value="�̻�/ü��"></li>
            <li class="tp_li"><input type="button" class="btn btn-lg btn-navy" id="food" value="����/ī��"></li>
            
         </ul>
      </div>
      <hr>
       <div class="text-center tp_select">
       <p>
          <label>&nbsp;&nbsp;����</label>
       </p>
         <ul class="tp_ul">
            <li class="tp_li gangnam_li"><input type="button" class="btn btn-lg btn-navy" id="gangnam" value="����"></li>
            <li class="tp_li"><input type="button" class="btn btn-lg btn-navy" id="gangbuk" value="����"></li>
         </ul>
      </div>
      <div class="loc_pick">
         <div class="text-center tp_loc gangnam_d">
            <ul class="tp_ul">
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gn" value="������"></li>
                  <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gn" value="���α�"></li>
                  <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gn" value="��õ��"></li>
                  <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gn" value="��õ��"></li>
                  <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gn" value="��������"></li>
                  <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gn" value="���Ǳ�"></li>
                  <br>
                  <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gn" value="���۱�"></li>
                  <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gn" value="���ʱ�"></li>
                  <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gn" value="������"></li>
                  <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gn" value="���ı�"></li>
                  <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gn" value="������"></li>
               
            </ul>
         </div>
         <div class="text-center tp_loc gangbuk_d">
            <ul class="tp_ul">
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="������"></li>
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="���빮��"></li>
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="����"></li>
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="��걸"></li>
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="�߱�"></li>
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="���α�"></li>
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="������"></li>
               
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="���빮��"></li>
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="���ϱ�"></li>
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="������"></li>
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="�߶���"></li>
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="�����"></li>
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="���ϱ�"></li>
               <li class="tp_li"><input type="button" class="btn btn-navy tp_loc_li" id="gb" value="������"></li>
            
            </ul>
           </div>  
       </div>
      <div class="tp_search">
      <hr style="border:black 1px solid;">
         <input type="button" class="btn btn-pink" id="Sbtn" value="�˻��ϱ�" >
            <!-- <span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;�˻�&nbsp; -->
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
                         
                         <h4 class="tp_tname">�޲��޲��޲ٹ�</h4>
                         <div class="tp_locname">
                         <span class="glyphicon glyphicon-map-marker"></span>
                               	 ����� ������ õȣ��
                         </div>
                         <div class="tp_keyword">
                             #��г��� #���� #ģ����  
                         </div>
                      
                     </div>
                     <div class="card-footer">
                         <small>1���� ~ 2����</small>
                         <button class="btn btn-secondary float-right btn-sm jjimbtn"><i class="icon-heart">�����ϱ�</i></button>
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
                         
                         <h4 class="tp_tname">�޲��޲��޲ٹ�</h4>
                         <div class="tp_locname">
                         <span class="glyphicon glyphicon-map-marker"></span>
                                	����� ������ õȣ��
                         </div>
                         <div class="tp_keyword">
                             #��г��� #���� #ģ����  
                         </div>
                      
                     </div>
                     <div class="card-footer">
                         <small>1���� ~ 2����</small>
                         <button class="btn btn-secondary float-right btn-sm jjimbtn"><span class="glyphicon glyphicon-heart">12</span></button>
                         <!-- <button class="btn btn-sm jjimbtn"><span class="glyphicon glyphicon-heart">12</span></button> -->
                     </div>
                 </div>
             </div>
            </c:forEach>
      </div>
      <div class="text-center">
         <ul class="pagination">
         	<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">����</span></a></li>
         	<c:forEach var="i" begin="1" end="10">
             <li class=""><a href="#">${i } <span class="sr-only">(current)</span></a></li>
             </c:forEach>
              <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">����</span></a></li>
           </ul>
      </div>
   </div>


   
</div>
</body>
</html>