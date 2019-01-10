<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> contentBox </title>
	
	<!-- ���� : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<style>
		
		 body, button { font-family: ���� ���; font-size: 11pt; text-decoration: none; } 
		
		li { float: left; margin-right: 50px; list-style: none; }
		
		li.thumbnail  { width: 310px; height: 400px; } /* �����̳� ũ������ */
		div.thumbnail_images { width: 300px; height: 230px; } /* ���� ũ�� ����*/
		
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
		
		/* div h3 { /* �� �Ѿ�� ...���� ���� */
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
		} �ٸ��� �������� ��������� ����� */
		
	</style>
   	
	<script type="text/javascript">
	
		/* ���μ��� ���� ���ϰ� �ڸ��� js */
		window.onload = function() {
		  var divs = document.querySelectorAll('li > div');
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
	    <p>4:3 ��������</p>
	    <div class="thumbnail_images"><img src="/images/123.jpg"> </div>
	    <span>���� ���� : ������ ���� ���� �丷�� �����ϰ� ������ �ʰ� �� �̾ ���� ��. ���� �ø� �ٱ۷� �ٲ� �� ������. �ڱ� ������ ������ �ڼ��� �����Ϸ��� ������ �ٱ��� </span> <!-- �ڵ����� ������ -->
	    <span>���� ���� : ���� �� �ñ��� Honey ������ ���� ��Ƶ� ��Ʈ�κ��� �� �� �ڳ� ĵ�� �� ã�� �� Baby... ���� ���� �� �ñ��� Honey ������ ���� ��Ƶ� ��Ʈ�κ��� �� �� �ڳ� ĵ�� �� ã�� �� Baby</span>
	 	</li>
	 </div>
	</ul>

	</body>

</html>
	