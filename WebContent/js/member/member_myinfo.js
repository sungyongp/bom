/**
 * 
 */
var booleanPassword = false;

function passwordChk(value){
	var passwordExp= /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{5,}$/;
	var changePassword = document.getElementById("changePassword");
	
	 
	if(value==""){
			booleanPassword = false;
			changePassword.innerHTML = "비밀번호를 입력해 주세요.";
		}else if(value.match(passwordExp)){
			booleanPassword = true;
			changePassword.innerHTML = "";
		}else{
			booleanPassword = false;
			changePassword.innerHTML = "숫자, 문자, 특수문자, 5자이상 작성헤 주세요.";
		}
}

function pwdChage(){
	var pwd 	= $('#view-password').val();
	var chgPwd  = $('#view-chageassword').val();
	var email 	= $('#view-email').val();
	
	
	if(booleanPassword){
		$.ajax({
			type:'post',
			url :'/final/member_myinfo_view.mem',
			data:{
				'pwd'	: pwd,
				'chgPwd': chgPwd,
				'email' : email
			},
			dataType:"html",
			success : function(num){
				if(num=="true"){
					alert("변경 되었습니다.");
				}else{
					alert("Password를 다시 확인해 주세요.");
				}
			}, error:function(error){
				alert(error);
			}
		})
	}else{
		alert("Password가 일치하지 않습니다.");
	}
}