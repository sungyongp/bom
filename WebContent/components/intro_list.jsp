<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="/final/css/components/flexslider.css"
	type="text/css">
<title>List test</title>
<style>
@import url(https://fonts.googleapis.com/css?family=Raleway:400,500,700)
	;

.snip1273 {
	font-family: 'Raleway', Arial, sans-serif;
	position: relative;
	margin: 0px;
	min-width: 310px -60px;
	max-width: 310px;
	width: 100%;
	color: #ffffff;
	text-align: left;
	background-color: #000000;
	font-size: 16px;
}

.snip1273 * {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all 0.4s ease-in;
	transition: all 0.4s ease-in;
}

.snip1273 img {
	position: relative;
	max-width: 100%;
	vertical-align: top;
}

.snip1273 figcaption {
	position: absolute;
	top: 0;
	right: 0;
	width: 100%;
	height: 100%;
	z-index: 1;
	opacity: 0;
	padding: 20px 30px;
}

.snip1273 figcaption:before, .snip1273 figcaption:after {
	width: 1px;
	height: 0;
}

.snip1273 figcaption:before {
	right: 0;
	top: 0;
}

.snip1273 figcaption:after {
	left: 0;
	bottom: 0;
}

.snip1273 h3, .snip1273 p {
	line-height: 1.5em;
}

.snip1273 h3 {
	margin: 0 0 5px;
	font-weight: 700;
	text-transform: uppercase;
}

.snip1273 p {
	font-size: 0.8em;
	font-weight: 500;
	margin: 0 0 15px;
}

.snip1273 a {
	position: absolute;
	top: 0;
	bottom: 0;
	right: 0;
	left: 0;
	z-index: 1;
}

.snip1273:before, .snip1273:after, .snip1273 figcaption:before,
	.snip1273 figcaption:after {
	position: absolute;
	content: '';
	background-color: #ffffff;
	z-index: 1;
	-webkit-transition: all 0.4s ease-in;
	transition: all 0.4s ease-in;
	opacity: 0.8;
}

.snip1273:before, .snip1273:after {
	height: 1px;
	width: 0%;
}

.snip1273:before {
	top: 0;
	left: 0;
}

.snip1273:after {
	bottom: 0;
	right: 0;
}

.snip1273:hover img, .snip1273.hover img {
	opacity: 0.4;
}

.snip1273:hover figcaption, .snip1273.hover figcaption {
	opacity: 1;
}

.snip1273:hover figcaption:before, .snip1273.hover figcaption:before,
	.snip1273:hover figcaption:after, .snip1273.hover figcaption:after {
	height: 100%;
}

.snip1273:hover:before, .snip1273.hover:before, .snip1273:hover:after,
	.snip1273.hover:after {
	width: 100%;
}

.snip1273:hover:before, .snip1273.hover:before, .snip1273:hover:after,
	.snip1273.hover:after, .snip1273:hover figcaption:before, .snip1273.hover figcaption:before,
	.snip1273:hover figcaption:after, .snip1273.hover figcaption:after {
	opacity: 0.1;
}

#detail-load {
	display: none;
	height: 430px;
	padding: 20px;
}

.detail-container {
	display: grid;
	padding: 5px;
	grid-template-columns: 45% 54%;
	grid-gap: 20px;
}
.detail-videoZone {
	grid-column: 1;
}
.detail-description {
	grid-column: 2;
}
</style>

</head>
<body class="list_page">
	<script type="text/javascript" charset="utf-8">
		//Can also be used with $(document).ready()

		$(document).ready(function() {
			// The slider being synced must be initialized first
			$('#carousel').flexslider({
				animation : "slide",
				controlNav : false,
				animationLoop : true,
				slideshow : true,
				itemWidth : 270,
				itemMargin : 5

			});

			$('#carousel2').flexslider({
				animation : "slide",
				controlNav : false,
				animationLoop : true,
				slideshow : true,
				itemWidth : 270,
				itemMargin : 5
			});

			$(".hover").mouseleave(function() {
				$(this).removeClass("hover");
			});

		});
	</script>
	<div id=list style="height:350px">
		<div id="carousel" class="flexslider">
			<h2>인기 영화</h2>
			<ul class="slides">
				<c:forEach var="i" items="${result}">
					<li>
						<figure class="snip1273">
							<img src="/final/img/intro/${i.c_movie_subject_eng}.jpg" class="list_img" />
							<figcaption onClick="goDetail(${i.c_serial})">
								<h3>${i.c_movie_subject }</h3>
								<p>${i.c_description }</p>
							</figcaption>
						</figure>
					</li>
				</c:forEach>
			</ul>
		</div>
		<br />
	</div>
	<div id="detail"></div>
	<div id="detail-load">
		<div class="detail-container">
			<div class="detail-videoZone" id="detailVideoZone"></div>
			<div id="detailDescription"></div>
		</div>
	</div>
	<script src="/final/js/components/jquery.flexslider.js"></script>
</body>
</html>