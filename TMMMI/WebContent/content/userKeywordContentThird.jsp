<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>userKeyword</title>
		
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
		
		
<style>
	.carousel article{
		vertical-align : middle;
		padding-top : 40px;
		width: 356px;
		height: 518px;
		position : relative;
		border-radius : 15px;
		text-align : left;
	}
	#ganziGiyong{
		position : absolute;
		top : 300px;
		left : 152px;
	}
	#giyong{
		margin-top : 10em;
	}
</style>
		
	</head>
<body>
	
	<section class="carousel" style="background-color:#1d1d1d; vertical-align : middle">
		<div class="reel" style="overflow: visible; transform: translate(-1285px, 0px); ">
			<!-- items : 받아올 배열이름 var=내부에서 사용할변수 -->
			<c:forEach var="contentUserKeyword" items="${userKeywordThirdList}">				
				<article>
					${contentUserKeyword.keywordTitle }
					${contentUserKeyword.keywordDescription}
					<p>
						<a href="${contentUserKeyword.keywordLink}" class="image featured">
							<div id="ganziGiyong">
								<button id="giyong"class="btn btn-primary btn-round btn-sm">
								  <i class="material-icons" style="font-size:10px;">favorite</i> 보러가기
								</button>
							</div>
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