<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> contentBox </title>
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<style>
		
		 body, button { font-family: 맑은 고딕; font-size: 11pt; text-decoration: none; } 
		
		li { float: left; margin-right: 50px; list-style: none; }
		
		li.thumbnail  { width: 310px; height: 400px; } /* 컨테이너 크기조절 */
		div.thumbnail_images { width: 300px; height: 230px; } /* 사진 크기 조절*/
		
		.clearfix:after {
		   content: " ";
		   visibility: hidden;
		   display: block;
		   height: 0;
		   clear: both;
		}
		
		div span {
  			display: -webkit-box; 
  			display: -ms-flexbox; 
  			display: box; 
  			margin-top:1px; 
  			max-height:60px; 
  			overflow:hidden; 
  			vertical-align:top; 
  			text-overflow: ellipsis; 
  			word-break:break-all; 
  			-webkit-box-orient:vertical; 
  			-webkit-line-clamp:3 
  		}
		
		/* div h3 { /* 줄 넘어가면 ...으로 생략 */
  			white-space: normal; 
  			line-height: 1.2; 
  			height: 3.6em; 
  			text-align: left; 
  			word-wrap: break-word; 
  			display: -webkit-box; 
  			-webkit-line-clamp: 3; 
  			-webkit-box-orient: vertical;
		} */
		
		/* .footer {
		  width: 600px; text-align: center; margin-top: 5em;
		} 다른것 돌려보고 상관없으면 지우기 */
		
	</style>
   	
	<script type="text/javascript">
	
		/* 가로세로 비율 비교하고 자르는 js */
		window.onload = function() {
		  var divs = document.querySelectorAll('li > div');
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
		  
		  var btn = document.querySelector('#btnToggleOverflow');
		  btn.onclick = function() {
		    var val = divs[0].style.overflow == 'hidden' ? 'visible' : 'hidden';
		    for (var i = 0; i < divs.length; ++i)
		      divs[i].style.overflow = val;
		  };
		};

	</script>	
</head>

	<body>
	
	<br><br>
	<ul class="clearfix">	
	<div class="col-sm-6 col-md-2" >
	  <li class="thumbnail">
	    <p>4:3 비율으로</p>
	    <div class="thumbnail_images"><img src="/images/123.jpg"> </div>
	    <span>제목 시작 : 명사글자 수나 글의 토막을 일정하게 맞추지 않고 죽 이어서 지은 글. 다음 시를 줄글로 바꿔 써 보세요. 자기 생각과 느낌을 자세히 설명하려는 경향은 줄글을 </span> <!-- 자동으로 여백줌 -->
	    <span>본문 시작 : 빨간 맛 궁금해 Honey 깨물면 점점 녹아든 스트로베리 그 맛 코너 캔디 샵 찾아 봐 Baby... 갈래 빨간 맛 궁금해 Honey 깨물면 점점 녹아든 스트로베리 그 맛 코너 캔디 샵 찾아 봐 Baby</span>
	 	</li>
	 </div>
	</ul>

	</body>

</html>
	