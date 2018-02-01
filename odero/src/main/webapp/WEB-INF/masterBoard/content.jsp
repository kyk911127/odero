<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="masterBoard/masterBoard.css" type="text/css">
	<style type="text/css">
	.row {
		margin: 0 auto;
		width: 750px;
	}
	</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<center>
				<h3>공사중</h3>
				<table class="table" width="600">
					<tr class="aa">
						<td width="20%" class="text-center success">번호</td>
						<td width="30%" class="text-center">${vo.no}</td>
						<td width="20%" class="text-center success">작성일</td>
						<td width="30%" class="text-center">
							<fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/>
						</td>
					</tr>
					<tr class="aa">
						<td width="20%" class="text-center success">이름</td>
						<td width="30%" class="text-center">${vo.name}</td>
						<td width="20%" class="text-center success">조회수</td>
						<td width="30%" class="text-center">${vo.hit}</td>
					</tr>
					<tr class="aa">
						<td width="20%" class="text-center success">제목</td>
						<td colspan="3" class="text-center">${vo.subject}</td>
					</tr>
					<tr class="aa">
						<td colspan="4" style="border:solid 1px #e7ebf5">
						<pre style="border:none;background-color:white;">${vo.content}</pre>
						</td>
					</tr>
				</table>
			</center>
		</div>
	</div>
	
	
	<div class="row">
<%-- 	<div id="basisElement">
		<div id="content-area">
			<div id="main-area">
				<div class="list-blog border-sub" id="post_213">
					<div class="inbox">
						<div class="box-reply2 bg-color u_cbox" id="Ej8vt"
							style="display: block;">
							<!-- 댓글 리스트  -->
							<ul class="cmlist" id="cmt_list">
								
								<c:forEach var="rvo" items="${list }">
								<c:choose>
									<c:when test="${vo.group_tab > 0}"">
										<c:forEach var="i" begin="1" end="${rvo.group_tab+1}">
											<li style="margin-left:${5*i}px">
										</c:forEach>
									</c:when>
									<c:otherwise>
										<li>
									</c:otherwise>
								</c:choose>
									<div class="comm_cont">
										<div class="h">
											<div class="pers_nick_area">
												<table cellspacing="0" summary="퍼스나콘/아이디 영역">
													<tbody>
														<tr>
															<td class="p-nick">
																<a class="m-tcol-c _rosRestrict _nickUI" href="#">${rvo.name}</a>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
											<span class="date m-tcol-c filter-50">2012.09.04.
												17:25
											</span> 
											<jsp:useBean id="now" class="java.util.Date" />
											<fmt:formatDate	var="today" value="${now}" pattern="yyyy-MM-dd"/>
											<fmt:formatDate	var="yesterday" value="${rvo.regdate}" pattern="yyyy-MM-dd"/>
											<c:if test="${today==yesterday}">
												<b style="color:red;background-color:black">new</b>
											</c:if>
												<span class="dsc_comm">
													<a class="m-tcol-c  _btnReply  m-tcol-c _btnReply" href="#">답글</a></span>
												<p class="btn_edit m-tcol-c">
               										<a class="filter-70 m-tcol-c _btnNoti" class="reply_update" value="${rvo.no }">수정</a>&nbsp;
               										<a class="filter-70 m-tcol-c _btnNoti" href="reply_delete.do?no=${rvo.no }&bno=${vo.no}">삭제</a>
               										<a class="filter-70 m-tcol-c _btnNoti" class="reply_reply" value="${rvo.no }">댓글</a>
												</p>
										</div>
										<p class="comm m-tcol-c">
											<span class="comm_body">${rvo.msg}
											</span>
										</p>
									</div>
								</li>
								<li class="filter-30 board-box-line-dashed"></li>
								<li>
									<table class="cminput" cellspacing="0">
										<tbody>
											<tr id="in${rvo.no}" style="display:none;">
											<td class="i2">
												<div class="comm_write_wrap border-sub skin-bgcolor">
													<form method=post action="reply_reply_insert.do">
		           										<input type="hidden" name="bno" value="${vo.no }">
	           											<input type="hidden" name="pno" value="${rvo.no }">
													<textarea name="msg" title="댓글입력" class="textarea m-tcol-c" 
														id="comment_text" style="height: 39px; line-height: 14px; 
														overflow: hidden; -ms-overflow-y: hidden;"
														maxlength="6000" rows="2" cols="50">
													</textarea>
													<input type="hidden" name="name" value="손님" />
												</div>
											</td>
											<td class="i3">
												<div class="u_cbox_btn_upload _submitBtn">
													<input type="submit" value="댓글달기" class="u_cbox_txt_upload _submitCmt" value="댓글달기"/>
													</form>
												</div>
											</td>
											</tr>
											<tr id="up${rvo.no }" style="display:none;">
											<td class="i2">
												<div class="comm_write_wrap border-sub skin-bgcolor">
													<form method=post action="reply_update.do">
		           										<input type="hidden" name="bno" value="${vo.no }">
	           											<input type="hidden" name="pno" value="${rvo.no }">
													<textarea name="msg" title="댓글입력" class="textarea m-tcol-c" 
														id="comment_text" style="height: 39px; line-height: 14px; 
														overflow: hidden; -ms-overflow-y: hidden;"
														maxlength="6000" rows="2" cols="50">
														${rvo.msg}
													</textarea>
												</div>
											</td>
											<td class="i3">
												<div class="u_cbox_btn_upload _submitBtn">
													<input type="submit" value="수정하기" class="u_cbox_txt_upload _submitCmt"/>
													</form>
												</div>
											</td>
											</tr>
										</tbody>
									</table>
								</li>
								</c:forEach>
								<!--  반복   -->
								<li class="filter-30 board-box-line-dashed"></li>
							</ul>
							<div style="font: 0pt/0pt arial; height: 0pt; clear: both; font-size-adjust: none; font-stretch: normal;"></div>

							<table class="cminput" cellspacing="0">
								<tbody>
									<tr>
										<td class="i2">
											<div class="comm_write_wrap border-sub skin-bgcolor">
											<form method=post action="reply_new_insert.do">
           										<input type="hidden" name=bno value="${vo.no}">
          										<textarea name="msg" title="댓글입력" class="textarea m-tcol-c" id="comment_text"
													style="height: 39px; line-height: 14px; overflow: hidden; -ms-overflow-y: hidden;"
													maxlength="6000" rows="2" cols="50"></textarea>
												<input type="hidden" name="name" value="손님" />
           									</form>
											</div>
										</td>
										<td class="i3">
											<div class="u_cbox_btn_upload _submitBtn">
												<a class="u_cbox_txt_upload _submitCmt" href="#">등록</a>
											</div>
										</td>
									</tr>
									<tr>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
 --%>					<table class="table" width="600">
					<tr class="aa">
						<td colspan="4" class="text-right">
							<a href="MasterBoardReply.do?no=${vo.no}&page=${page}" class="btn btn-sm btn-success">답변</a>
							<a href="MasterBoardUpdate.do?no=${vo.no}&page=${page}" class="btn btn-sm btn-success">수정</a>
							<a href="MasterBoardDelete.do?no=${vo.no}&page=${page}" class="btn btn-sm btn-primary">삭제</a>
							<a href="MasterBoard.do" class="btn btn-sm btn-info">목록</a>
						</td>
					</tr>
					</table>
	</div>
	
</body>
</html>

















