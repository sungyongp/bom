//함수명 접두사를 member로 시작하세요.
//ex) function memberMoviePage()

//button chek할때 쓰일  조건
	var booleanEmail 	 = false;
	var booleanPassword  = false;
	var booleanPassword2 = false;
	var booleanName  	 = false;
	var booleanBirth 	 = false;
	var booleanPhone  	 = false;
	var booleanNick  	 = false;
	var booleanCheck 	 = false;
	var idchk			 = 0;
	var nickNamechk		 = 0;
	
//email 형식 체크
function emailExp(msg){
	var emailExp =  /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	var emailV = document.getElementById("id_email");
	var emailL = document.getElementById("errorEmail");
	
	if(msg == "" || msg.match(emailExp)==null){
		booleanEmail = false;
		emailL.innerHTML = "공백 없이 이메일 형식에 맞게 입력해 주세요.";
	}else if(msg.match(emailExp)!=null){
		booleanEmail = true;
		  $.ajax({
		        type : 'POST',
		        data : { id : emailV.value },
		        url : "/final/idchk.mem",
		        dataType : "HTML",
		        success : function(data) {
		            if (data>0) {
		            	idchk = 0;
		            	emailL.innerHTML="아이디가 존재합니다. 다른 아이디를 입력해주세요.";
		                //아이디가 중복이면 idck = 0;
		            } else {
		            	idchk = 1;
		            	emailL.innerHTML="사용가능한 아이디입니다.";
		                //아이디가 중복하지 않으면  idck = 1; 
		            }
		        },
		        error : function(error) {
		            alert("error : " + error);
		        }
		    });
	}
}

//password 확인 체크
function passwordchk(msg){
	var password = document.getElementById("errorPassword");
	var passwordExp= /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{5,}$/;
	
	if(msg==""){
			booleanPassword = false;
			password.innerHTML = "비밀번호를 입력해 주세요.";
		}else if(msg.match(passwordExp)){
			booleanPassword = true;
			password.innerHTML = "사용 가능합니다.";
		}else{
			this.booleanPassword = false;
			password.innerHTML = "숫자, 문자, 특수문자 각각 1개 이상 최소 5자리이여야 합니다.";
		}
}

//password 재확인 체크
function passwordchk2(msg){
	var password = document.getElementById("errorRepassword");
	var message  = "";
	
	if(msg == document.getElementById("id_password").value){
		booleanPassword2 = true;
		message = password.innerHTML = "사용 가능합니다.";
	}else if(msg==""){
		booleanPassword2 = false;
		message = password.innerHTML = "비밀번호를 입력해 주세요.";
	}else{
		booleanPassword2 = false;
		message = password.innerHTML = "비밀번호를 똑같이 입력해 주세요.";
	}
	return message;
 }

//name chk
function namechk(msg){
	var nameExp = /^[가-힣a-zA-Z]*$/;
	var name	= document.getElementById("id_name");
	var nameL	= document.getElementById("errorName");
	
	if(msg!="" && msg.match(nameExp)){
		nameL.innerHTML = "사용 가능합니다.";
		booleanName = true;
	}else{
		nameL.innerHTML = "이름은 한글,영문만 가능합니다.";
		booleanName = false;
	}
	return nameL.innerHTML;
}		


//phone chk
function phonechk(msg){
	var phoneExp = /^\d{2,3}\d{3,4}\d{4}$/;
	var phone	= document.getElementById("id_phone");
	var phoneL	= document.getElementById("errorPhone");
	
	if(msg != "" && msg.match(phoneExp)){
		phoneL.innerHTML = "사용 가능합니다.";
		booleanPhone = true;
	}else{
		
		phoneL.innerHTML = "숫자만 가능하며 '-'를 빼고 입력해 주세요.";
		booleanPhone = false;
	}
	
	return phoneL.innerHTML;
}


//Date Of Birth
$("#id_date").datepicker({
	format : "yyyy-mm-dd",
	endDate : "date()",
	language: "ko-KR"
});
document.getElementById('id_date').value = new Date().toISOString().substring(0, 10);

function birthchk(){
	booleanBirth  = true;
	
	document.getElementById('errorBirth').innerHTML="사용 가능합니다.";
}


//비속어 체크 wordchk1
function wordchk(msg){
	var words	= ["성인","성인잡지", "새끼", "섹스", "섹"];
	var nick	= document.getElementById("id_nickname");
	var nickL   = document.getElementById("errorNickname");

		
	if(msg =="" || words.indexOf(msg) != -1){
		booleanEmail = false;
		nickL.innerHTML = "공백과 부적절한 언어는 사용하실 수 없습니다.";
	}else if(msg!="" && words.indexOf(msg) == -1){
		booleanEmail = true;
			  $.ajax({
			        type : 'POST',
			        data : { nickName : nick.value },
			        url : "/final/idnickName.mem",
			        dataType : "HTML",
			        success : function(data) {
			            if (data>0) {
			            	nickNamechk = 0;
			            	booleanNick = false;
			            	nickL.innerHTML="닉네임이 존재합니다. 다른 닉네임을 입력해주세요.";
			                //아이디가 중복이면 idck = 0; 
			            } else {
			            	nickNamechk = 1;
				            booleanNick = true;
			            	nickL.innerHTML="사용가능한 닉네임입니다.";
			                //아이디가 중복하지 않으면  idck = 1; 
			            }
			        },
			        error : function(error) {
			            alert("error : " + error);
			        }
			    });
		}
}

//checkbox 체크
function checkboxchk(){
	var frm = document.frm;
	
	if(frm.exampleCheck1.checked){
		booleanCheck = true;
	}else{
		booleanCheck = false;
	}
}


//insert_registration 
//페이지 이동 버튼
$('#member_next_btn3').click(function(){
		if(
		   idchk			== 1	&&
		   nickNamechk		== 1	&&
		   booleanEmail 	== true && 
		   booleanPassword  == true && 
		   booleanPassword2 == true && 
		   booleanName 		== true &&
		   booleanBirth  	== true &&
		   booleanPhone 	== true && 
		   booleanNick 		== true && 
		   booleanCheck	 	== true){
			
			document.frm.action="/final/signup.mem";
			document.frm.submit();
			
		}else if(idchk == 0){
			alert("중복된 아이디는 가입할 수 없습니다.");
		}else if(nickNamechk == 0){
			alert("중복된 닉네임은 가입할 수 없습니다.");
		}else if(booleanCheck==false){
			alert("약관에 동의 하셔야 가입이 가능합니다.");
		}else{
			alert("형식에 맞게 정확히 입력해 주세요.");
		}
})