<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>userVideoContent</title>
		
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
			
		</script>
		<style>
		
			body{
				/*  line-height: 0.4; */
				 /* cursor:pointer; */
			}
		
			h4 { /*타이틀 텍스트 길이제한 */
			  overflow: hidden; 
			  text-overflow: ellipsis;
			  width: 530px;
			  white-space:pre-wrap;
			  height: 25px;
			  letter-spacing: -1px;
			  font-weight: bold;
			} 
			
			.detail { /*디테일 텍스트 길이제한 */
			  overflow: hidden; 
			  text-overflow: ellipsis;
			  width: 550px;
			  height: 40px;
			  font-family: '돋움',dotum,sans-serif;
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
			<!-- items : 받아올 배열이름 var=내부에서 사용할변수 -->
			<c:forEach var="contentUserVideo" items="${userVideoSecondList}">				
				<article style="width: 600px; height: 480px;;">
					<div style="margin-top:12px;">
						<!-- theme=light 밝은색 설정 modestbranding=1 유튜브 로고 없애기 showinfo=0 타이틀 표시 안하기-->
						<embed src="${contentUserVideo.keywordVideoId}?theme=light&modestbranding=1&showinfo=0"  width="560" height="315"></embed>
					</div>
					<h4 style="margin-top: 10px;"class="titleShopping">${contentUserVideo.keywordTitle}</h4>
					<p class="detail" >
						${contentUserVideo.keywordDescription} 
					</p>
					<p class="channel" style="font-size:18px; text-align:left; margin-left: 18px; margin-top: -15px;">
						${contentUserVideo.keywordVideo} 
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