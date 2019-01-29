<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>contentMovieNewMovie</title>
		
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
			<c:forEach var="contentMovie" items="${contentMovieNewMovieList}">
				<article class="content-movie">
					<div class="movie">
						<a href="#" >
							<img class="poster" src="${contentMovie.movieThumbnail}">
						</a>
						<div>
							<p>${contentMovie.movieTitle}</p>
							<span class="field">������</span>  <span>${contentMovie.movieOpenDate}</span><br/>
							<span class="field">��Ƽ�� ����</span>  
								<div class="star-ratings-css"> 
									<div class="star-ratings-css-top" style="width:${contentMovie.movieRating*0.95}%;">
										�ڡڡڡڡ�
									</div>
									<div class="star-ratings-css-bottom">
										�ڡڡڡڡ�
									</div>
								</div><span id="movie-rating">${contentMovie.movieRating}</span><br/>
							<span class="field">������</span> <span>${contentMovie.movieReserveRate}</span><br/>
							<span class="field">�� �ð�</span> <span>${contentMovie.movieRunningTime}</span><br/>	
							
							<span class="field">����</span> <span>${contentMovie.movieDirector}</span><br/>
							<span class="field">���</span> <span>${contentMovie.movieActor}</span><br/>
							<span class="field">�帣</span> <span>${contentMovie.movieGenre}</span><br/>	
							<button class="movie-preview-btn" type="button" data-no="${contentMovie.movieNo}" data-link='${contentMovie.movieVideo}'>������</button>
							<button class="content-model-btn" type="button" data-toggle="modal" data-target="#myFullsizeModal" data-content="${contentMovie.movieLink}">�� ����</button>		
						</div>
					</div>
					<div class="movie-preview" id="movie-preview-${contentMovie.movieNo}">
						
					</div>
				</article>
			</c:forEach>
		</div>
	</section>
	<!-- <div class="modal fade" id="myFullsizeModal" tabindex="-1" role="dialog" aria-labelledby="myFullsizeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-fullsize">
	    <div class="modal-content modal-fullsize">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLongTitle">��ȭ �� ����</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
	  </div> -->
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
				$('#movieNewInput').val(content);
			})
		}) 
	</script>
</body>
</html> 