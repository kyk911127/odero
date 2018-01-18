<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
	
	initTmap();
	
   //select�ٲ� �� ����
   var reg = [["����", "������", "���빮��", "���α�", "��걸", "��&nbsp;&nbsp;&nbsp;��", "������"],
              ["���빮��", "������", "�߶���", "���ϱ�", "�����", "������", "���ϱ�"]]
   for(var i=0; i<2; i++) {
      for(var j=0; j<reg[i].length; j++){
         $("#reg_wrap_" + i +"_" + j).html("<input type='submit' value='" + reg[i][j]  + "' class='reg_btn sel_btn' name='reg_" + i +"_" + j + "'>");
      }
   }
   $("#sel").change(function() {
      var select = $("#sel option:selected").val();
      if(select == "����") {
         reg = [["����", "������", "���빮��", "���α�", "��걸", "�߱�", "������"],
                    ["���빮��", "������", "�߶���", "���ϱ�", "�����", "������", "�߱�"]];
      } else {
         reg = [["������", "��õ��", "��������", "���α�", "���۱�", "��õ��", "���Ǳ�"],
                    ["���ʱ�", "������", "���ı�", "������"]];
      }
      for(var i=0; i<2; i++) {
         
         for(var j=0; j<14; j++){
            if(j < reg[i].length) {
               $("#reg_wrap_" + i +"_" + j).html("<input type='submit' value='" + reg[i][j]  + "' class='reg_btn sel_btn' name='reg_" + i +"_" + j + "'>");
            } else {
               $("#reg_wrap_" + i +"_" + j).html("");
            }
         }
      }
   });

   //������ �� ���������� �� ��� �ٲٱ� => �������� �߰��� �±׿��� �Ϲ����� �̺�Ʈ�� �������� ����
   $(document).on("click",".sel_btn",function(){
      var btn_bc = $(this).css("background-color");
      if(btn_bc == "rgb(0, 0, 0)") {   // ���� ���� => ����
         $(this).css("background", "rgb(243, 171, 186)");
         $(this).css("opacity", "1");
      } else {                     // ���� => ���� ����
         $(this).css("background", "rgb(0, 0, 0)");
         $(this).css("opacity", "0.3");
      }
   });
   
});

function initTmap(){
	var map = new Tmap.Map({
		div:'map_div',
		width : "100%",
		height : "550px",
	});
	map.setCenter(new Tmap.LonLat("126.986072", "37.570028").transform("EPSG:4326", "EPSG:3857"), 15);
} 

</script>
</head>
<body>
   <div class="container">
   
      <div class="main_title_wrap">
         <h1 class="main_title">����Ʈ �ڽ�</h1>
      </div>
      
      <div class="check_wrap">
      <h2 class="title">����</h2>&nbsp;&nbsp;&nbsp; 
      <select class="form-control" id="sel">
         <option value="����">����</option>
         <option value="����">����</option>
      </select>
      <div id="check_region">
         <table width="100%">
            <c:forEach var="i" begin="0" end="1">
               <tr>
               <c:forEach var="j" begin="0" end="6">
                  <td>
                     <div id="reg_wrap_${i }_${j}">
                        <!-- ���� / ���� �� �����ֱ� -->
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
                  <h2 class="title">����</h2>
                  <div id="keyword_1" class="keyword">
                     <table>
                        <c:forEach var="i" begin="1" end="2">
                              <tr>
                              <c:forEach var="j" begin="1" end="4">
                                 <td>
                                    <input type="submit" value="ģ����" class="key_btn sel_btn" name="k1_${i }_${j }">
                                 </td>
                              </c:forEach>
                           </tr>
                        </c:forEach>
                     </table>
                  </div>
               </td>
               <td width=33%>
                  <h2 class="title">ī��</h2>
                  <div id="keyword_2" class="keyword">
                     <table>
                        <c:forEach var="i" begin="1" end="1">
                           <tr>
                           <c:forEach var="j" begin="1" end="4">
                              <td>
                                 <input type="submit" value="�޽��ϱ�" class="key_btn sel_btn" name="k2_${i }_${j }">
                              </td>
                           </c:forEach>
                           </tr>
                        </c:forEach>
                     </table>
                  </div>
               </td>
               <td width=33%>
                  <h2 class="title">��Ÿ�</h2>
                  <div id="keyword_3" class="keyword">
                     <table>
                        <c:forEach var="i" begin="1" end="2">
                           <tr>
                           <c:forEach var="j" begin="1" end="4">
                              <td>
                                 <input type="submit" value="�����ȯ" class="key_btn sel_btn" name="k3_${i }_${j }">
                              </td>
                           </c:forEach>
                           </tr>
                        </c:forEach>
                     </table>
                  </div>
               </td>
            </tr>
         </table>
      </div>
      </div>
      <div class="search_wrap">
         <center>
         <input type="submit" value=' ��   �� ' class="search_btn">
         </center>
      </div>
   </div>
    <div>
		<jsp:include page="date2.jsp"></jsp:include>
   	</div>
     
   
</body>
</html>