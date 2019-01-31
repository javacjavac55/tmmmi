<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>contentTasty</title>
		<!-- Material Kit CSS -->
		<link href="/css/template/material-kit.min.css?v=2.0.5" rel="stylesheet" />
		<!-- Carousel CSS -->
		<link rel="stylesheet" href="/css/scroll/main.css">
		<noscript><link rel="stylesheet" href="/css/scroll/noscript.css" /></noscript>
		<!-- Material Kit JS -->
		<script src="/javascript/template/core/jquery.min.js" type="text/javascript"></script>
		<script src="/javascript/template/core/popper.min.js" type="text/javascript"></script>
		<script src="/javascript/template/core/bootstrap-material-design.min.js" type="text/javascript"></script>
		<script async defer src="https://buttons.github.io/buttons.js"></script>
		<script src="/javascript/template/material-kit.js?v=2.0.5" type="text/javascript"></script>
		<link href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <!-- font -->
        <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
        <!--naver 지도 api -->
        <script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=px629oicfq&submodules=geocoder&callback=initMap" type="text/javascript"></script>
        <meta charset="UTF-8">
	    <meta content="IE=edge" http-equiv="X-UA-Compatible">
	     <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" name="viewport">
	<style type="text/css">
	 .card-title, p{
	 font-family: 'Noto Sans KR', sans-serif;
	}
	</style>
	</head>
<body>
	<section class="carousel" style="background-color:#1d1d1d;">
		<div class="reel" style="overflow: visible; transform: translate(-1285px, 0px); height:65vh;">
				<c:forEach items="${contentTastyList}" var="contentTastyList" begin="0" end="9">
				
				<article class="area" style="width: 20vw; height: 30vh; padding:0px; margin-right:0px;">
				<div class="card">
					        <div class="card-header card-header-rose" style="height: 15vh;">
					            <h3 class="card-title">${contentTastyList.tastyTitle}</h3>
					            <p class="category">${contentTastyList.tastyMenu}</p>
					        </div>
							<div id="map${contentTastyList.tastyTitle}" style="width: 20vw; height: 30vh;padding-left:0px; margin-right:0px;"></div>
							<div class="col-md-12" style="padding:5%; height: 20vh">
							<p style="text-align:left; font-size:small">
								맛집 전화번호: ${contentTastyList.tastyTel}<br/>
								맛집 분류: ${contentTastyList.tastyMenu}<br/>
								맛집 주소: ${contentTastyList.tastyAddress}<br/>
							</p>
						</div>
						</div>
				</article>
				
			</c:forEach>
		</div>
	</section>
	<script>
        $(function () {
                $.ajax({
                    url: "/contentTastyRest/restContentTastyList",
                    method: 'GET',
                    headers: {
                        "Accept": "application/json",
                        "Content-Type": "application/json"
                    },
                    dateType: 'json',
                    success: function (JSONData) {
                        $.each(JSONData, function (i) {
                            var list = JSONData[i];
                            console.log(JSONData[i].title);
                            var trmapx = JSONData[i].mapx;
                            var trmapy = JSONData[i].mapy;
                            var naverCoord = naver
                                .maps
                                .TransCoord
                                .fromTM128ToLatLng(new naver.maps.Point(trmapx, trmapy)); // TM128 -> NAVER
                            var resultx = naverCoord.x;
                            var resulty = naverCoord.y;
                            var map = new naver.maps.Map("map"+JSONData[i].title,{
                                center: new naver.maps.LatLng(resulty, resultx),
                                zoom: 11
                            });
                            var marker = new naver.maps.Marker({
                                position: new naver.maps.LatLng(resulty, resultx),
                                map: map
                            });
                            var infowindow = new naver.maps.InfoWindow({content: JSONData[i].title});
                            naver
                                .maps
                                .Event
                                .addListener(marker, "click", function (e) {
                                    if (infowindow.getMap()) {
                                        infowindow.close();
                                    } else {
                                        infowindow.open(map, marker);
                                    }
                                });
                            infowindow.open(map, marker);
                        }) // $.each end
                    } // success end
                }) // ajax end
        }) // ready end
    </script>
	<!-- Carousel JS -->
	<script src="/javascript/scroll/jquery.dropotron.min.js"></script>
	<script src="/javascript/scroll/jquery.scrolly.min.js"></script>
	<script src="/javascript/scroll/jquery.scrollex.min.js"></script>
	<script src="/javascript/scroll/browser.min.js"></script>
	<script src="/javascript/scroll/breakpoints.min.js"></script>
	<script src="/javascript/scroll/util.js"></script>
	<script src="/javascript/scroll/main.js"></script>
</body>
</html>