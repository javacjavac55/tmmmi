<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<meta name="referrer" content="no-referrer" />
		<title>userKeyword</title>
		
		<!-- Carousel CSS -->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<link rel="stylesheet" href="/css/scroll/main_userSearch.css">
		<noscript><link rel="stylesheet" href="/css/scroll/noscript.css" /></noscript>
		<script type="text/javascript">
			function fncImageCrop() {
				var divs = document.querySelectorAll('article > div > div > div');
				  for (var i = 0; i < divs.length; ++i) {
				    var div = divs[i];
				    var divAspect = div.offsetHeight / div.offsetWidth;
				    div.style.overflow = 'hidden';
				    
				    var img = div.querySelector('img');
				    if (img) {
					    var imgAspect = img.height / img.width;
					
					    if (imgAspect <= divAspect) {
					      // 이미지가 div보다 납작한 경우 세로를 div에 맞추고 가로는 잘라낸다
					      var imgWidthActual = div.offsetHeight / imgAspect;
					      var imgWidthToBe = div.offsetHeight / divAspect;
					      var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2)
					      img.style.cssText = 'width: auto; height: 100%; margin-left: '
					                      + marginLeft + 'px;'
					    } else {
					      // 이미지가 div보다 길쭉한 경우 가로를 div에 맞추고 세로를 잘라낸다
					      img.style.cssText = 'width: 100%; height: auto; margin-left: 0;';
					    }
				    }
				  }
			}				  
		</script>
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
		<div><span class="section-title">${userSearch}</span></div>
		<div class="reel" style="overflow: visible; transform: translate(-1285px, 0px); ">
			<c:forEach var="contentUserKeyword" items="${userKeywordThirdList}">				
				<article class="content-userSearch">
					<div class="userSearch">
						<div>
							<div class="user-keyword-title">${contentUserKeyword.keywordTitle}</div>
							<!-- <div class="quote-left">"</div> -->
							<div class="user-keyword-thumbnail-wrap">
								<c:if test="${! empty contentUserKeyword.keywordVideo}">
									<c:choose>
										<c:when test="${contentUserKeyword.keywordVideo eq 'http://blogimgs.naver.net/imgs/nblog/spc.gif' }">야호</c:when>
										<c:otherwise><img class="user-keyword-thumbnail" src="${contentUserKeyword.keywordVideo}"></c:otherwise>
									</c:choose>
								</c:if>
								<c:if test="${empty contentUserKeyword.keywordVideo }"></c:if>
							</div>
							<div class="user-keyword-detail">${contentUserKeyword.keywordDescription}</div>
							<!-- <div class="quote-right">"</div> -->
						</div>	
						<div>
							<button class="content-model-btn userKeyword-btn" type="button" data-content="${contentUserKeyword.keywordLink}">더보기</button>
						</div>
					</div>
				</article>
			</c:forEach>
		</div>
	</section>
	<input type="hidden" id="userSearchThirdInput" value="" />
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
				console.log(content);
				$('#userSearchThirdInput').val(content);
			});
		}
		
		$(function() {
			fncImageCrop();
			bind();
			
			var count = 0;
			var more = true;
			
			$(document).on('click', '.forward', function(){
				count+=1;
				if (more) {
					$.ajax({
						url : "/contentKeywordRest/getUserKeywordListThird?index="+count,
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
											'<article class="content-userSearch">'+
												'<div class="userSearch">'+
													'<div>'+
														'<div class="user-keyword-title">'+item.keywordTitle+'</div>'+
														/* '<div class="quote-left"></div>'+ */
														'<div class="user-keyword-thumbnail-wrap"><img class="user-keyword-thumbnail" src="'+item.keywordVideo+'"></div>'+
														'<div class="user-keyword-detail">'+item.keywordDescription+'</div>'+
														/* '<div class="quote-right">"</div>'+ */
													'</div>'+
													'<div>'+
														'<button class="content-model-btn userKeyword-btn" type="button" data-content="'+item.keywordLink+'">더보기</button>'+
													'</div>'+
												'</div>'+	
											'</article>'
									);
								});
								refresh();
								$('article > div > div > div > img').on('load', function(){
									fncImageCrop();
								})
								bind();
								parent.bind('UserKeywordListThird');	
							}
						}
					});
				}
			})
		})
	</script>
</body>
</html>