<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="css/bootstrap.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- tmap api -->
<script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=0304a3e0-f179-4829-b0c3-640939934bc7"></script>

<style type="text/css">
.title {
   display: inline;
   font-weight: bold;
}
#sel {
   width: 100px;
   display: inline;
   font-size: 20px;
   height: 40px;
}
#check_region{
   margin: 0px auto;
}
.reg_btn{
   width: 100px;
   border-radius: 50px;
   background: #000;
   color: #fff;
   opacity: 0.3;
   padding: 10px 20px;
   font-weight: bold;
   font-size: 16px;
   border: none;
   margin: 10px;
}
.key_btn{
   border-radius: 50px;
   background: #000;
   opacity: 0.3;
   color: #fff;
   padding: 5px 10px;
   font-size: 15px;
   border: none;
   margin: 8px;
}
.reg_btn:focus, .key_btn:focus, .search_btn:focus {
   outline: none;
}
#check_word{
   margin-top: 30px;
}
.keyword {
   margin-top: 10px;
   min-height: 120px;
}
.main_title {
   font-weight: bold;
   margin-top: 40px;
   margin-bottom: 20px;
}
.main_title_wrap {
   margin-bottom: 20px;
}

.search_btn{
   border-radius: 10px;
   background: #F3ABBA;
   color: #fff;
   padding: 10px 20px;
   font-weight: bold;
   font-size: 18px;
   border: none;
   margin: 10px;
}
.search_wrap {
   margin-bottom: 100px;
}
.check_wrap {
}
</style>
<script type="text/javascript">
$(function() {
	

	
   //select바뀔 때 설정
   var reg = [["은평구", "마포구", "서대문구", "종로구", "용산구", "중&nbsp;&nbsp;&nbsp;구", "성동구"],
              ["동대문구", "광진구", "중랑구", "성북구", "노원구", "도봉구", "강북구"]]
   for(var i=0; i<2; i++) {
      for(var j=0; j<reg[i].length; j++){
         $("#reg_wrap_" + i +"_" + j).html("<input type='submit' value='" + reg[i][j]  + "' class='reg_btn sel_btn' name='reg_" + i +"_" + j + "' id='reg_" + i +"_" + j + "'>");
      }
   }
   $("#sel").change(function() {
      var select = $("#sel option:selected").val();
      if(select == "강북") {
         reg = [["은평구", "마포구", "서대문구", "종로구", "용산구", "중구", "성동구"],
                    ["동대문구", "광진구", "중랑구", "성북구", "노원구", "도봉구", "중구"]];
      } else {
         reg = [["강서구", "양천구", "영등포구", "구로구", "동작구", "금천구", "관악구"],
                    ["서초구", "강남구", "송파구", "강동구"]];
      }
      for(var i=0; i<2; i++) {
         
         for(var j=0; j<14; j++){
            if(j < reg[i].length) {
               $("#reg_wrap_" + i +"_" + j).html("<input type='submit' value='" + reg[i][j]  + "' class='reg_btn sel_btn' name='reg_" + i +"_" + j + "' id='reg_" + i +"_" + j + "'>");
            } else {
               $("#reg_wrap_" + i +"_" + j).html("");
            }
         }
      }
   });

  
   
   //구 클릭시 키워드 바꾸기
   var gulist = "";
   $(document).on("click",".reg_btn",function(){
	   gulist = "";
	   var btn_bc = $(this).css("background-color");
	   if(btn_bc == "rgb(0, 0, 0)") {
	       $(this).css("background", "rgb(243, 171, 186)");
	       $(this).css("opacity", "1");
		   gulist = $(this).attr("value");
		   
		   for(var i=0; i<2; i++) {
			   for(var j=0; j<reg[i].length; j++) {
				   var btn_id = $("#reg_" + i + "_" + j);
				   if($(this).attr("id") != btn_id.attr("id")){
					   if(btn_id.css("background-color") == "rgb(243, 171, 186)") {   // 선택 해제 => 선택
						   gulist = gulist  + "|" + btn_id.attr("value");
					   }
				   }
			   }
		   }
		   $("#gu_hidden").html("<input type='hidden' name='gulist' value='"+ gulist +"'>");
	   } else {
	       $(this).css("background", "rgb(0, 0, 0)");
	       $(this).css("opacity", "0.3");
		   for(var i=0; i<2; i++) {
			   for(var j=0; j<reg[i].length; j++) {
				   var btn_id = $("#reg_" + i + "_" + j);
				   if($(this).attr("id") != btn_id.attr("id")){
					   if(btn_id.css("background-color") == "rgb(243, 171, 186)") {   // 선택 해제 => 선택
						   gulist = gulist + btn_id.attr("value")  + "|";
					   }
				   }
			   }
		   }
		   $("#gu_hidden").html("<input type='hidden' name='gulist' value='"+ gulist +"'>");
	   }
	   showkey(gulist, "f");
	   showkey(gulist, "c");
	   showkey(gulist, "p");
   });
   
   var showkey = function showkey(gulist, key) {
		$.ajax({
			type : "POST",
			url : "getkeyword.do",
			data : {
				"gulist" : gulist,
				"key" : key
			},
			success : function(res) {
				$("#keyword_" + key).html(res);
			}
		});
	}
   
});



</script>
</head>
<body>
   <div class="container">
   
      <div class="main_title_wrap">
         <h1 class="main_title">데이트 코스</h1>
      </div>
      
      <div class="check_wrap">
      <h2 class="title">지역</h2>&nbsp;&nbsp;&nbsp; 
      <select class="form-control" id="sel">
         <option value="강북">강북</option>
         <option value="강남">강남</option>
      </select>
      <div id="check_region">
         <table width="100%">
            <c:forEach var="i" begin="0" end="1">
               <tr>
               <c:forEach var="j" begin="0" end="6">
                  <td>
                     <div id="reg_wrap_${i }_${j}">
                        <!-- 강남 / 강북 구 보여주기 -->
                     </div>
                  </td>
               </c:forEach>
               </tr>
            </c:forEach>
         </table>
      </div>
      <hr>
      
      <div id="check_word">
         <table width="100%">
         	<tr>
         		<td width=33%>
                  <h2 class="title">맛집</h2>
         		</td>
         		<td width=33%>
                  <h2 class="title">카페</h2>
         		</td>
         		<td width=33%>
                  <h2 class="title">놀거리</h2>
         		</td>
         	</tr>
            <tr>
               <td width=33% valign="top">
                  <div id="keyword_f" class="keyword"></div>
               </td>
               <td width=33% valign="top">
                  <div id="keyword_c" class="keyword"></div>
               </td>
               <td width=33% valign="top">
                  <div id="keyword_p" class="keyword"></div>
               </td>
            </tr>
         </table>
      </div>
      </div>
      <form action="course_search_ok.do" method="post">
	      <div class="search_wrap">
	      	  <div id="gu_hidden"></div>
	      	  <div id="key_hidden"></div>
	         <center>
	         <input type="submit" value=' 검   색 ' class="search_btn">
	         </center>
	      </div>
      </form>
   </div>
    <div>
		<jsp:include page="date2.jsp"></jsp:include>
   	</div>
     
   
</body>
</html>