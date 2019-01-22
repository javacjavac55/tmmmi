<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> getWeather </title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- 날씨 아이콘 링크 -->
	<link rel="stylesheet" type="text/css" href="/css/weather/weather-icons-master/css/weather-icons-wind.min.css">
	
	<script type="text/javascript">
	
	$(function() {	
	
		$.ajax({
	        url:  "/weather/getWeather",
	        dataType: "json",
	        type: "GET",
	        async: "false",
	        success: function(resp) {
	            console.log(resp);
	            console.log("현재온도 : "+ (resp.main.temp) );
	            console.log("현재습도 : "+ resp.main.humidity);
	            console.log("날씨 : "+ resp.weather[0].main );
	            console.log("상세날씨설명 : "+ resp.weather[0].description );
	            console.log("날씨 이미지 : "+ resp.weather[0].icon );
	            console.log("바람   : "+ resp.wind.speed );
	            console.log("나라   : "+ resp.sys.country );
	            console.log("도시이름  : "+ resp.name );
	            console.log("구름  : "+ (resp.clouds.all) +"%" );                 
	        }
	    });
		
		
 	});

	
</script>

<style>
		body{
  padding:10px;
}
</style>

</head>

<body>
	

</body>

</html>