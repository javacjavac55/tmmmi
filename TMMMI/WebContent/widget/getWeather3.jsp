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
	<link rel="stylesheet" type="text/css" href="/css/weather/weather-icons.min.css">
	<script src="https://rawgithub.com/darkskyapp/skycons/master/skycons.js"></script>
	
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
	      		
	      		var icons = new Skycons({"color":"white"}),
		      	    list = [
		      	      "clear-day",
		      	      "clear-night",
		      	      "partly-cloudy-day",
		      	      "partly-cloudy-night",
		      	      "cloudy",
		      	      "rain",
		      	      "sleet",
		      	      "snow",
		      	      "wind",
		      	      "fog"
		      	     ],
		      	    i;

		      	for(i = list.length; i--;)
		      	  icons.set(list[i], list[i]);

		      	icons.play();
		      	
		 	}
	    });
		
		
 	});

	
</script>

<style>
		body {
			background: black;
		}
		
		figure {
			margin:5em auto;
			width:300px;
			height:170px;
			background: #8b99a7;
		}
		
		p {
			color:white;
			margin-left:10px;
		}
		
		 
</style>

</head>

<body>
	
	<div class="container">
		<figure class="icons">
				<p style="padding-top:10px;">서울<p>
				<div>
					<canvas id="clear-day" width="64" height="64" style="padding-left:30px;" ></canvas>
				</div>
		</figure>
	</div>


</body>

</html>