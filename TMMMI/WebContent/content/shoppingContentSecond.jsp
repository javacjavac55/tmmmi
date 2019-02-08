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
			window.onload = function() {
				var divs = document.querySelectorAll('article > div > a');
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
	</head>
<body>
	
	<section class="carousel">
		<div><span class="section-title">���� Ű���� 2</span></div>
		<div class="reel" style="overflow: visible; transform: translate(-1285px, 0px); ">
			<c:forEach var="contentShopping" items="${shoppingContentSecondList}">				
				<article class="content-shopping">
					<div class="shopping">
						<a href="#"> 
							<img class="shopping-thumbnail" src="${contentShopping.shoppingThumbnail}">
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
	<script>
		$(function() {
			$('.content-model-btn').on('click', function() {
				var content = $(this).data("content");
				$('#shoppingSecondInput').val(content);
			})
		})
	</script>
</body>
</html>