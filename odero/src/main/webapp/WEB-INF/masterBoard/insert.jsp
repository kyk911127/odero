<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="masterBoard/masterBoard.css" type="text/css">
<script type="text/javascript" src="masterBoard/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<style>
.row{
	width:1200px
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<center>
				<h3>공사중</h3>
				<form method="post" action="MasterBoardInsert_ok.do">
				<table class="table table-hover aa" width=1200>
					<tr>
						<td width=15% class="text-right">제목</td>
						<td width=85%><input type=text name=subject size=50></td>
					</tr>
					<tr>
						<td width=15% class="text-right">내용</td>
						<td width=85%>
						
									<textarea name=content id="ir1" rows="10" cols="100"
										style="width: 966px; height: 412px; display: none;"></textarea>
									<!-- <p>
										<input type="button" onclick="pasteHTML();" value="본문에 내용 넣기" />
										<input type="button" onclick="showHTML();" value="본문 내용 가져오기" />
										<input type="button" onclick="submitContents(this);"
											value="서버로 내용 전송" /> <input type="button"
											onclick="setDefaultFont();" value="기본 폰트 지정하기 (궁서_24)" />
									</p> -->
							</td>
					</tr>
					<tr>
						<td width=15% class="text-right">비밀번호</td>
						<td width=85%><input type=password name=pwd size=10>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<!-- <input type="submit" value="글쓰기" class="btn btn-info"> --> 
							<input type="button" onclick="submitContents(this);" value="서버로 내용 전송" />
							<input type="button" value="취소 " class="btn btn-success" onclick="javascript:history.back()">
						</td>
					</tr>
				</table>
				</form>
			</center>
		</div>
	</div>




	<script type="text/javascript">
		var oEditors = [];

		var sLang = "ko_KR"; // 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR

		// 추가 글꼴 목록
		//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "ir1",
			sSkinURI : "masterBoard/SmartEditor2Skin.html",
			htParams : {
				bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
				//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
				fOnBeforeUnload : function() {
					//alert("완료!");
				},
				I18N_LOCALE : sLang
			}, //boolean
			fOnAppLoad : function() {
				//예제 코드
				//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
			},
			fCreator : "createSEditor2"
		});

		function pasteHTML() {
			var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
			oEditors.getById["ir1"].exec("PASTE_HTML", [ sHTML ]);
		}

		function showHTML() {
			var sHTML = oEditors.getById["ir1"].getIR();
			alert(sHTML);
		}

		function submitContents(elClickedObj) {
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

			// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.

			try {
				elClickedObj.form.submit();
			} catch (e) {
			}
		}

		function setDefaultFont() {
			var sDefaultFont = '궁서';
			var nFontSize = 24;
			oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
		}
	</script>
</body>
</html>