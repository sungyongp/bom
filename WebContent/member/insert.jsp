<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOM</title>

<script	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
  
 <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 -->

<link rel="stylesheet" href="/final/css/datepicker.css">
<script src="/final/js/datepicker.js"></script>
<script src="/final/js/datepicker-ko-KR.js"></script> 

<link rel="stylesheet" type="text/css" href="/final/css/member/member_insert.css">
<link rel="stylesheet" type="text/css" href="/final/css/member/member_login.css">
<link rel="stylesheet" type="text/css" href="/final/css/member/member_planform.css">
</head>

<body>

	<div id="main-header">
		<%@include file='/member/member_wrapper/member_header.jsp'%>
	</div>


	<div id="member_body_one" class="simpleContainer"
		data-transitioned-child="true">
		<div class="centerContainer contextStep firstLoad">
			<div class="planContainer" data-uia="plan-context-page-container">
				<div class="stepLogoContainer">
					<span class="stepLogo planStepLogo"></span>
				</div>
				<div class="stepHeader-container">
					<div class="stepHeader">
						<span class="stepIndicator"><b>1</b>/<b>3단계</b></span>
						<h1 class="stepTitle">원하는 멤버십을 선택하세요.</h1>
					</div>
				</div>
				<div class="contextBody contextRow">
					<ul class="checkedList">
						<li class="bullet">멤버십 가입 시 모든 영화를 무제한 시청할 수 있습니다.</li>
						<li class="bullet">멤버심 내역을 간편하게 구매내역에서 바로 볼 수 있어요.</li>
						<li class="bullet">無약정, 無위약금. 해지도 쿨하게 언제든지.</li>
					</ul>
				</div>
			</div>
			<div class="submitBtnContainer">
				<button type="button" autocomplete="off" id="member_next_btn"
					class="nf-btn nf-btn-primary nf-btn-solid nf-btn-oversize"
					data-uia="continue-button" placeholder="button_see_plans">멤버십
					요금제 보기</button>
			</div>
		</div>
	</div>



	<div id="main-footer">
		<%@include file='/member/member_wrapper/member_footer.jsp'%>
	</div>


	<script>
		$('#member_next_btn').click(function() {
			$.ajax({
				url : 'insert_planform.jsp',
				type : 'post',
				success : function() {
					/* 	alert("성공"); */
					$('#member_body_one').load('insert_planform.jsp');
				},
				error : function() {
					alert("실패");
				}
			})
		});
	</script>
</body>

</html>


