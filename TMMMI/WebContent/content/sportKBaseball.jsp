<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>kBaseball</title>

<!-- Carousel CSS -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="/css/scroll/main_sport.css">
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
		<div><span class="section-title">국내 야구</span></div>
		<div class="reel" style="overflow: visible; transform: translate(-1285px, 0px);">
			<c:forEach var="sport" items="${contentSport}">
				<article class="content-sport">
					<div class="sport">
						<a href="#"> 
							<img class="sport-thumbnail" src="${sport.sportThumbnail}">
						</a> 
					</div>
					<div class="sport-title">
						${sport.sportTitle}
					</div>
					<div>
						<button class="content-model-btn sport-btn" type="button" data-content="${sport.sportLink}">더보기</button>
					</div>
				</article>
				
			</c:forEach>

		</div>
	</section>
	<input type="hidden" id="kBaseballInput" value="" />
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
				$('#kBaseballInput').val(content);
			});
		}
		$(function() {	
			bind();
			
			var count = 0;
			var more = true;
			$(document).on('click', '.forward', function(){
				count+=1;
				
				if (more) {
					$.ajax({
						url : "/contentSportRest/getContentKbaseballList?index="+count,
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
									$('.reel').append(
											'<article class="content-sport" style="padding-top:5px;">'+
												'<div class="sport">'+
													'<a href="#">'+
														'<img class="sport-thumbnail" src="'+item.sportThumbnail+'">'+	
													'</a>'+
												'</div>'+
												'<div class="sport-title">'+	
													item.sportTitle+
												'</div>'+	
												'<div>'+
												'<button class="content-model-btn sport-btn" type="button" data-content="'+item.sportLink+'">'+'더보기</button>'+
												'</div>'+	
											'</article>'
									);
								});
								refresh();
								bind();
								parent.bind('ContentKbaseballList');
							}
						}
					});
				}
			})
		})
	</script>
</body>
</html>