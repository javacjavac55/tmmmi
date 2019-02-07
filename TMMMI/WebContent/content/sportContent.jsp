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

</head>
<body>

	<div class="navbar  navbar-default">
		<div class="container">
			<a class="navbar-brand" href="/index.jsp">Tmmmi</a>
		</div>
	</div>
	
	<c:import url="/contentSport/getContentKsoccerList">
	</c:import>
	<c:import url="/contentSport/getContentWsoccerList">
	</c:import>
	<c:import url="/contentSport/getContentKbaseballList">
	</c:import>
	<c:import url="/contentSport/getContentWbaseballList">
	</c:import>
	<c:import url="/contentSport/getContentBasketballList">
	</c:import>
	<c:import url="/contentSport/getContentGeneralList">
	</c:import>
	<c:import url="/contentSport/getContentHighlightList">
	</c:import>

</body>
</html>