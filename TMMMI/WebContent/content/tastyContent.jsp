<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTDHTML4.01Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <link href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet">
            <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
                <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
                    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
                    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
                    <!--naver 지도 api -->
                    <script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=px629oicfq&submodules=geocoder&callback=initMap" type="text/javascript"></script>
                    <meta charset="UTF-8">
                        <meta content="IE=edge" http-equiv="X-UA-Compatible">
                            <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" name="viewport">
                                <style type="text/css">
                                    #map img {
                                        max-width: none;
                                        height: auto;
                                        border: 0
                                    }
                                </style>
                            </head>
                            <body>
                                <form class="form-inline" name="detailForm">
                                    <input id="tastyKeyword" type="text">
                                        <button id="keywordbtn" type="button">보내기</button>
                                        <c:forEach begin="0" end="9" var="i">
                                            <div id="map${i}" style="width: 500px; height: 500px;"></div>
                                            <hr/>
                                        </c:forEach>
                                    </form>
                                    <script>
                                        $(function () {
                                            $("#keywordbtn").on("click", function () {
                                                var tastyKeyword1 = $("#tastyKeyword").val();
                                                console.log(tastyKeyword1);
                                                $.ajax({
                                                    url: "/contentRest/getContentTastyList",
                                                    method: 'POST',
                                                    headers: {
                                                        "Accept": "application/json",
                                                        "Content-Type": "application/json"
                                                    },
                                                    data: JSON.stringify(
                                                        {tastyKeyword: tastyKeyword1}
                                                    ),
                                                    dateType: 'json',
                                                    success: function (JSONData) {
                                                        console.log("abc")
                                                        $.each(JSONData, function (i) {
                                                            var list = JSONData[i];
                                                            var trmapx = JSONData[i].mapx;
                                                            var trmapy = JSONData[i].mapy;
                                                            var naverCoord = naver
                                                                .maps
                                                                .TransCoord
                                                                .fromTM128ToLatLng(new naver.maps.Point(trmapx, trmapy)); // TM128 -> NAVER
                                                            var resultx = naverCoord.x;
                                                            var resulty = naverCoord.y;
                                                            var map = new naver.maps.Map("map" + i, {
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
                                                            console.log(map);
                                                            console.log("list :", list);
                                                            $("body").append('<div class="col-md-3">' + list.title + '</div>' + '<div class="col-md-3">' + list.category + '</div>');
                                                        }) // $.each end
                                                    } // success end
                                                }) // ajax end
                                            }); // click end
                                        }) // ready end
                                    </script>
                                </body>
                            </html>