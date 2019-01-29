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
		<link rel="stylesheet" href="/css/scroll/main_movie.css">
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
				<article class="content-movie">
					<div class="movie">
						<a href="#">
							<img class="poster" src="${contentMovie.movieThumbnail}">
						</a>
						<div>
							<p>${contentMovie.movieTitle}</p>
							<span class="field">개봉일</span>  <span>${contentMovie.movieOpenDate}</span>
							<span class="field">상영 시간</span> <span>${contentMovie.movieRunningTime}</span><br/>	
							
							<span class="field">감독</span> <span>${contentMovie.movieDirector}</span><br/>
							<span class="field">배우</span> <span>${contentMovie.movieActor}</span><br/>
							<span class="field">장르</span> <span>${contentMovie.movieGenre}</span><br/>										
							<button class="movie-preview-btn" type="button" data-no="${contentMovie.movieNo}" data-link='${contentMovie.movieVideo}'>예고편</button>
							<button class="content-model-btn" type="button" data-toggle="modal" data-target="#myFullsizeModal" data-content="${contentMovie.movieLink}">더 보기</button>		
						</div>
					</div>
					<div class="movie-preview" id="movie-preview-${contentMovie.movieNo}">
						
					</div>
				</article>
			</c:forEach>
		</div>
	</section>
	<input type="hidden" id="movieUpcomingInput" value=""/>
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
				$('#movie-preview-'+no).html(link+'<button class="movie-preview-close-btn" data-no="'+no+'" type="button">back</button>');
				
				$(".movie-preview-close-btn").on("click", function(){
					var no = $(this).data("no");
					$('#movie-preview-'+no).html('');
					$('#movie-preview-'+no).attr('style','display:none;');
				});
				
				$('#movie-preview-'+no).attr('style','display:block;');
			});
			
			 $('.content-model-btn').on('click', function(){
				var content = $(this).data("content");
				//$('.modal-body').html('<iframe class="content-modal" src="'+content+'" />');
				$('#movieUpcomingInput').val(content);
			})
		}) 
	</script>
</body>
</html>