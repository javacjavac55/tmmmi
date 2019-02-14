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
	
	<!--     Fonts and icons     -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">

	<!-- weather icon -->
	<script src="https://rawgithub.com/darkskyapp/skycons/master/skycons.js"></script>
	
	<script type="text/javascript">
	
		
		$(document).ready(function () { 
			/* getDust(); */
			getWeather();
			/* setTimeout(function() { $('.loading').hide() },800);			 */
		});

		////////////////////////////////도시선택
	    $(function() {	
	    	$( ".form-control" ).change( function() {
	    		var city = $(this).val();
	    		getDust();
				getWeather();
	    	});
	    });
	    
		function getDust() {	
			var city = $( ".form-control" ).val();
			
			$.ajax({
		        url: "/weather/getDust?city="+city,
		        dataType: "text",
		        type: "GET",
		        headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				}, 
		        success: function(Data) {
		      		/* console.log("Data 확인(Dust) : ", Data);  */
		     
		      		$(".dust").html("<span>미세먼지 : " +Data+"</span>");
		        }
			});
		}
		
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
		      		/* console.log("Data 확인 : ", Data); */
		      		
		      		$(".main").html(Data); 
		      		
		      		var name = Data.name //도시이름
		      		var weather = Data.weather[0].main; //날씨
		      		var icon = (Data.weather[0].icon).substring(0,2); //날씨아이콘
		      		if( Data.weather[1] != null){
			      		var weather2 = Data.weather[1].main;
			      		var icon2 = (Data.weather[1].icon).substring(0,2);
		      		}
		      		var tempTmp = Data.main.temp; //임시온도
		      		var temp = Math.round(tempTmp*10)/10; //온도(첫째자리까지만)     		
		      		var tempMin = Data.main.temp_min; //최저온도
		      		var tempMax = Data.main.temp_max; //최고온도
		      		var humidity = Data.main.humidity; //습도%
		      		var wind = Data.wind.speed; //바람세기
		      		
		      		
		      		
		      		if(weather2 == null){
				      	if (icon === '01') {
				      		$(".main").append("<canvas id='clear-day' width='60' height='60' ></canvas>"+
  									"<span class='temp'>"+temp+"˚</span>"+
  									"<span class='temp_m'>"+tempMin+"˚/"+tempMax+"˚</span>");
					    }else if (icon === '02') {
					    	$(".main").append("<canvas id='partly-cloudy-day' width='60' height='60' ></canvas>"+
  									"<span class='temp'>"+temp+"˚</span>"+
  									"<span class='temp_m'>"+tempMin+"˚/"+tempMax+"˚</span>");
					    }else if (icon === '03') {
					    	$(".main").append("<canvas id='cloudy' width='60' height='60' ></canvas>"+
  									"<span class='temp'>"+temp+"˚</span>"+
  									"<span class='temp_m'>"+tempMin+"˚/"+tempMax+"˚</span>");
					    }else if (icon === '04') {
					    	$(".main").append("<canvas id='cloudy' width='60' height='60' ></canvas>"+
  									"<span class='temp'>"+temp+"˚</span>"+
  									"<span class='temp_m'>"+tempMin+"˚/"+tempMax+"˚</span>");
					    }else if (icon === '09') {
					    	$(".main").append("<canvas id='sleety' width='60' height='60' ></canvas>"+
  									"<span class='temp'>"+temp+"˚</span>"+
  									"<span class='temp_m'>"+tempMin+"˚/"+tempMax+"˚</span>");
					    }else if (icon === '10') {
					    	$(".main").append("<canvas id='rain' width='60' height='60' ></canvas>"+
  									"<span class='temp'>"+temp+"˚</span>"+
  									"<span class='temp_m'>"+tempMin+"˚/"+tempMax+"˚</span>");
					    }else if (icon === '11') {
					    	$(".main").append("<canvas id='rain' width='60' height='60' ></canvas>"+
  									"<span class='temp'>"+temp+"˚</span>"+
  									"<span class='temp_m'>"+tempMin+"˚/"+tempMax+"˚</span>");
					    }else if (icon === '13') {
					    	$(".main").append("<canvas id='snow' width='60' height='60' ></canvas>"+
  									"<span class='temp'>"+temp+"˚</span>"+
  									"<span class='temp_m'>"+tempMin+"˚/"+tempMax+"˚</span>");
						}else if (icon === '50') {
			      			$(".main").append("<canvas id='fog' width='60' height='60' ></canvas>"+
			      									"<span class='temp'>"+temp+"˚</span>"+
			      									"<span class='temp_m'>"+tempMin+"˚/"+tempMax+"˚</span>");
				      	}
		      		}if(weather2 != null){
		      			if (icon === '01') {
				      		$(".main").append("<canvas id='clear-day' width='60' height='60' ></canvas>"+
  									"<span class='temp'>"+temp+"˚</span>"+
  									"<span class='temp_m'>"+tempMin+"˚/"+tempMax+"˚</span>");
					    }else if (icon === '02') {
					    	$(".main").append("<canvas id='partly-cloudy-day' width='60' height='60' ></canvas>"+
  									"<span class='temp'>"+temp+"˚</span>"+
  									"<span class='temp_m'>"+tempMin+"˚/"+tempMax+"˚</span>");
					    }else if (icon === '03') {
					    	$(".main").append("<canvas id='cloudy' width='60' height='60' ></canvas>"+
  									"<span class='temp'>"+temp+"˚</span>"+
  									"<span class='temp_m'>"+tempMin+"˚/"+tempMax+"˚</span>");
					    }else if (icon === '04') {
					    	$(".main").append("<canvas id='cloudy' width='60' height='60' ></canvas>"+
  									"<span class='temp'>"+temp+"˚</span>"+
  									"<span class='temp_m'>"+tempMin+"˚/"+tempMax+"˚</span>");
					    }else if (icon === '09') {
					    	$(".main").append("<canvas id='sleety' width='60' height='60' ></canvas>"+
  									"<span class='temp'>"+temp+"˚</span>"+
  									"<span class='temp_m'>"+tempMin+"˚/"+tempMax+"˚</span>");
					    }else if (icon === '10') {
					    	$(".main").append("<canvas id='rain' width='60' height='60' ></canvas>"+
  									"<span class='temp'>"+temp+"˚</span>"+
  									"<span class='temp_m'>"+tempMin+"˚/"+tempMax+"˚</span>");
					    }else if (icon === '11') {
					    	$(".main").append("<canvas id='rain' width='60' height='60' ></canvas>"+
  									"<span class='temp'>"+temp+"˚</span>"+
  									"<span class='temp_m'>"+tempMin+"˚/"+tempMax+"˚</span>");
					    }else if (icon === '13') {
					    	$(".main").append("<canvas id='snow' width='60' height='60' ></canvas>"+
  									"<span class='temp'>"+temp+"˚</span>"+
  									"<span class='temp_m'>"+tempMin+"˚/"+tempMax+"˚</span>");
						}else if (icon === '50') {
			      			$(".main").append("<canvas id='fog' width='60' height='60' ></canvas>"+
			      									"<span class='temp'>"+temp+"˚</span>"+
			      									"<span class='temp_m'>"+tempMin+"˚/"+tempMax+"˚</span>");
				      	}
		      		}
			      	
			      	var icons = new Skycons({"color":"#9c27b0"}),
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
		
	</script>
	
