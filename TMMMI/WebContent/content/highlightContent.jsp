<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	
<!-- Carousel CSS -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="/css/scroll/main_sport.css">
<noscript><link rel="stylesheet" href="/css/scroll/noscript.css" /></noscript>
</head>
<body>
<section class="carousel">
	<div><span class="section-title">하이라이트</span></div>
	<div class="reel" style="overflow: visible; transform: translate(-1285px, 0px);">
		<c:forEach var="sport" items="${contentSport}">
			<article class="content-sport">
				<a href="#" class="image">
					<img src="${sport.sportThumbnail}" data-no="${sport.sportNo}" data-link='${sport.sportVideo}' />
				</a>
			</article>
		</c:forEach>
	</div>
</section>
	<section style="padding: 10%;"> <header class="major">
	<h2>하이라이트<h2>
	</header>
	<div class="posts" style="margin: 0 auto;">
		<c:forEach var="sport" items="${contentSport}">
			<article id="giyong"> <a href="#" class="image"><img
				src="${sport.sportThumbnail}" alt="" /></a> <a
				href="<iframe src='${sport.sportVideo}' frameborder='no' scrolling='no' marginwidth='0' marginheight='0' WIDTH='544' HEIGHT='306' allow='autoplay' allowfullscreen></iframe>" target="_blank">${sport.sportTitle}</a>
			<br />
			<ul class="actions" align="right">
				<li><a href="${sport.sportVideo}" target="_blank"><button type="button">More</button></a></li>
			</ul>
			</article>
		</c:forEach>
	</div>
	</section>
</body>
</html>