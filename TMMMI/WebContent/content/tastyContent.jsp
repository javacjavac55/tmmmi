<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Tasty</title>
		
		<script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=px629oicfq&submodules=geocoder&callback=initMap" type="text/javascript"></script>
        
		<!-- Carousel CSS -->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<link rel="stylesheet" href="/css/scroll/main_tasty.css">
		<noscript><link rel="stylesheet" href="/css/scroll/noscript.css" /></noscript>
	</head>
<body>
	<section class="carousel">
		<div><span class="section-title">맛집</span></div>
		<div class="reel" style="overflow: visible; transform: translate(-1285px, 0px);">
			<c:forEach items="${contentTastyList}" var="contentTastyList" begin="0" end="9">
				<article class="content-tasty">
					<div class="tasty">
						<a href="#"> 
							<div id="map${contentTastyList.tastyLocationX}${contentTastyList.tastyLocationY}" class="tasty-map"></div>
						</a> 
						<c:if test="${! empty contentTastyList.tastyLink}">
							<button class="content-model-btn tasty-btn" type="button" data-content="${contentTastyList.tastyLink}">${contentTastyList.tastyTitle}</button><br/>
						</c:if>
						<c:if test="${empty contentTastyList.tastyLink}">
							<div class="tasty-title">
								${contentTastyList.tastyTitle}
							</div>
						</c:if>
						<div class="tasty-info">
							<c:if test="${! empty contentTastyList.tastyTel}">
								<span class="field">전화번호</span>  <span class="detail">${contentTastyList.tastyTel}</span><br/>	
							</c:if>
								<span class="field">분류</span> <span class="detail">${contentTastyList.tastyMenu}</span><br/>	
							<c:if test="${! empty contentTastyList.tastyAddress}">
								<span class="field">주소</span> <span class="detail">${contentTastyList.tastyAddress}</span><br/>	
							</c:if>
						</div>
					</div>
				</article>
			</c:forEach>
		</div>
	</section>
	<input type="hidden" id="tastyInput" value=""/>
	<!-- Carousel JS -->
	<script src="/javascript/scroll/jquery.dropotron.min.js"></script>
	<script src="/javascript/scroll/jquery.scrolly.min.js"></script>
	<script src="/javascript/scroll/jquery.scrollex.min.js"></script>
	<script src="/javascript/scroll/browser.min.js"></script>
	<script src="/javascript/scroll/breakpoints.min.js"></script>
	<script src="/javascript/scroll/util.js"></script>
	<script src="/javascript/scroll/main.js"></script>
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
                            var map = new naver.maps.Map("map"+trmapx+trmapy,{
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
	<script>
		 $(function(){
			 $('.content-model-btn').on('click', function(){
				var content = $(this).data("content");
				$('#tastyInput').val(content);
			})
		}) 
	</script>
</body>
</html>