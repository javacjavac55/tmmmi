<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0" />
	<title> getWeather </title>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<!-- weather icon -->
	<script src="https://rawgithub.com/darkskyapp/skycons/master/skycons.js"></script>
	
	<!-- font -->
   	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
   
   	<!-- template -->
	<link rel="stylesheet" href="/css/template/main.css">
	
	<script type="text/javascript">
	
		////////////////////////////////도시선택
	    $(function() {	
	    	$( ".form-control" ).change( function() {	
	    		var city = $(this).val();
	    		console.log(city)
	    		getWeather();
	    		getDust();
	    	});
	    });
	    
		$(function() {				
			getWeather();	
			getDust();
	 	});
		
		function getWeather() {	
			var city = $( ".form-control" ).val();
			
			$.ajax({
		        url: "/weather/getWeather?city="+city,
		        dataType: "json",
		        type: "GET",
		        headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				}, 
		        success: function(Data) {
		      		console.log("Data 확인 : ", Data);
		      		
		      		$(".main").html(Data); 
		      		
		      		var name = Data.name //도시이름
		      		var weather = Data.weather[0].main; //날씨
		      		var icon = (Data.weather[0].icon).substring(0,2); //날씨아이콘
		      		if( Data.weather[1] != null){
			      		var weather2 = Data.weather[1].main;
			      		var icon2 = (Data.weather[1].icon).substring(0,2);
		      		}
		      		var temp = Data.main.temp; //온도
		      		var tempMin = Data.main.temp_min; //최저온도
		      		var tempMax = Data.main.temp_max; //최고온도
		      		var humidity = Data.main.humidity; //습도%
		      		var wind = Data.wind.speed; //바람세기
		      		
		      		
		      		
		      		if(weather2 == null){
				      	if (icon === '01') {
				      		$(".main").append("<canvas id='clear-day' width='82' height='82' ></canvas>"+"<span class='temp'>"+temp+"º</span> <span class='temp_m'>"+tempMin+"º/"+tempMax+"º</span><p class='info'>미세먼지 : 100 나쁨</p>");
					    }else if (icon === '02') {
					    	$(".main").append("<canvas id='partly-cloudy-day' width='82' height='82' ></canvas>"+"<span class='temp'>"+temp+"º</span> <span class='temp_m'>"+tempMin+"º/"+tempMax+"º</span><p class='info'>미세먼지 : 100 나쁨</p>");
					    }else if (icon === '03') {
					    	$(".main").append("<canvas id='cloudy' width='82' height='82' ></canvas>"+"<span class='temp'>"+temp+"º</span> <span class='temp_m'>"+tempMin+"º/"+tempMax+"º</span><p class='info'>미세먼지 : 100 나쁨</p>");
					    }else if (icon === '04') {
					    	$(".main").append("<canvas id='cloudy' width='82' height='82' ></canvas>"+"<span class='temp'>"+temp+"º</span> <span class='temp_m'>"+tempMin+"º/"+tempMax+"º</span><p class='info'>미세먼지 : 100 나쁨</p>");
					    }else if (icon === '09') {
					    	$(".main").append("<canvas id='sleety' width='82' height='82' ></canvas>"+"<span class='temp'>"+temp+"º</span> <span class='temp_m'>"+tempMin+"º/"+tempMax+"º</span><p class='info'>미세먼지 : 100 나쁨</p>");
					    }else if (icon === '10') {
					    	$(".main").append("<canvas id='rain' width='82' height='82' ></canvas>"+"<span class='temp'>"+temp+"˚</span> <span class='temp_m'>"+tempMin+"º/"+tempMax+"º</span><p class='info'>미세먼지 : 100 나쁨</p>");
					    }else if (icon === '11') {
					    	$(".main").append("<canvas id='rain' width='82' height='82' ></canvas>"+"<span class='temp'>"+temp+"º</span> <span class='temp_m'>"+tempMin+"º/"+tempMax+"º</span><p class='info'>미세먼지 : 100 나쁨</p>");
					    }else if (icon === '13') {
					    	$(".main").append("<canvas id='snow' width='82' height='82' ></canvas>"+"<span class='temp'>"+temp+"º</span><br>"+
					      			"<span class='temp_m'>"+tempMin+"º/"+tempMax+"º</span><span class='info'>"+" 미세먼지 : 113 나쁨</span>");
						}else if (icon === '50') {
			      			$(".main").append("<canvas id='fog' width='82' height='82' ></canvas>"+"<span class='temp'>"+temp+"˚</span><br>"+
			      			"<span class='temp_m'>"+tempMin+"˚ / "+tempMax+"˚</span><span class='info'>"+" 미세먼지 : 113 나쁨</span>");
				      	}
		      		}if(weather2 != null){
		      			if (icon === '01') {
				      		$(".main").append("<canvas id='clear-day' width='82' height='82' ></canvas>"+"<span class='temp'>"+temp+"º</span> <span class='temp_m'>"+tempMin+"º/"+tempMax+"º</span><p class='info'>미세먼지 : 100 나쁨</p>");
					    }else if (icon === '02') {
					    	$(".main").append("<canvas id='partly-cloudy-day' width='82' height='82' ></canvas>"+"<span class='temp'>"+temp+"º</span> <span class='temp_m'>"+tempMin+"º/"+tempMax+"º</span><p class='info'>미세먼지 : 100 나쁨</p>");
					    }else if (icon === '03') {
					    	$(".main").append("<canvas id='cloudy' width='82' height='82' ></canvas>"+"<span class='temp'>"+temp+"º</span> <span class='temp_m'>"+tempMin+"º/"+tempMax+"º</span><p class='info'>미세먼지 : 100 나쁨</p>");
					    }else if (icon === '04') {
					    	$(".main").append("<canvas id='cloudy' width='82' height='82' ></canvas>"+"<span class='temp'>"+temp+"º</span> <span class='temp_m'>"+tempMin+"º/"+tempMax+"º</span><p class='info'>미세먼지 : 100 나쁨</p>");
					    }else if (icon === '09') {
					    	$(".main").append("<canvas id='sleety' width='82' height='82' ></canvas>"+"<span class='temp'>"+temp+"º</span> <span class='temp_m'>"+tempMin+"º/"+tempMax+"º</span><p class='info'>미세먼지 : 99 나쁨</p>");
					    }else if (icon === '10') {
					    	$(".main").append("<canvas id='rain' width='82' height='82' ></canvas>"+"<span class='temp'>"+temp+"˚</span> <span class='temp_m'>"+tempMin+"º/"+tempMax+"º</span><p class='info'>미세먼지 : 100 나쁨</p>");
					    }else if (icon === '11') {
					    	$(".main").append("<canvas id='rain' width='82' height='82' ></canvas>"+"<span class='temp'>"+temp+"º</span> <span class='temp_m'>"+tempMin+"º/"+tempMax+"º</span><p class='info'>미세먼지 : 100 나쁨</p>");
					    }else if (icon === '13') {
					    	$(".main").append("<canvas id='snow' width='82' height='82' ></canvas>"+"<span class='temp'>"+temp+"º</span><br>"+
					      			"<span class='temp_m'>"+tempMin+"º/"+tempMax+"º</span><span class='info'>"+" 미세먼지 : 113 나쁨</span>");
						}else if (icon === '50') {
			      			$(".main").append("<canvas id='fog' width='82' height='82' ></canvas>"+"<span class='temp'>"+temp+"˚</span><br>"+
			      			"<span class='temp_m'>"+tempMin+"˚ / "+tempMax+"˚</span><span class='info'>"+" 미세먼지 : 113 나쁨</span>");
				      	}
		      		}
			      	
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
			      	
			 	} //success end
		    }); //ajax end
	    
		}
		
		function getDust() {	
			var city = $( ".form-control" ).val();
			
			$.ajax({
		        url: "/weather/getDust?city="+city,
		        dataType: "json",
		        type: "GET",
		        headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				}, 
		        success: function(Data) {
		      		/* console.log("Data 확인(Dust) : ", Data); */
		      		
		      		var dust = Data.list[0].pm10Value;
		      		console.log(dust);
		      		
		      		$(".dust").html(Data); 
		        }
			});
		}
		
	</script>
	
<style>

		body {
			background: black;
		}
	
		figure {
		
			color:white;
			/* background-image: url('/images/weather/widgetBackground.jpg'); */
			
			/* background: #8b99a7; */
		}
		
		p {
			margin-left:10px;
			padding-top:20px;
			font-family: "Nanum Gothic", sans-serif;
		}
		
		canvas {
			padding-left:35px;
		}
		
		.temp{
			font-size: 60px;
			margin-left:20px;
		}
		.temp_m{
			font-size: 23px;
			margin-left:45px;
			line-height:30%;
			font-family: "Nanum Gothic", sans-serif;
		}
		.info{
			margin-left:13px;
			font-size:17px;
			line-height:30%;
			font-family: "Nanum Gothic", sans-serif;
		
		}
		 
</style>

</head>

<body>
<form>
		<div>
			<select class="form-control" name="city" style="color:white; background-color:black; border-color:black; width:25%;">
			  <option value="Seoul" >Seoul</option>
			  <option value="Incheon" >Incheon</option>
			  <option value="Busan" >Busan</option>
			</select>
		</div>
		<figure>
				<div class="main">
				</div>
				<div class="dust"></div>
		</figure>
</form>

</body>
</html>