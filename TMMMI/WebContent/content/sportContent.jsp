<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<link href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
	rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href=/css/template/main.css>
<link rel="stylesheet" href="assets/css/main.css" />

<script type="text/javascript">
	$(function() {

		$('#back').on("click", function() {
			self.location = "/index.jsp";
		});
	});
</script>

<style>
#giyong {
	width: 200px;
}

img {
	width: 200px;
	height: 200px;
}
</style>
</head>
<body>

	<div class="navbar  navbar-default">
		<div class="container">
			<a class="navbar-brand" href="/index.jsp">Tmmmi</a>
		</div>
	</div>
	
	<c:import url="/content/getContentKsoccerList">
	</c:import>
	<c:import url="/content/getContentWsoccerList">
	</c:import>
	<c:import url="/content/getContentKbaseballList">
	</c:import>
	<c:import url="/content/getContentWbaseballList">
	</c:import>
	<c:import url="/content/getContentBasketballList">
	</c:import>
	<c:import url="/content/getContentGeneralList">
	</c:import>

	<form class="form-inline" name="detailForm" align="center">
		<button type="button" id="back">È¨À¸·Î</button>
	</form>
</body>
</html>