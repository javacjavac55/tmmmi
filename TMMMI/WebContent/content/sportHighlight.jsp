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
<style>
	.carousel {
		background-color: ${bgColor};
	}
	
	.section-title {
		color: ${fontColor};
	}
	
	.scrap-btn {
		position: absolute;
	    top: -38px;
	    right: 0;
	    background-color: #123456;
	    color: white;
	    padding: 0 10px;
	    border-radius: 5px;
	    font-size: medium;
	    cursor: pointer;
	}
</style>
</head>
	<body>
		<section class="carousel">
			<div><span class="section-title">���̶���Ʈ</span></div>
			<div class="reel" style="overflow: visible; transform: translate(-1285px, 0px);">
				<c:forEach var="sport" items="${contentSport}">
					<article class="content-sport-highlight">
						<div class="sport">
							<a href="#">
								<img class="videoThmb" src="${sport.sportThumbnail}" data-no="${sport.sportNo}" data-link="${sport.sportVideo}" />
							</a>
							<div class="play-btn"></div>
						</div>
						<div class="highlight-title">
							${sport.sportTitle}
						</div>
						<div class="sport-highlight" id="sport-highlight-${sport.sportNo}">
								
						</div>
						<div class="scrap-btn">��ũ��</div>	
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
		<script src="/javascript/scroll/refresh.js"></script>
		<script>
			$(function(){
				$(document).on("click",'.play-btn', function(){
					var no = $(this).prev().children().data("no");
					
					$.ajax({
						url : "/contentSportRest/getContentHighlightVideo",
						method : "POST",
						data: JSON.stringify({
							sportNo:no,
						}),
						dataType: "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status) {
							var link = JSONData.sportVideo;
							$('#sport-highlight-'+no).html(link+'<div class="sport-highlight-close-btn" data-no="'+no+'"></div>');
							
							$(".sport-highlight-close-btn").on("click", function(){
								var no = $(this).data("no");
								$('#sport-highlight-'+no).html('');
								$('#sport-highlight-'+no).attr('style','display:none;');
							});
							
							$('#sport-highlight-'+no).attr('style','display:block;');
						}
					});	
				});
				
				var count = 0;
				var more = true;
				$(document).on('click', '.forward', function(){
					count+=1;
					
					if (more) {
						$.ajax({
							url : "/contentSportRest/getContentHighlightList?index="+count,
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
												'<article class="content-sport-highlight" style="padding-top:5px;">'+
													'<div class="sport">'+
														'<a href="#">'+
															'<img class="videoThmb" src="'+item.sportThumbnail+'" data-no="'+item.sportNo+'" data-link="'+item.sportVideo+'"/>'+	
														'</a>'+
														'<div class="play-btn"></div>'+
													'</div>'+
													'<div class="highlight-title">'+	
														item.sportTitle+
													'</div>'+	
													'<div class="sport-highlight" id="sport-highlight-'+item.sportNo+'">'+													
													'</div>'+
													'<div class="scrap-btn">��ũ��</div>'+
												'</article>'
										);
									});
									refresh();
									parent.bind('ContentHighlightList');
								}
							}
						});
					}
				})
			})
		</script>
	</body>
</html>