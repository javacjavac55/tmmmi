<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title> getWeather </title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- 날씨 아이콘 적용 -->
	<!-- <link rel="stylesheet" type="text/css" href="/css/weather-icons-master/css/weather-icons.min.css"> -->
	<link rel="stylesheet" type="text/css" href="/css/weather/weather-icons.min.css">
	
	<script type="text/javascript">
	$(function() {	

		$.ajax({
	        url: "/weather/getWeather",
	       dataType: "json",
	        type: "GET",
	        headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			}, 
	        success: function(Data) {
	      		console.log("Data 확인 : ", Data);
	      		
	      		var name = Data.name //도시이름
	      		var weather = Data.weather[0].main; //날씨
	      		var icon = (Data.weather[0].icon).substring(0,2); //날씨아이콘
	      		var temp = Data.main.temp; //온도
	      		var tempMin = Data.main.temp_min; //최저온도
	      		var tempMax = Data.main.temp_max; //최고온도
	      		var humidity = Data.main.humidity; //습도%
	      		var wind = Data.wind.speed; //바람세기
	      
	      		if (icon === '01') {
	      			$(".weather-wrapper").append("오늘의 날씨는 " + weather + "<i class='wi wi-day-sunny'></i> 최고 온도는 " + tempMax+"ºC 최저 온도는 " +tempMin+"ºC ");
	      		}else if (icon === '02') {
	      			$(".weather-wrapper").append("오늘의 날씨는 " + weather + "<i class='wi wi-day-cloudy'></i> 최고 온도는 " + tempMax+"ºC 최저 온도는 " +tempMin+"ºC ");
	      		}else if (icon === '03') {
	      			$(".weather-wrapper").append("오늘의 날씨는 " + weather + "<i class='wi wi-cloudy'></i> 최고 온도는 " + tempMax+"ºC 최저 온도는 " +tempMin+"ºC ");
	      		}else if (icon === '04') {
	      			$(".weather-wrapper").append("오늘의 날씨는 " + weather + "<i class='wi wi-cloudy'></i> 최고 온도는 " + tempMax+"ºC 최저 온도는 " +tempMin+"ºC ");
	      		}else if (icon === '09') {
	      			$(".weather-wrapper").append("오늘의 날씨는 " + weather + "<i class='wi wi-rain'></i> 최고 온도는 " + tempMax+"ºC 최저 온도는 " +tempMin+"ºC ");
	      		}else if (icon === '10') {
	      			$(".weather-wrapper").append("오늘의 날씨는 " + weather + "<i class='wi wi-day-rain'></i> 최고 온도는 " + tempMax+"ºC 최저 온도는 " +tempMin+"ºC ");
	      		}else if (icon === '11') {
	      			$(".weather-wrapper").append("오늘의 날씨는 " + weather + "<i class='wi wi-storm-showers'></i> 최고 온도는 " + tempMax+"ºC 최저 온도는 " +tempMin+"ºC ");
	      		}else if (icon === '13') {
	      			$(".weather-wrapper").append("오늘의 날씨는 " + weather + "<i class='wi wi-snow'></i> 최고 온도는 " + tempMax+"ºC 최저 온도는 " +tempMin+"ºC ");
	      		}else if (icon === '50') {
	      			$(".weather-wrapper").append("오늘의 날씨는 " + weather + "<i class='wi wi-fog'></i> 최고 온도는 " + tempMax+"ºC 최저 온도는 " +tempMin+"ºC ");
	      		} 
	        }
	    });
		
		
 	});

	
</script>

<style>
		 
</style>

</head>

<body>
	
	<div class="weather-wrapper" style="font-size: 20px">
		
	</div>
		

</body>

</html>