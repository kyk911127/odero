<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" href="http://fonts.googleapis.com/earlyaccess/hanna.css">
<link rel="stylesheet" href="https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css">

<link href="css/mypage.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


</head>
<body class="body">
<div class="container">
	<div class="tab_wrap">
	

	<a href="#"><span class="tab" id ="delBtn" onclick="delete_confirm()">�� ����</span></a>
	|
	<a href="mypage_list.do"><span class="tab">���</span></a>

	</div>
		
	
	<%-- c:forEach var="i" begin="1" end="3"> --%>
	<div class="row cart">
	
	<div class="cart_wrap">
	<hr class="soften"><h3 class="sub_text text-left main_text">�ڽ�  ��ü����</h3><hr class="soften">
		<div class="col-lg-3 cart_div">
			<img src="c_image/date1.jpg" class="cart_img">
			<table>
			<tr>
			<th>�ڽ� 1 :&nbsp;</th>
			<td>00 ���</td>
			</tr>
			<tr>
			<th>����̸� :&nbsp;</th>
			<td>$��Ҹ�</td>
			</tr>
			<tr>
			<th>�����ġ :&nbsp;</th>
			<td>00 ���</td>
			</tr>
			<tr>
			<th>����±� :&nbsp;</th>
			<td>#���1 #���2</td>
			</tr>
			<tr>
			<th>��õ�� :&nbsp;</th>
			<td><span class="glyphicon glyphicon-heart-empty">10</span>
			&nbsp;
			<span class="glyphicon glyphicon-thumbs-up">5</span>
			</td>
			</tr>
			</table>
		</div>
		<div class="col-lg-3 cart_div">
			<img src="c_image/res1.jpg" class="cart_img">
			<table>
			<tr>
			<th>�ڽ� 2 :&nbsp;</th>
			<td>00 ���</td>
			</tr>
			<tr>
			<th>����̸� :&nbsp;</th>
			<td>$��Ҹ�</td>
			</tr>
			<tr>
			<th>�����ġ :&nbsp;</th>
			<td>00 ���</td>
			</tr>
			<tr>
			<th>����±� :&nbsp;</th>
			<td>#���1 #���2</td>
			</tr>
			</table>
		</div>
		<div class="col-lg-3 cart_div">
			<img src="c_image/res2.jpg" class="cart_img">
			<table>
			<tr>
			<th>�ڽ� 3 :&nbsp;</th>
			<td>00 ���</td>
			</tr>
			<tr>
			<th>����̸� :&nbsp;</th>
			<td>$��Ҹ�</td>
			</tr>
			<tr>
			<th>�����ġ :&nbsp;</th>
			<td>00 ���</td>
			</tr>
			<tr>
			<th>����±� :&nbsp;</th>
			<td>#���1 #���2</td>
			</tr>
			</table>
		</div>	
	</div>
	<div class="map_div col-lg-12">
	<hr class="soften" /><h3 class="sub_text">�ڽ� ���</h3><hr class="soften" /> 
		<div class="map">
		
		<br>
		<img src="c_image/map1.jpg" class="map_img">
		</div>
	
		</div>
	</div>
	<div class="table_wrap">


	<hr class="soften" /><h3 class="sub_text">�ڽ� ��������</h3><hr class="soften" /> 
	
	
	<br><br>
	<table class="info" id="table_content">
      
         <tr>
           <c:forEach var="i" begin="1" end="3">
          <table id="table_content">
           <tr>
            <td width=30% align=center rowspan="5">
             <img src="date1.jpg" width=300>
            </td>
           </tr>
           <tr>
             <td width=20% align=center><h4> ${i }��° ��� </h4> </td>
             <td width=50% align=left class="explain">$ ������� - �Ĵ� / ��Ÿ� / ī��</td>
           </tr>
           <tr>
             <td width=20% align=center><h4>  ��� �̸�  </h4> </td>
             <td width=50% align=left class="explain"> $ ����̸� - 00 �Ĵ�</td>
           </tr>
           <tr>
             <td width=20% align=center><h4>���� ����</h4></td>
             <td width=50% align=left class="explain">$ ���� ������ 00�� 00����</td>
           </tr>
           <tr>
             <td width=20% align=center><h4>  ��� ���� </h4></td>
             <td width=50% align=left class="explain">
             $ ��� ���� - �ش� ��Ҵ� ���� �����ִ� ����̸�
		������������������������ѹ��̰�丮����Ʈ�ݹںҰ��Դϴ�
		$ ��� ���� - �ش� ��Ҵ� ���� �����ִ� ����̸�
		������������������������ѹ��̰�丮����Ʈ�ݹںҰ��Դϴ�
		$ ��� ���� - �ش� ��Ҵ� ���� �����ִ� ����̸�
		������������������������ѹ��̰�丮����Ʈ�ݹںҰ��Դϴ�
		$ ��� ���� - �ش� ��Ҵ� ���� �����ִ� ����̸�
		������������������������ѹ��̰�丮����Ʈ�ݹںҰ��Դϴ�
		$ ��� ���� - �ش� ��Ҵ� ���� �����ִ� ����̸�
		������������������������ѹ��̰�丮����Ʈ�ݹںҰ��Դϴ�
		$ ��� ���� - �ش� ��Ҵ� ���� �����ִ� ����̸�
		������������������������ѹ��̰�丮����Ʈ�ݹںҰ��Դϴ�
		$ ��� ���� - �ش� ��Ҵ� ���� �����ִ� ����̸�
		������������������������ѹ��̰�丮����Ʈ�ݹںҰ��Դϴ�</td>
           </tr>
          </table>
         
          <br><br>
          <hr class="hr" />
          <br><br>
         </c:forEach>
          </tr>
       </table>
	<br><br>

	
	</div>


</div>
	<%-- </c:forEach> --%>


</body>
</html>