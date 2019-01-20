<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>메인 컨텐츠</title>
	<link href="resorces/css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
	<script type="text/javascript" src="resorces/scroll/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="resorces/scroll/jquery.mousewheel.min.js"></script>
</head>
<body>
	<div id="container">
		<div class="customScrollBox">
			<div class="container">
			<c:forEach var="userSearch" items="${list }">
				<div class="thumbnail" style="height:400px;">
					<img src="resources/images/diaryImage/1547701429773.jpeg" style="height:200px;"/>
					<div class="caption">
						<h3>${userSearch.description }</h3>
					</div>
				</div>
			</c:forEach>
			</div>		
		</div>
	</div>
</body>
</html>