<%@page import="category.CategoryVo"%>
<%@page import="java.util.List"%>
<%@page import="category.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOM</title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<!-- RxJS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/rxjs/6.4.0/rxjs.umd.js"></script>
<!-- Font Awesome -->
<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
<!-- pay module -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- Local -->
<script src="/final/js/components/index.js"></script>

<link rel="stylesheet" type="text/css"
	href="/final/css/components/index.css">
<link rel="stylesheet" type="text/css"
	href="/final/css/components/header.css">
<link rel="stylesheet" type="text/css"
	href="/final/css/components/footer.css">
<link rel="stylesheet" type="text/css"
	href="/final/css/components/intro.css">
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String content = (request.getParameter("content") == null ? "./components/intro.jsp"
				: request.getParameter("content"));
		String search = request.getParameter("search") == null ? "" : request.getParameter("search");
		CategoryDao dao = new CategoryDao();
		List<CategoryVo> list = dao.list(search);
		if (list != null) {
			request.setAttribute("result", list);
		}
	%>
	<div id="main-header">
		<%@include file='./components/header.jsp'%>
	</div>
	<video id="main-video" muted autoplay onended="setVideo()">
		<source src="./movie/bg/test6.mp4" type="video/mp4">
	</video>
	<div id="main-content">
		<jsp:include page="<%=content%>" />
	</div>
	<div id="main-footer">
		<%@include file='./components/footer.jsp'%>
	</div>
</body>
</html>