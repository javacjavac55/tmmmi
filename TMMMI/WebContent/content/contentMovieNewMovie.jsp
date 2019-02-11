<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>New Movie</title>
		
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
		<div><span class="section-title">현재 상영영화</span></div>
		<div class="reel" style="overflow: visible; transform: translate(-1285px, 0px);">
			<c:forEach var="contentMovie" items="${contentMovieNewMovieList}">
				<article class="content-movie">
					<div class="movie">
						<a href="#" >
							<img class="poster" src="${contentMovie.movieThumbnail}">
							<c:if test="${! empty contentMovie.movieVideo}">	
								<button class="movie-preview-btn" type="button" data-no="${contentMovie.movieNo}" data-link='${contentMovie.movieVideo}'></button>
							</c:if>	
						</a>
						<div class="movie-info">
							<button class="content-model-btn movie-title" type="button" data-content="${contentMovie.movieLink}">${contentMovie.movieTitle}</button><br/>
							<span class="field">개봉일</span>  <span class="detail">${contentMovie.movieOpenDate}</span><br/>
							<span class="field">네티즌 평점</span>  
								<div class="star-ratings-css"> 
									<div class="star-ratings-css-top" style="width:${contentMovie.movieRating*9.5}%;">
										★★★★★
									</div>
									<div class="star-ratings-css-bottom">
										★★★★★
									</div>
								</div><span id="movie-rating">${contentMovie.movieRating}</span><br/>
							<span class="field">예매율</span> <span class="detail">${contentMovie.movieReserveRate}</span><br/>
							<span class="field">상영 시간</span> <span class="detail">${contentMovie.movieRunningTime}</span><br/>	
							
							<span class="field">감독</span> <span class="detail">${contentMovie.movieDirector}</span><br/>
							<span class="field">배우</span> <span class="detail">${contentMovie.movieActor}</span><br/>
							<span class="field">장르</span> <span class="detail">${contentMovie.movieGenre}</span><br/>	
						</div>
					</div>
					<div class="movie-preview" id="movie-preview-${contentMovie.movieNo}">
						
					</div>
				</article>
			</c:forEach>
		</div>
	</section>
	<input type="hidden" id="movieNewInput" value=""/>
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
			$(".movie-preview-btn").on("click", function(){
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
			
			 $('.content-model-btn').on('click', function(){
				var content = $(this).data("content");
				$('#movieNewInput').val(content);
			})
		}) 
	</script>
</body>
</html> 