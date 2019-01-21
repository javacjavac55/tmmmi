<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
      <link href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet">
      <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
      <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
      <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
      <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
      <!--naver 지도 api -->
      <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=px629oicfq&submodules=geocoder"></script>
      
	<meta charset="UTF-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
  	<script>
  	$(function () {
  		 $("#keywordbtn").on("click", function () {
  			var tastyKeyword1 = $("#tastyKeyword").val();
  			console.log(tastyKeyword);
  		$.ajax({
  			url:"/contentRest/getContentTastyList",
  			method: 'POST',
  			headers:{
                "Accept": "application/json",
                "Content-Type": "application/json"  				
  			},
  			data: JSON.stringify({
  				tastyKeyword : tastyKeyword1
  			}),
  				dateType: 'json',
  				success: function(JSONData , status) {
  					console.log(JSONData);
  					var list = JSON.parse(JSONData);
  					list.forEach(function(item, index, array){
  					$(" body").append('<div class="col-md-3">'+item['tastyTitle']+'</div>'
  							+'<div class="col-md-3">'+item['tastyLocationX']+'</div>'
  							+'<div class="col-md-3">'+item['tastyLocationY']+'</div>'
  							+'<div class="col-md-3">'+item['tastyMenu']+'</div>');
  					})
				}
  			})
  		});
  	})
		/*var map = new naver.maps.Map("map", {
		    center: new naver.maps.LatLng(37.5666103, 126.9783882),
		    zoom: 11
		}),
		infoWindow = null;
		
		function initGeocoder() {
		var naverCoord = naver.maps.TransCoord.fromTM128ToLatLng(new naver.maps.Point(314254,544950)); // TM128 -> NAVER
		console.log("naverCoord",naverCoord);
		
		infoWindow = new naver.maps.InfoWindow({
		    content: ''
		});
		
		map.addListener('click', function(e) {
		    var latlng = e.coord,
		        utmk = naver.maps.TransCoord.fromLatLngToUTMK(latlng),
		        tm128 = naver.maps.TransCoord.fromUTMKToTM128(utmk),
		        naverCoord = naver.maps.TransCoord.fromTM128ToNaver(tm128);
		
		    utmk.x = parseFloat(utmk.x.toFixed(1));
		    utmk.y = parseFloat(utmk.y.toFixed(1));
		
		    infoWindow.setContent([
		        '<div style="padding:10px;width:380px;font-size:14px;line-height:20px;">',
		        '<strong>LatLng</strong> : '+ '좌 클릭 지점 위/경도 좌표' +'<br />',
		        '<strong>UTMK</strong> : '+ '위/경도 좌표를 UTMK 좌표로 변환한 값' +'<br />',
		        '<strong>TM128</strong> : '+ '변환된 UTMK 좌표를 TM128 좌표로 변환한 값' +'<br />',
		        '<strong>NAVER</strong> : '+ '변환된 TM128 좌표를 NAVER 좌표로 변환한 값' +'<br />',
		        '</div>'
		    ].join(''));
		
		    infoWindow.open(map, latlng);
		    console.log('LatLng: ' + latlng.toString());
		    console.log('UTMK: ' + utmk.toString());
		    console.log('TM128: ' + tm128.toString());
		    console.log('NAVER: ' + naverCoord.toString());
		});
		}
		
		naver.maps.onJSContentLoaded = initGeocoder; */
</script>
</head>
<body>
<c:forEach items="${contentList}">
<div class="col-md-3">${contentList.tastyTitle}</div>
<div class="col-md-3">${contentList.tastyLocationX}</div>
<div class="col-md-3">${contentList.tastyLocationY}</div>
<div class="col-md-3">${contentList.tastyMenu}</div>
</c:forEach>
<form class="form-inline" name="detailForm">
<input type=text id="tastyKeyword">
<button id="keywordbtn">보내기</button>
</form>
<div id="map" style="width:100%;height:400px;"></div>
</body>
</html>