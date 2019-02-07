<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>ShoppingReviewContent</title>
		
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
		
		$(function(){
			$("embed").on("click", function(){
				var no = $(this).data("no");
				var link = $(this).data("link");
				console.log(no)
				console.log(link)
				
				$('#review'+no).append("<embed src=link></embed>");
				<embed src="http://www.youtube.com/embed/duOSXXzvt4M"></embed>
				
				$('#review'+no).attr('style','display:block;');
			});	
		})
			
		</script>
		<style>
		
			body{
				/*  line-height: 0.4; */
				 /* cursor:pointer; */
			}
		
			h4 { /*Ÿ��Ʋ �ؽ�Ʈ �������� */
			  overflow: hidden; 
			  text-overflow: ellipsis;
			  width: 530px;
			  white-space:pre-wrap;
			  height: 25px;
			  letter-spacing: -1px;
			  font-weight: bold;
			} 
			
			.detail { /*������ �ؽ�Ʈ �������� */
			  overflow: hidden; 
			  text-overflow: ellipsis;
			  width: 550px;
			  height: 40px;
			  font-family: '����',dotum,sans-serif;
			  font-size: 17px;
			  line-height: 1.25em; 
			} 
			
			/* b {
				font-weight: bold;
			} */
		
		</style>

		
	</head>
<body>
	<section class="carousel" style="background-color:#1d1d1d;">
		<div class="reel" style="overflow: visible; transform: translate(-1285px, 0px); ">
			<!-- items : �޾ƿ� �迭�̸� var=���ο��� ����Һ��� -->
			<c:forEach var="contentReviewShopping" items="${shoppingContentReviewList}">				
				<article style="width: 600px; height: 430px; ">
					<div style="margin-top: 2.5%; max-width:540px; max-height: 290px;  overflow: hidden; margin-left: 1.5%;">
						<!-- theme=light ������ ���� modestbranding=1 ��Ʃ�� �ΰ� ���ֱ� showinfo=0 Ÿ��Ʋ ǥ�� ���ϱ�-->
						<embed src="${contentReviewShopping.shoppingVideoThumbnail}" style="width:100%; height:100%; margin-top: -11%; cursor:pointer;"data-no="${contentReviewShopping.reviewNo}" data-link='${contentReviewShopping.shoppingVideoId}'></embed>
					</div>
					<h4 style="margin-top:10px; margin-left: 3%;"class="titleShopping">${contentReviewShopping.shoppingVideoTitle}</h4>
					<p class="detail" >
						${contentReviewShopping.shoppingVideoDetail} 
					</p>
					<p class="channel" style="font-size:18px; text-align:left; margin-left: 18px; margin-top: -15px;">
						${contentReviewShopping.shoppingVideoChannel} 
					</p>
					
					<div class="movie-trailer-preview" id="review${contentReviewShopping.reviewNo}">
					</div>
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