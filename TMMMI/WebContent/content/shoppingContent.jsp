<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>ShoppingContent</title>
		
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		
		<!-- Material Kit CSS -->
		<link href="/css/template/material-kit.min.css?v=2.0.5" rel="stylesheet" />
		<!-- Carousel CSS -->
		<link rel="stylesheet" href="/css/scroll/main.css">
		<noscript><link rel="stylesheet" href="/css/scroll/noscript.css" /></noscript>
	
		<!-- Material Kit JS -->
		<script src="/javascript/template/core/jquery.min.js" type="text/javascript"></script>
		<script src="/javascript/template/core/popper.min.js" type="text/javascript"></script>
		<script src="/javascript/template/core/bootstrap-material-design.min.js" type="text/javascript"></script>
		<script async defer src="https://buttons.github.io/buttons.js"></script>
		<script src="/javascript/template/material-kit.js?v=2.0.5" type="text/javascript"></script>
		
		<!--     Fonts and icons     -->
		<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
		
		<script type="text/javascript">
			window.onload = function() {
				var divs = document.querySelectorAll('article > div');
				  for (var i = 0; i < divs.length; ++i) {
				    var div = divs[i];
				    var divAspect = div.offsetHeight / div.offsetWidth;
				    div.style.overflow = 'hidden';
				    
				    var img = div.querySelector('img');
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
			};
			
		/* 	$(function() {
				$(".titleShopping").hover(){
					$(this).css("border-bottom", "2px;");
				 });
			 }); */
			
			
		</script>
		<style>
		
			body{
				 font-size: 15px;
				 line-height: 0.4;
				 font-family: '돋움',dotum,sans-serif;
				 /* cursor:pointer; */
			}
		
			div h4 { /*텍스트 길이제한 */
			  overflow: hidden; 
			  text-overflow: ellipsis;
			  white-space: nowrap; 
			  width: 300px;
			  height: 25px;
			  letter-spacing: -1px;
			  font-weight: bold;
			}
			
			b {
				font-weight: bold;
			}
			.image:hover img {
				 transform:scale(1.2);
				 border-bottom:2px
			}
		</style>

		
	</head>
<body>
	<section class="carousel" style="background-color:#1d1d1d;">
		<div class="reel" style="overflow: visible; transform: translate(-1285px, 0px); ">
			<!-- items : 받아올 배열이름 var=내부에서 사용할변수 -->
			<c:forEach var="contentShopping" items="${shoppingContentList}">				
				<article style="width: 356px; height: 518px;">
					<div style="width: 300px; height: 380px; overflow: hidden; margin-top:18px;" class="image">
						<img src="${contentShopping.shoppingThumbnail}" style="width: 350px; height: 450; margin-left: -30px; margin-top: -30px;">	
					</div>
					<h4 style="margin-top: -25px;"class="titleShopping">${contentShopping.shoppingTitle}</h4>
					<%-- <a href="${contentShopping.shoppingLink}" class="image featured"></a> --%>
					<span style="color: #575757">
						${contentShopping.shoppingPrice} 원
					</span>
					<p>
						<a href="${contentShopping.shoppingLink}" class="image featured">
							<button class="btn btn-primary btn-round btn-sm" style="margin-top:14px;">
							  <i class="material-icons" style="font-size:10px;">favorite</i> 보러가기
							</button>
						</a>
					</p>
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
</body>
</html>