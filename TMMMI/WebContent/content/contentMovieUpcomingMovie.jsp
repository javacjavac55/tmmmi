<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>contentMovieUpcomingMovie</title>
		
		<!-- Material Kit CSS -->
		<link href="/css/template/material-kit.min.css?v=2.0.5" rel="stylesheet" />
		<!-- Carousel CSS -->
		<link rel="stylesheet" href="/css/scroll/main.css">
		<noscript><link rel="stylesheet" href="/css/scroll/noscript.css" /></noscript>
		
		<!-- Material Kit JS -->
		<script src="/javascript/template/core/jquery.min.js" type="text/javascript"></script>
		<script src="/javascript/template/core/popper.min.js" type="text/javascript"></script>
		<script src="/javascript/template/core/bootstrap-material-design.min.js" type="text/javascript"></script>
		<script async defer src="https://buttons.github.io/buttons.js"></script>
		<script src="/javascript/template/material-kit.js?v=2.0.5" type="text/javascript"></script>
	</head>
<body>
	<section class="carousel" style="background-color:#1d1d1d;">
		<div class="reel" style="overflow: visible; transform: translate(-1285px, 0px);">
			<c:forEach var="contentMovie" items="${contentMovieUpcomingMovieList}">
				<article class="movie-left">
					<a href="#" class="image featured">
						<img src="${contentMovie.movieThumbnail}">
					</a>
					<div class="movie-preview-wrapper">
						<button type="button" class="movie-preview">���ư���</button>
						${contentMovie.movieVideo}
					</div>
				</article>
				<article class="movie-right">
					<button type="button" class="movie-preview">������</button>
					<header>
						<h3>${contentMovie.movieTitle}</h3>
					</header>
					<div class="movie-info">
						<span class="field">������</span>  <span>${contentMovie.movieOpenDate}</span>
						<span class="field">�� �ð�</span> <span>${contentMovie.movieRunningTime}</span><br/>	
						
						<span class="field">����</span> <span>${contentMovie.movieDirector}</span><br/>
						<span class="field">���</span> <span>${contentMovie.movieActor}</span><br/>
						<span class="field">�帣</span> <span>${contentMovie.movieGenre}</span><br/>										
					</div>
				</article>
			</c:forEach>
		</div>
	</section>
	
	<!-- Carousel JS -->
	<script src="/javascript/scroll/jquery.dropotron.min.js"></script>
	<script src="/javascript/scroll/jquery.scrolly.min.js"></script>
	<script src="/javascript/scroll/jquery.scrollex.min.js"></script>
	<script src="/javascript/scroll/browser.min.js"></script>
	<script src="/javascript/scroll/breakpoints.min.js"></script>
	<script src="/javascript/scroll/util.js"></script>
	<script src="/javascript/scroll/main.js"></script>
	<script>
		$(function(){
			$(".movie-preview").on("click", function(){
				$(".movie-preview-wrapper").attr("style","display:block;")
			});
		})
	</script>
</body>
</html>