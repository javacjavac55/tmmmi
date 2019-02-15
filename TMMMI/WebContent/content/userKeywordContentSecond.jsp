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
			<c:forEach var="contentUserKeyword" items="${userKeywordSecondList}">				
				<article class="content-userSearch">
					<div class="userSearch">
						<div>
							<div class="user-keyword-title">${contentUserKeyword.keywordTitle}</div>
							<div class="quote-left">"</div>
							<div>
								<c:if test="${! empty contentUserKeyword.keywordVideo }"><img src="${contentUserKeyword.keywordVideo}" width="80%" height="40%"></c:if>
								<c:if test="${empty contentUserKeyword.keywordVideo }"></c:if>
							</div>
							<div class="user-keyword-detail">${contentUserKeyword.keywordDescription}</div>
							<div class="quote-right">"</div>
						</div>	
						<div>
							<button class="content-model-btn userKeyword-btn" type="button" data-content="${contentUserKeyword.keywordLink}">더보기</button>
						</div>
					</div>
				</article>
			</c:forEach>
		</div>
	</section>
	<input type="hidden" id="userSearchFirstInput" value="" />
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
		$(function() {
			$('.content-model-btn').on('click', function() {
				var content = $(this).data("content");
				$('#userSearchSecondInput').val(content);
			})
			
			var count = 0;
			var more = true;
			$(document).on('click', '.forward', function(){
				count+=1;
				
				if (more) {
					$.ajax({
						url : "/contentKeywordRest/getUserKeywordListSecond?index="+count,
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
														'<div class="quote-left"></div>'+
														'<div><img src="'+item.keywordVideo+'" width="80%" height="40%"></div>'+
														'<div class="user-keyword-detail">'+item.keywordDescription+'</div>'+
														'<div class="quote-right">"</div>'+
													'</div>'+
													'<div>'+
														'<button class="content-model-btn userKeyword-btn" type="button" data-content="'+item.keywordLink+'">더보기</button>'+
													'</div>'+
												'</div>'+	
											'</article>'
									);
								});
								refresh();
							}
						}
					});
				}
			})
		})
	</script>
</body>
</html>