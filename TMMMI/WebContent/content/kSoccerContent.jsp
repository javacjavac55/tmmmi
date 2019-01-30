<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>kSoccer</title>

<!-- Material Kit CSS -->
<link href="/css/template/material-kit.min.css?v=2.0.5" rel="stylesheet" />
<!-- Carousel CSS -->
<link rel="stylesheet" href="/css/scroll/main.css">
<noscript>
	<link rel="stylesheet" href="/css/scroll/noscript.css" />
</noscript>

<!-- Material Kit JS -->
<script src="/javascript/template/core/jquery.min.js"
	type="text/javascript"></script>
<script src="/javascript/template/core/popper.min.js"
	type="text/javascript"></script>
<script src="/javascript/template/core/bootstrap-material-design.min.js"
	type="text/javascript"></script>
<script async defer src="https://buttons.github.io/buttons.js"></script>
<script src="/javascript/template/material-kit.js?v=2.0.5"
	type="text/javascript"></script>
	
	
<style>
.content-sport {
	width: 200px;
}

img {
	width: 200px;
	height: 200px;
}
</style>
</head>
<body>
	<section class="carousel" style="background-color: #1d1d1d;">
		<div class="reel" style="overflow: visible; transform: translate(-1285px, 0px);">
			<c:forEach var="sport" items="${contentSport}">
				<article class="content-sport">
					<div class="sport">
						<a href="#">
						<img class="thumbnail" src="${sport.sportThumbnail}">
						</a>
						${sport.sportTitle}
					<br />
					<button class="content-model-btn" type="button" data-content="${sport.sportLink}">������</button>
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
	<input type="hidden" id="kSoccerInput" value="" />
	<!-- Carousel JS -->
	<script src="/javascript/scroll/jquery.dropotron.min.js"></script>
	<script src="/javascript/scroll/jquery.scrolly.min.js"></script>
	<script src="/javascript/scroll/jquery.scrollex.min.js"></script>
	<script src="/javascript/scroll/browser.min.js"></script>
	<script src="/javascript/scroll/breakpoints.min.js"></script>
	<script src="/javascript/scroll/util.js"></script>
	<script src="/javascript/scroll/main.js"></script>
	<script>
		$(function() {
			$('.content-model-btn').on('click', function() {
				var content = $(this).data("content");
				$('#kSoccerInput').val(content);
			})
		})
	</script>
</body>
</html>