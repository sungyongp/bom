<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="intro-container">
		<div class="intro-title">
			<p class="intro-introduce">Welcome!</p>
			<p class="intro-introduce-detail">
				 영화와 TV 프로그램, 거기에 스페셜까지! <br /> 
				 회원님의 취향에 꼭 맞는 다양한 콘텐츠를 즐기세요.<br />
			</p>
		</div>
		<div id="intro-popular">
			<!-- <h2>인기 콘텐츠</h2> -->
			
			<div id="intro-thumbnail">
				<jsp:include page="intro_list.jsp"></jsp:include>
			</div>
		</div>
	</div>
</body>
</html>