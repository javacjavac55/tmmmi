<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Trailer</title>
		
		<!-- Carousel -->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<link rel="stylesheet" href="/css/scroll/main_movie.css">
		<noscript><link rel="stylesheet" href="/css/scroll/noscript.css" /></noscript>
	</head>
<body>
	<section class="carousel">
		<div><span class="section-title">영화 예고편</span></div>
		<div class="reel" style="overflow: visible; transform: translate(-1285px, 0px);">
			<c:forEach var="contentMovie" items="${contentMovieTrailerList}">
				<article class="content-movie-trailer">
					<div class="movie">
						<a href="#">
							<img class="videoThmb" src="${contentMovie.movieThumbnail}" data-no="${contentMovie.movieNo}" data-link='${contentMovie.movieVideo}'>
						</a>
						<button class="content-model-btn trailer-title" type="button" data-content="${contentMovie.movieLink}">${contentMovie.movieTitle}</button><br/>
						<div class="movie-trailer-info">
							<span class="trailer-field">개봉일</span>  <span>${contentMovie.movieOpenDate}</span> <span class="trailer-field">장르</span> <span>${contentMovie.movieGenre}</span><br/>	
							<span class="trailer-field">감독</span> <span>${contentMovie.movieDirector}</span><br/>
							<span class="trailer-field">배우</span> <span>${contentMovie.movieActor}</span><br/>
							</div>
						</div>
					<div class="movie-trailer-preview" id="movie-preview-${contentMovie.movieNo}">
						
					</div>
				</article>
			</c:forEach>
		</div>
	</section>
	<input type="hidden" id="movieTrailerInput" value=""/>
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
			$(".videoThmb").on("click", function(){
				var no = $(this).data("no");
				var link = $(this).data("link");
				$('#movie-preview-'+no).html(link+'<div class="movie-preview-close-btn" data-no="'+no+'"></div>');
				
				$(".movie-preview-close-btn").on("click", function(){
					var no = $(this).data("no");
					$('#movie-preview-'+no).html('');
					$('#movie-preview-'+no).attr('style','display:none;');
				});
				
				$('#movie-preview-'+no).attr('style','display:block;');
			});
			
			$(".content-model-btn").on("click", function(){
				var content = $(this).data("content");
				$('#movieTrailerInput').val(content);
			});
		})
	</script>
</body>
</html>