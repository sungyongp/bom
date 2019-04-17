<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoM</title>
		<link rel="stylesheet" type="text/css" href="/final/css/member/member_help.css">
	    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="/final/js/member/member_search.js"></script>

</head>
<body>
		<div id="mainMemberWrapper">
			<div id="mainMemberHeader">
				<%@include file='./member_wrapper/member_header.jsp'%>
			</div>
			<div>
				<div id="main-background-container">
					<img src="/final/img/member/login_help.jpg" id="member-background" width="100%" height="100%">				
				</div>
			</div>
			<div id="mainMemberContent">
				<div class="login-body">
					<div class="login-content">
						<h1>이메일/비밀번호를 잊으셨나요?</h1>
						<div>
							<form name="helpFrm" method="post">
								<ul class="nav nav-tabs">
								  <li class="nav-item">
								    <a class="nav-link active" data-toggle="tab" href="#findEamil">이메일 찾기</a>
								  </li>
								  <li class="nav-item">
								    <a class="nav-link" data-toggle="tab" href="#findPassword">비밀번호 찾기</a>
								  </li>
								</ul>
								<div id="myTabContent" class="tab-content">
								
								  <div class="tab-pane fade active show" id="findEamil">
								    <p>핸드폰 번호를 입력해주세요.</p>
								   	 <input type="text" name="idSearch" placeholder="010-0000-0000" autocomplete="off" value="">
								    <div>
								   	 <button type="button" class="btn btn-primary btn-lg btn-block" onclick="memberIdSearch(this.form)">이메일 찾기</button>
								    </div>
								  </div>
								  
								  <div class="tab-pane" id="findPassword">
								    <p>비밀번호 재설정 안내 이메일을 보내드리겠습니다.</p>
								    <input type="email" name="pwdSearch" placeholder="name@example.com" autocomplete="off" value="" >
								    <div>
								   	 <button type="button" class="btn btn-primary btn-lg btn-block" onclick="memberPwdSearch(this.form)">비밀번호 찾기</button>
								    </div>
								  </div>
								
								</div>
								
							</form>
						</div>
					</div>
				</div>
			</div>
			<div id="mainMemberFooter">
				<%@include file='./member_wrapper/member_footer.jsp'%>
			</div>
		
		</div>	
</body>
</html>