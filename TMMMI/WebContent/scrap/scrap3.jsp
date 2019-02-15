<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<link rel="stylesheet" href="/css/scroll/main_shopping.css">
		<noscript><link rel="stylesheet" href="/css/scroll/noscript.css" /></noscript>
		
		<style>
			article {
				display: inline-block;
				width: 500px !important;
			    height: 540px !important;
				background: #fff;
				text-align: center;
				margin: 0 2em 0 0;
				white-space: normal;
				opacity: 1.0;
				-moz-transition: opacity 0.35s ease-in-out;
				-webkit-transition: opacity 0.35s ease-in-out;
				-ms-transition: opacity 0.35s ease-in-out;
				transition: opacity 0.35s ease-in-out;
				position: relative;
				box-shadow: 3px 3px 20px 3px #999;
			    border-radius: 0.4rem;
			    vertical-align: middle;
			    position: relative;
			    transform: translate(85%, 15%);
			}
			
			/* common */
			.section-title {
				position: relative;
			    vertical-align: top;
			    display: inline-block;
			    height: 50px;
			    margin-left: 1.3em;
			    margin-bottom: 0.5em;
			    font-size: xx-large;
			    color: #1d1d1d;
			}
			
			.tasty-map {
				width: 460px;
			    height: 280px;
			    margin-top: 20px;
			    padding-left:0px;
			    margin-left:20px;
			}
			
			.tasty-title {
				width: 92%;
			    height: 45px;
			    margin: 10px 20px;
			    color: #1d1d1d;
			    font-size: large;
			    font-weight: 550;
			    word-break: normal;
			    border: 3px solid #df7366;
			    border-radius: 0.15em;
			}
			
			.tasty-info {
				text-align: left;
			}
			
			.tasty .field {
				font-weight: normal;
			    color: white;
			    background: #483949;
			    display: inline-block;
			    width: 97px !important;
			    padding: 0 10px 0 10px;
			    border-radius: 2px;
			    border: 0;
			    margin: 0 0.2em 0.3em 1em;
			    height: auto;
			    box-sizing: content-box;
			    text-align: center;
			    vertical-align: top;
			}
			
			.tasty .detail {
				display: inline-block;
			    width: 69%;
			    word-break: keep-all;
			}
			
			.tasty-btn {
				margin: 10px 0;
				width: 93%;
			    height: 45px;
			    border-radius: 0.15em;
			    font-size: large;
			}
		</style>
		
		<script>
			$(function(){
				var scrapNo = location.search.substring(1).split("=")[1];
				console.log("scrapNo", location.search.substring(1).split("=")[1]);
				console.log($('body'));
				$.ajax({
					url : "/scrapRest/getScrap?scrapNo=" + scrapNo,
					method : "GET",
					dataType: "text",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData, status) {
						var data = JSON.parse(JSONData);
						$('body').append(data.scrapDetail);
						$('.scrap-btn').remove();
					}, 
					error: function(error) {
						console.log(error)
					}
				});
			})
		</script>
	</head>
<body>
</body>
</html>