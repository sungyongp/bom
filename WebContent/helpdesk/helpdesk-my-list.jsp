<%@page import="java.util.Date"%>
<%@page import="helpdesk.HelpDeskVo"%>
<%@page import="java.util.List"%>
<%@page import="helpdesk.HelpDeskDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html style= "overflow: auto;">
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/final/js/helpdesk/helpdesk.js"></script>
<link rel="stylesheet" type="text/css" href="/final/css/helpdesk/helpdesk.css">
<title>Insert title here</title>
</head>
<body>
	<%
		int id = request.getSession().getAttribute("bomMemberSeiral") != null ? (int)request.getSession().getAttribute("bomMemberSeiral") : 0;
		HelpDeskDao hDao = new HelpDeskDao();
		List<HelpDeskVo> result = hDao.listCheck(id);

		if (result != null) {
			request.setAttribute("result", result);
		}
	%>
	<h2>나의 문의내역 리스트</h2>
	<p>문의하신 내역을 확인하세요.
	<hr style="border: 1px solid orange;" />
	<div class="mylist">
		<c:choose>
			<c:when test="${result == null}">
				<h2 class="list-h2">문의사항이 없습니다.</h2>
			</c:when>
			<c:when test="${result != null}">
				<ul>
				<c:set var = "i" value= '0' />
					<c:forEach var="x" items="${result }">			
						<li class="mylist-menu">
							<p class="status">
								<c:choose>
									<c:when test="${x.q_reply != null }">
										[답변 완료]
									</c:when>
									<c:when test="${x.q_reply == null }">
										[처리 중]
									</c:when>
								</c:choose>
							</p> 
							<a>[${x.q_serial }] - [${x.q_subject }] - [${x.q_mdate }]</a> 
							<c:if test="${x.q_photo != null }">
								<img src = '/final/img/${x.q_photo }' class = "modifyImg">
							</c:if>
							<ul class="hide">
								<li>${x.q_content }</li>
								<li class="status-reply">
									<c:if test="${x.q_reply != null}">
										답변 : ${x.q_reply }
									</c:if>
								</li>
							</ul>
						</li>
						<c:if test="${x.q_reply == null}">
							<button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#myModal-${i }">수정</button>
							<button type="button" class="btn btn-outline-danger" onclick = "myListDel(${result[i].q_serial},'${result[i].q_photo }')">삭제</button>

							<div class="modal fade" id="myModal-${i }">
								<div class="modal-dialog">
									<div class="modal-content">
										
										<div class="modal-header">
											<h3 class="modal-title">문의글 수정하기</h3>
											<button type="button" class="close" data-dismiss="modal">×</button>
										</div>
										
										<div class="modal-body">
											<p style = "color: black;">수정할 내용을 작성하세요.</p>
														
											<form name = "oneModify-${i }" id="oneModify-${i }" method="POST" action = "modify.help" enctype = "multipart/form-data">		
												<div class = "input-group mb-3">
													<div class = "input-group-prepend">
														<span class = "input-group-text">날짜</span>
													</div>
													<input type = "text" class = "form-control" name = "modifyDate" value="<%=new Date().toLocaleString()%>" readonly>
												</div>
												<p>				
												<div class="input-group mb-3">
													<div class="input-group-prepend">
														<span class="input-group-text">제목</span>
													</div>
													<input type="text" class="form-control" name = "modifySubject" id = "modifySubject" required="required" value = "${result[i].q_subject }">
												</div>
												<p>
												<div class="input-group mb-3">
													<div class="input-group-prepend">
														<span class="input-group-text">내용</span>
													</div>
													<textarea class="form-control" rows="5" name = "modifyContent" id = "modifyContent" required="required" style = "resize: none;">${result[i].q_content }</textarea>
												</div>	
												<p>
												<c:choose>	
													<c:when test="${result[i].q_photo != null }">
														
														<input type= "checkbox" data-no=${result[i].q_serial } name = "modifyDeleteImg" id ="modifyDeleteImg" value = "${result[i].q_photo }" onchange="imageChange(this, ${result[i].q_serial }); ">
														<p style = "color: black;" id = "modifyLabel" >이미지를 바꾸시려면 체크하세요.</p>
														
														<div id = "image-zone-${result[i].q_serial }" style= "border: 1px solid white; display: none; ">
															<img id='img-${result[i].q_serial }' src='/final/img/${result[i].q_photo }' width='400' height='200' style = "margin-left: 35px;">
															<br/>
															<br/>
															<input type='file' id = 'inputImg' name = "inputImg" style = "margin-left: 35px" data-no = ${result[i].q_serial } onchange = "imageView(this, ${result[i].q_serial } );" />
															
									
															<br />
														</div>
														<p>
														<p>
													</c:when>
													<c:when test="${result[i].q_photo == null }">
														<div id = "image-zone-empty">
															<img id = "img-${result[i].q_serial }"src= 'http://placehold.it/300x200' width = '400' height = '200' style = "margin-left: 35px">
															<br/>
															<br/>
															<input type='file' id = "inputImg" style = "margin-left: 35px;" onchange = "imageMyView(this, ${result[i].q_serial } );" />
											
															<br />
														</div>
														<p>
														<p>		
													</c:when>
												</c:choose>
												
												<input type = "hidden" name = "modifySerial" value = "${result[i].q_serial }">
												<input type = "hidden" name = "modifyNickname" value = "${result[i].m_writer }">
												<input type = "hidden" name = "modifyMemberSerial" value = "${result[i].m_serial }">
												<button type ="submit" class="btn btn-outline-primary" style= "width: 400px; margin-left: 35px;">수정하기</button>
											</form>
										</div>
									</div>
								</div>
							</div>				
						</c:if>
						<hr style="border: 1px solid white;" />
						<c:set var="i" value = '${i + 1 }' />
					</c:forEach>
				</ul>
			</c:when>
		</c:choose>
	
	</div>
</body>
</html>