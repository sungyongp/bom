//함수명 접두사를 member로 시작하세요.
//ex) function memberMoviePage()

 var booleanPassword = false;
 var booleanEmail = false
	 
function passwordChk(msg){
	var passwordExp= /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{5,}$/;
	var passwordL = document.getElementById("id_passwords");
	
	if(msg==""){
		this.booleanPassword = false;
		passwordL.innerHTML = "비밀번호를 입력해 주세요.";
		}else if(msg.match(passwordExp)){
			this.booleanPassword = true;
			passwordL.innerHTML = "";
		}else{
			this.booleanPassword = false;
			passwordL.innerHTML = "비밀번호는 형식에 맞게 작성헤 주세요.";
		}
}

function idChk(msg){
	var emailExp =  /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{1,4}|[0-9]{1,3})(\]?)$/;
	var emailL = document.getElementById("id_login");
	
	if(msg==""){
		this.booleanEmail = false;
		emailL.innerHTML = "이메일을 입력해 주세요.";
	}else if(msg.match(emailExp)){
		this.booleanEmail = true;
		emailL.innerHTML = "";
	}else{
		this.booleanEmail = false;
		emailL.innerHTML = "이메일 형식에 맞춰 작성해 주세요.";
	}
}

function goLogin(frm){
	var allData = { 
			 "inputEmail"	 : frm.inputEmail.value, 
			 "inputPassword" : frm.inputPassword.value
			 };
		
	if(booleanEmail == true && booleanPassword == true){
			$.ajax({
				url : '/final/memberLogin.mem',
				type : 'post',
				data : allData,
				dataType : 'HTML',
				success : function(html) {
					if(html=="true"){
						alert("로그인 되었습니다.");
						location.href="index.main"
					}else{
						alert("아이디 비밀번호를 다시 확인해 주세요.");
					}
				},
				error : function(error) {
					alert(error);
				}
			})
		}else{
			alert("아이디 비밀번호를 다시 확인해 주세요.");
		}
}