<style>

		.tmmmi{
			position:relative;
		}
		
		canvas {
		    margin-top: -180px;
		    margin-left: -19px;
		    position: absolute;
		}	
		
		.temp {
		    font-size: 25px;
		    margin-left: 40px;
		    margin-top: -165px;
		    text-align: center;
		    width: 50px;
		    position: absolute;
		}
		
		.temp_m {
		     font-size: 19px;
		    margin-top: -120px;
		    margin-left: -4px;
		    width: 80px;
		    text-align: center;
		    position: absolute;
		}
		
		.dust {
		    font-size: 15px;
		    margin-top: -93px;
		    margin-left: -10px;
		    position: absolute;
		}
		 
</style>

</head>

<body>
<form>
		<img src="/images/common/tmmmi.png" class="tmmmi" >
		<div style="position:absolute; margin-top: -50px; margin-left: 24px;">
			<select class="form-control" name="city" style="width:100px; height: 25px; text-align:center">
			  <option value="Seoul" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서  울</option>
			  <option value="Incheon" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인  천</option>
			  <option value="Gwangju" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;광  주</option>
			  <option value="Daejeon" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대  전</option>
			  <option value="Busan" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;부  산</option>
			</select>
		</div>
		<figure>
				<div class="main" style="position:absolute;">
				</div>
				<div class="dust">
				</div>
		</figure>
</form>

</body>
</html>