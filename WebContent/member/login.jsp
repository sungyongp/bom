<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>BOM</title>


<link rel="stylesheet" type="text/css" href="/final/css/member/member_login.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="/final/js/member/member_login.js"></script>

</head>
<body>
	<div id="mainMemberWrapper">
		<div id="mainMemberHeader">
			<%@include file='./member_wrapper/member_header.jsp'%>
		</div>
		<div>
			<div id="main-background-container">

				<img src="/final/img/member/login_main.jpg" id="member-background"
					width="100%" height="100%">

			</div>
		</div>
		<div id="mainMemberContent">
			<div class="login-body">
				<div class="login-content">
					<div class="login-form-main">
						<h1>로그인</h1>
						<form name="frm" id="frm" method="post" class="login-form">
							<div class="form-group">
								<input type="email" class="login-input" name="inputEmail" id="inputEmail"
									placeholder="Email Address" onkeyup="idChk(this.value)">
								<div id="id_login" class="login-error"></div>
							</div>
							<div class="form-group">
								<input type="password" class="login-input" name="inputPassword" id="inputPassword"
									placeholder="Password" onkeyup="passwordChk(this.value)">
								<div id="id_passwords" class="login-error"></div>
							</div>
							<input type="button" class="member-login-button" onclick="goLogin(this.form)" value="로그인">
							
							<div id="id_password" class="login-form-help">

								<div class="login-remember-me">
									<label class="login-remember-me-label"><input
										type="checkbox" name="rememberMe" id="rememberMe" value="true"
										checked>&nbsp;로그인 정보 저장</label>
								</div>
								<a href="/final/loginHelp.mem" class="login-help-link">도움이 필요하신가요?</a>

							</div>
						</form>
					</div>
					<div class="login-form-other">
						<div class="login-out-login">
							<a id="kakao-login-btn"><img src="/final/img/member/KakaoTalk_login.png"></a>
						</div>
						<div class="login-signup-now">
							BoM 회원이 아닌가요? <a href="/final/member/insert.jsp"
								target="_self" class="login-signup-link">지금 가입하세요.</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="mainMemberFooter">
			<%@include file='./member_wrapper/member_footer.jsp'%>
		</div>

	</div>
	
	<script type='text/javascript'>
	  //<![CDATA[
	    // 사용할 앱의 JavaScript 키를 설정해 주세요.
	    Kakao.init('868c1892df56b136f28b03ecfdf786b4');
	    // 카카오 로그인 버튼을 생성합니다.
	    Kakao.Auth.createLoginButton({
	      container: '#kakao-login-btn',
	      success: function(authObj) {
	    		Kakao.API.request({
	    		
	    			url:'/v1/user/me',
	    			success: function(res){
	    				console.log(res);
	    				
	    				$.ajax({
	    					type:"POST",
	    					data: {"kakaoId": res.id,"kakaoNickName":res.properties.nickname,"kakaoLogin":"true"},
	    					url : "kakaoLogin.mem",
	    					success: function(html){
	    						
	    					},
	    					error:function(error){
	    						console.log(error);
	    						console.log("실패");
	    					}
	    					
	    				});
	    				
	    				location.href="index.main";
	    			},
	    			fail:function(error){
	    				alert(JSON.stringify(error));
	    			}
	    			
	    		});

/* 	        alert(JSON.stringify(authObj)); */
	      },
	      fail: function(err) {
	         alert(JSON.stringify(err));
	      }
	    });
	  //]]>
	</script>	
	
</body>
</html>