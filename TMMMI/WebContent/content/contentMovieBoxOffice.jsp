<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Box Office</title>
		
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
		<div><span class="section-title">박스 오피스</span></div>
		<div class="reel" style="overflow: visible; transform: translate(-1285px, 0px);">
			<c:forEach var="contentMovie" items="${contentMovieBoxOfficeList}">
				<article class="content-movie">
					<div class="movie">
						<a href="#">
							<img class="poster" src="${contentMovie.movieThumbnail}">
							<c:if test="${! empty contentMovie.movieVideo}">	
								<button class="movie-preview-btn" type="button" data-no="${contentMovie.movieNo}" data-link='${contentMovie.movieVideo}'></button>
							</c:if>	
						</a>
						<div class="movie-info">	
							<button class="content-model-btn movie-title" type="button" data-content="${contentMovie.movieLink}">${contentMovie.movieTitle}</button><br/>
							<span class="field">개봉일</span>  <span class="detail">${contentMovie.movieOpenDate}</span><br/>
							<span class="field">일간 관객수</span> <span class="detail">${contentMovie.movieDayAudience}</span><br/>
							<span class="field">누적 관객수</span> <span class="detail">${contentMovie.movieTotalAudience}</span><br/>
						</div>	
					</div>
					<div class="movie-preview" id="movie-preview-${contentMovie.movieNo}">
						
					</div>	
				</article>
			</c:forEach>
		</div>
	</section>
	<input type="hidden" id="movieBoxOfficeInput" value=""/>
	<!-- Carousel JS -->
	<script src="/javascript/scroll/jquery.dropotron.min.js"></script>
	<script src="/javascript/scroll/jquery.scrolly.min.js"></script>
	<script src="/javascript/scroll/jquery.scrollex.min.js"></script>
	<script src="/javascript/scroll/browser.min.js"></script>
	<script src="/javascript/scroll/breakpoints.min.js"></script>
	<script src="/javascript/scroll/util.js"></script>
	<script src="/javascript/scroll/main.js"></script>
	<script src="/javascript/scroll/refresh.js"></script>
	<script>
		function bind() {
			$('.content-model-btn').on('click', function(){
				var content = $(this).data("content");
				$('#movieBoxOfficeInput').val(content);
			});
		}
	
		$(function(){
			$(document).on("click", '.movie-preview-btn', function(){
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
			
			bind();	
			
			var count = 0;
			var more = true;
			$(document).on('click', '.forward', function(){
				count+=1;
				
				if (more) {
					$.ajax({
						url : "/contentMovieRest/getContentMovieBoxOffice?index="+count,
						method : "GET",
						dataType: "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status) {
							console.log(JSONData);
							if (JSONData.length==0) {
								more = false;
							} else {
								JSONData.forEach(function (item, index, array) {
									var video = '';
									if (item.movieVideo) {
										video = '<button class="movie-preview-btn" type="button" data-no="'+item.movieNo+'"' + " data-link='"+item.movieVideo+"'></button>";
									}
									$('.reel').append(
											'<article class="content-movie">'+
												'<div class="movie">'+
													'<a href="#">'+
														'<img class="poster" src="'+item.movieThumbnail+'">'+
														video+	
													'</a>'+
													'<div class="movie-info">'+	
														'<button class="content-model-btn movie-title" type="button" data-content="'+item.movieLink+'">'+item.movieTitle+'</button><br/>'+
														'<span class="field">개봉일</span>  <span class="detail">'+item.movieOpenDate+'</span><br/>'+
														'<span class="field">일간 관객수</span> <span class="detail">'+item.movieDayAudience+'</span><br/>'+
														'<span class="field">누적 관객수</span> <span class="detail">'+item.movieTotalAudience+'</span><br/>'+
													'</div>'+	
												'</div>'+
												'<div class="movie-preview" id="movie-preview-'+item.movieNo+'">'+
												'</div>'+	
											'</article>'
									);
								});
								refresh();
								bind();
								parent.bind('ContentMovieBoxOffice');
							}
						}
					});
				}
			})
		}) 
	</script>
</body>
</html>