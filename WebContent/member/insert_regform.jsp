<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<div id="member_body_four">
<div class="simpleContainer" data-transitioned-child="true">
	<div class="centerContainer contextStep" style="display: block; transform: none; opacity: 1; transition-duration: 250ms;">
		<div class="regContainer" data-uia="context-registration">
			<div class="stepLogoContainer">
				<span class="stepLogo regStepLogo"></span>
			</div>
			<div class="stepHeader-container">
				<div class="stepHeader">
					<span class="stepIndicator"><b>2</b>/<b>3단계</b></span>
					<h1 class="stepTitle">계정을 등록하세요.</h1>
				</div>
			</div>
			<div class="contextBody contextRow">맞춤형 콘텐츠 서비스, BoM! ID와
				비밀번호를 설정하여 디바이스에서BoM을 시청하세요.</div>
		</div>
		<div class="submitBtnContainer">
			<button type="button" autocomplete="off" id="member_next_btn4" class="nf-btn nf-btn-primary nf-btn-solid nf-btn-oversize" data-uia="cta-continue-registration" placeholder="registration_button_continue">다음</button>
		</div>
	</div>
</div>
</div>

<script>
	$('#member_next_btn4').click(function() {
		$.ajax({
			url : 'insert_regform.jsp',
			data : 'html',
			type : 'post',
			success : function() {
				$('#member_body_four').load('insert_registration.jsp');
			},
			error : function() {
				alert("실패");
			}
		})
	});
</script>
