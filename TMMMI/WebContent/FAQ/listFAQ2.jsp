<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> listFAQ </title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<script type="text/javascript">
	$(function() {	
	
		var apiURI = "http://api.openweathermap.org/data/2.5/weather?q=Seoul&units=metric&APPID=9375e1f400fff57aed0637c39dced0cb";
		
		$.ajax({
	        url: apiURI,
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
		
		var imgURL = "https://erikflowers.github.io/weather-icons/" + resp.weather[0].icon + ".png";
		 $("html컴포넌트").attr("src", imgURL);
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