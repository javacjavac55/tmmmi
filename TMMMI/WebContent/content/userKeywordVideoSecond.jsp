<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>ShoppingReviewContent</title>
		
		<!-- Carousel CSS -->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<link rel="stylesheet" href="/css/scroll/main_shopping.css">
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
		<div><span class="section-title">${userVideoSecondList[0].keywordLink}</span></div>
		<div class="reel" style="overflow: visible; transform: translate(-1285px, 0px); ">
			<c:forEach var="contentUserVideo" items="${userVideoSecondList}">				
				<article class="content-shopping-review">
					<div class="shopping">
						<a href="#">
							<div class="shopping-videoThmb-wrap">
								<img class="shopping-videoThmb" src="${contentUserVideo.keywordThumbnail}" data-no="${contentUserVideo.reviewNo}" data-link='${contentUserVideo.keywordVideoId}' />
							</div>
						</a>
						<div class="play-btn"></div>
					</div>
					<div class="shopping-review-title">
						${contentUserVideo.keywordTitle}
					</div>
					<div class="shopping-review-channel">
						${contentUserVideo.keywordVideo}
					</div>
					<div class="shopping-review-detail">
						<span>${contentUserVideo.keywordDescription}</span> 
					</div>
					<div class="shopping-review" id="userKeyword-review-${contentUserVideo.reviewNo}">
					
					</div>
					<div class="scrap-btn">스크랩</div>	
				</article>
			</c:forEach>
			<input type="hidden" value="${userVideoSecondList[0].keywordNextToken}" id="pageToken">
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
			$(document).on('click', '.play-btn', function(){
				console.log("clicked",$(this).prev());
				var no = $(this).prev().children().children().data("no");
				var link = $(this).prev().children().children().data("link");
				$('#userKeyword-review-'+no).html(link+'<div class="shopping-review-close-btn" data-no="'+no+'"></div>');
				
				$(".shopping-review-close-btn").on("click", function(){
					var no = $(this).data("no");
					$('#userKeyword-review-'+no).html('');
					$('#userKeyword-review-'+no).attr('style','display:none;');
				});
				
				$('#userKeyword-review-'+no).attr('style','display:block;');
			});
				var count = 0;
				var more = true;
							
				$(document).on('click', '.forward', function(){			
					count+=1;
					var pageToken = $("#pageToken").val();
					console.log(pageToken)
								
					if (more) {
						$.ajax({
							url : "/contentKeywordRest/getUserVideoListSecond?index="+count+"&pageToken="+pageToken,
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
												'<article class="content-shopping-review">'+
													'<div class="shopping">'+
														'<a href="#">'+
															'<div class="shopping-videoThmb-wrap">'+
																'<img class="shopping-videoThmb" src="'+ item.keywordThumbnail+ '" data-no="'+item.reviewNo+'"'+" data-link='"+item.keywordVideoId+"' />"+
															'</div>'+
														'</a>'+
														'<div class="play-btn"></div>'+
													'</div>'+
													'<div class="shopping-review-title">'+
														item.keywordTitle+
													'</div>'+
													'<div class="shopping-review-channel">'+
														item.keywordVideo+
													'</div>'+
													'<div class="shopping-review-detail">'+
														'<span>'+item.keywordDescription+'</span> '+
													'</div>'+
													'<div class="shopping-review token" id="userKeyword-review-'+item.reviewNo+'">'+
													
													'<input type="hidden" value="'+item.keywordNextToken+'" class="pageToken'+item.keywordNextToken+'">'+
													
													'</div>'+
													'<div class="scrap-btn">스크랩</div>'+
												'</article>'
										);
									});
									refresh();
									parent.bind('UserVideoListSecond');
									$('#pageToken').val(JSONData[0].keywordNextToken);
								}
							}
						});
					}
				})
			});
			
		</script>
	</body>
	</html>