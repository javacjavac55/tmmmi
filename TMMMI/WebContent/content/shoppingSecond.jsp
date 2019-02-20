<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>ShoppingContent</title>
		
		<!-- Carousel CSS -->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<link rel="stylesheet" href="/css/scroll/main_shopping.css">
		<noscript><link rel="stylesheet" href="/css/scroll/noscript.css" /></noscript>
		<script type="text/javascript">
			function fncImageCrop() {
				var divs = document.querySelectorAll('article > div > a > div');
				  for (var i = 0; i < divs.length; ++i) {
				    var div = divs[i];
				    var divAspect = div.offsetHeight / div.offsetWidth;
				    div.style.overflow = 'hidden';
				    
				    var img = div.querySelector('img');
				    var imgAspect = img.height / img.width;
				
				    if (imgAspect <= divAspect) {
				      // �̹����� div���� ������ ��� ���θ� div�� ���߰� ���δ� �߶󳽴�
				      var imgWidthActual = div.offsetHeight / imgAspect;
				      var imgWidthToBe = div.offsetHeight / divAspect;
				      var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2)
				      img.style.cssText = 'width: auto; height: 100%; margin-left: '
				                      + marginLeft + 'px;'
				    } else {
				      // �̹����� div���� ������ ��� ���θ� div�� ���߰� ���θ� �߶󳽴�
				      img.style.cssText = 'width: 100%; height: auto; margin-left: 0;';
				    }
				  }
			};
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
		<div><span class="section-title">${shoppingContentSecondList[0].shoppingKeyword}</span></div>
		<div class="reel" style="overflow: visible; transform: translate(-1285px, 0px); ">
			<c:forEach var="contentShopping" items="${shoppingContentSecondList}">				
				<article class="content-shopping">
					<div class="shopping">
						<a href="#"> 
							<div class="shopping-thumbnail-wrap">
								<img class="shopping-thumbnail" src="${contentShopping.shoppingThumbnail}">
							</div>
						</a>
						<div class="shopping-info">
							<span class="field">��ǰ</span> <span class="detail">${contentShopping.shoppingTitle}</span>
							<span class="field">����</span> <span class="detail">${contentShopping.shoppingPrice}��</span>
						</div>
						<div>
							<button class="content-model-btn shopping-btn" type="button" data-content="${contentShopping.shoppingLink}">������</button>
						</div>
					</div>
				</article>
			</c:forEach>
		</div>
	</section>
	<input type="hidden" id="shoppingSecondInput" value="" />
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
				$('#shoppingSecondInput').val(content);
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
						url : "/contentShoppingRest/getShoppingListSecond?index="+count,
						method : "GET",
						dataType: "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status) {
							/* console.log(JSONData); */
							if (JSONData.length==0) {
								more = false;
							} else {
								JSONData.forEach(function (item, index, array) {
														
									$('.reel').append(
											'<article class="content-shopping">'+
											'<div class="shopping">'+
											'<a href="#">'+ 
												'<div class="shopping-thumbnail-wrap">'+
													'<img class="shopping-thumbnail" src="' + item.shoppingThumbnail+ '">'+				
												'</div>'+
											'</a>'+
											'<div class="shopping-info">'+
												'<span class="field">��ǰ</span> <span class="detail">' +item.shoppingTitle +'</span>'+
												'<span class="field">����</span> <span class="detail">' +item.shoppingPrice +'��</span>'+
											'</div>'+
											'<div>'+
												'<button class="content-model-btn shopping-btn" type="button" data-content="'+ item.shoppingLink+'">������</button>'+
											'</div>'+
										'</div>'+
									'</article>'
									);
								});
								refresh();
								fncImageCrop();
								bind();
								parent.bind('ShoppingListSecond');	
							}
						}
					});
				}
			})
		});
		
	</script>
</body>
</html>