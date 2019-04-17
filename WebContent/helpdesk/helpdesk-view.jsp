<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Help Desk</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Do+Hyeon');
.helpdesk-wrapper{
	color:#f8f9fa;
	width: 1600px;
	background: rgba(0,0,0,0.5);
	margin: 0 auto 50px;
	font-family: 'Do Hyeon', sans-serif;
	overflow: scroll;
}

.helpdesk-wrap{
	width: 1400px;
	margin: 0 auto;
}

.helpdesk-content{
	display: grid;
	grid-template-columns: 350px 350px 350px 350px;
	grid-template-rows: 118px 25px 650px;
}

.helpdesk-title{
	grid-column-start: 1;
    grid-column-end: 5;    
    text-align: center;
}

.helpdesk-title h1{
	margin-top: 20px;
	margin-bottom: 50px;
}

.helpdesk-tab-wrap {
	cursor: pointer;
	font-size : 18px;
	text-align: center;
	vertical-align: middle;
	border-radius: 5px;
	border-bottom: 2px solid #F58723;
}

.helpdesk-tab-wrap:hover{
	font-weight: bold;
	border-bottom: 2px solid #d9534f;;
}

.helpdesk-tab-active{
	font-weight: bold;
	border-bottom: 2px solid #e6e6e6;
}

.helpdesk-content-wrap{
	grid-column-start: 1;
    grid-column-end: 5;
	
}

.helpdesk-content-cont{
	margin-top:20px;
	margin-bottom: 20px;
}

</style>
</head>
<body>
<div class="helpdesk-wrapper">
	<div class="helpdesk-wrap">
		<div class ="helpdesk-content">
		
			<div class="helpdesk-title">
				<h1>BOM 고객센터</h1>
			
			</div>
			<div class="helpdesk-tab-wrap myinfo-tab-active" onclick="goViewNotice()">공지사항</div>
			<div class="helpdesk-tab-wrap" onclick="goViewFAQ()">FAQ</div>
			<div class="helpdesk-tab-wrap" onclick="goViewOnetoOne()">1:1 문의하기</div>
			<div class="helpdesk-tab-wrap" onclick="goViewMyList()">나의 문의내역</div>
			<div class="helpdesk-content-wrap">
				<div class="helpdesk-content-cont">
				
				
				
				</div>
			</div>

		</div>
	</div>
</div>
<script>
$("#main-video").html(null); 
$("#main-video").css("background","#1a1a1a");
$("#main-content").css("background","#1a1a1a");

$(".helpdesk-content-cont").load('/final/helpdesk/helpdesk-notice.jsp');


$('.member-myinfo-tab-wrap').click(function(){
	  $(this).parent().children('.member-myinfo-tab-wrap').removeClass('myinfo-tab-active');
	  $(this).addClass('myinfo-tab-active');
	  
});

function goViewNotice(){
	$(".helpdesk-content-cont").load('/final/helpdesk/helpdesk-notice.jsp');
}

function goViewFAQ(){
	$(".helpdesk-content-cont").load('/final/helpdesk/helpdesk-faq-list.jsp');
}

function goViewOnetoOne(){
	$(".helpdesk-content-cont").load('/final/helpdesk/helpdesk-one.jsp');
	
}

function goViewMyList(){
	$(".helpdesk-content-cont").load('/final/helpdesk/helpdesk-my-list.jsp');
}


</script>

</body>
</html>