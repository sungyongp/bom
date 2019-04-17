<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="/final/js/member/member_registration.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://code.jquery.com/jquery-3.3.1.js" ></script>

<form name="frm" id="frm" method="POST">
<div id="member_body_three" class="simpleContainer" data-transitioned-child="true">
	<div class="freeTrialMessaging notification">
		<div class="content">
			<span id="" data-uia="">회원가입으로 <strong>즐겁게 이용해 보세요 :D</strong></span>
		</div>
	</div>

	<div id="member_body_four" class="simpleContainer" data-transitioned-child="true">
		<div class="centerContainer" style="display: block; transform: none; opacity: 1; transition-duration: 250ms;">
				<div class="regFormContainer" data-uia="form-registration">
					<div class="stepHeader-container" style="text-align: center">
						<div class="stepHeader">
							<span class="stepIndicator"><b>3</b>/<b>3단계</b></span>
							<h1 class="stepTitle">개인 정보를&nbsp;입력해 주세요.&nbsp;</h1>
						</div>
					</div>
					
						<ul class="simpleForm structural ui-grid">
							<li data-uia="field-email+wrapper" class="nfFormSpace">
								<div data-uia="field-email+container" class="nfInput nfInputOversize">
									<div class="nfInputPlacement">
										<label class="input_id" >
										<input name="email" class="nfTextField " id="id_email" type="email" autocomplete="off" value="" placeholder="Email" onkeyup="emailExp(this.value)"></label>
									</div>
									<div id="errorEmail" class="inputError" data-uia="">이메일 주소를 입력해 주세요.</div>
								</div>
							</li>
							
							<li data-uia="field-email+wrapper" class="nfFormSpace">
								<div data-uia="field-email+container" class="nfInput nfInputOversize">
									<div class="nfInputPlacement">
										<label class="input_id" >
										<input name="password" class="nfTextField " id="id_password" type="password" autocomplete="off" value="" placeholder="Password" onkeyup="passwordchk(this.value)"></label>
									</div>
									<div id="errorPassword" class="inputError" data-uia="">비밀번호를 입력해 주세요.</div>
								</div>
							</li>
							
							
							<li data-uia="field-email+wrapper" class="nfFormSpace">
								<div data-uia="field-email+container" class="nfInput nfInputOversize">
									<div class="nfInputPlacement">
										<label class="input_id" >
										<input  autocomplete="off" type="password" id="id_repassword" class="nfTextField" name="name_password" value="" placeholder="Re-write Password" onkeyup="passwordchk2(this.value)"></label>
									</div>
									<div id="errorRepassword" class="inputError" data-uia="">비밀번호 재입력해 주세요.</div>
								</div>
							</li>
							
							<li data-uia="field-password+wrapper" class="nfFormSpace">
								<div data-uia="field-password+container" class="nfInput nfInputOversize">
									<div class="nfInputPlacement">
										<label class="input_id">
										<input autocomplete="off" type="text" id="id_name" class="nfTextField" name="name" placeholder="Name" value="" onkeyup="namechk(this.value)"></label>
									</div>
									<div id="errorName" class="inputError" data-uia="">이름을 입력해 주세요.</div>
								</div>
							</li>
							
							
    						<li data-uia="field-email+wrapper" class="nfFormSpace">
								<div style="width: 200px; display: inline-block">
									<label style="font-size: 18px"> <input type="radio"  name="gender" value="1" style="width: 23px; height: 23px" checked="">남성</label>
								</div>
								<div style="width: 200px; display: inline-block">
									<label style="font-size: 18px"> <input type="radio"  name="gender" value="2" style="width: 23px; height: 23px">여성</label>								
								</div>
							</li>
								
								
  							 <li data-uia="field-email+wrapper" class="nfFormSpace">
  							  	<div data-uia="field-email+container" class="nfInput nfInputOversize">
									<div class="nfInputPlacement">
										<label class="input_id">
										<input value="" autocomplete="off" type="text" id="id_date" class="nfTextField" name="date" onchange="birthchk()"></label>
									</div>
									<div id="errorBirth" class="inputError" data-uia="">생년월일을 입력해 주세요.</div>
								</div>
							</li>	
							
							
							<li data-uia="field-email+wrapper" class="nfFormSpace">
    							<div data-uia="field-email+container" class="nfInput nfInputOversize">
									<div class="nfInputPlacement">
										<label class="input_id" >
										<input autocomplete="off" type="text" id="id_phone" class="nfTextField" name="phone" placeholder="Phone" value="" onkeyup="phonechk(this.value)"></label>
									</div>
									<div id="errorPhone" class="inputError" data-uia="">핸드폰 번호를 입력해 주세요.</div>
								</div>
							</li>
								
								
    						<li data-uia="field-email+wrapper" class="nfFormSpace">
    							<div data-uia="field-email+container" class="nfInput nfInputOversize">
									<div class="nfInputPlacement">
										<label class="input_id" >
										<input autocomplete="off" type="text" id="id_nickname" class="nfTextField" name="nickName" placeholder="NickName" value="" onkeyup="wordchk(this.value)"></label>
									</div>
									<div id="errorNickname" class="inputError">닉네임을 입력해 주세요</div>
								</div>
							</li>
						</ul>
						<div class="form-check">
				    		<input type="checkbox" class="form-check-input" id="exampleCheck1" name="exampleCheck1" onClick="checkboxchk()" value="true">
				    		<label class="form-check-label" for="exampleCheck1">BoM 이용약관에 동의 하십니까</label>
						</div>
					<div class="submitBtnContainer">
						<button type="button" id="member_next_btn3" class="nf-btn nf-btn-primary nf-btn-solid nf-btn-oversize">가입하기</button>
					</div>
				</div>
			
		</div>
	</div>
</div>
</form>