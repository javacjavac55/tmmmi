<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Review</title>
		
		<!-- Carousel -->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<link rel="stylesheet" href="/css/scroll/main_movie.css">
		<noscript><link rel="stylesheet" href="/css/scroll/noscript.css" /></noscript>
		<style>
			.carousel {
				background-color: ${bgColor};
			}
			
			.section-title {
				color: ${fontColor};
			}
		</style>
	</head>
<body>
	<section class="carousel">
		<div><span class="section-title">영화 리뷰</span></div>
		<div class="reel" style="overflow: visible; transform: translate(-1285px, 0px);">
			<c:forEach var="contentMovie" items="${contentMovieReviewList}">
				<article class="content-movie">
					<div class="movie">
						<a href="#">
							<img class="poster" src="${contentMovie.movieThumbnail}">
						</a>
						<button class="content-model-btn movie-title" type="button" data-content="${contentMovie.movieLink}">${contentMovie.movieTitle}</button><br/>
						<c:set var="movieIndex" value="0" />
						<c:forEach var="review" items="${contentMovie.movieReviewTitle}">
							<div class="movie-review">
								<span class="review-field">리뷰 ${movieIndex + 1}</span><br/>
								<div class="movie-review-title">
									<span class="movie-review-link" data-content="${contentMovie.movieReviewLink[movieIndex]}">${contentMovie.movieReviewTitle[movieIndex]}</span><br/>										
								</div>
							</div>
							<c:set var="movieIndex" value="${movieIndex + 1}"/>
						</c:forEach>
					</div>
				</article>
			</c:forEach>
		</div>
	</section>
	<input type="hidden" id="movieReviewInput" value=""/>
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
			$(".movie-review-link").on("click", function(){
				var content = $(this).data("content");
				$('#movieReviewInput').val(content);
			});
			
			$(".content-model-btn").on("click", function(){
				var content = $(this).data("content");
				$('#movieReviewInput').val(content);
			});
		})
	</script>
</body>
</html>