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
				width: 356px !important;
			    height: 518px !important;
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
			}
			
			/* Highlight */
			.content-sport-highlight {
			    display: inline-block;
			    width: 600px !important;
			    height: 518px !important;
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
			}
			
			.videoThmb {
				position: relative;
				top: 0;
				width: 560px !important;
				height: 315px !important;
				display: inline-block !important;
				margin-top: 20px;
			}
			
			.sport-highlight {
				position:absolute;
				top:0px;
				z-index:5;
				display:none;
			}
			
			.sport-highlight-close-btn {
				position: absolute;
			    top: 10px;
			    right: 10px;
			    height: 25px;
			    width: 25px;
			    z-index: 5;
			    cursor: pointer;
				background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAABfAAAAXwBsrqMZwAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAADKSURBVEiJ7ZTRCoJAEEWHvkCppLT//4yCHqJSMBRK+5bq9NBEgwitbr5UFxZ0nT0HdByRf34zwBo4AFOH2gjYAMsugh2PlED0Bl5q7baLIABSPVgDSUtNApy1JgUCZ4GRZAo4W4k33IDCpgRYGHgGhL3gRjIDTgo86npez7zgRjIFCl4pXDpMRGTk6LiJyNXcX3TPP8AEyFteUQ6MfeExUJluCRsfvgLmH4ObZ6H5Tyog7gOvFbBv63MviUJhwFGx4jHAhhl2/3xX7nHZjmOoiqB8AAAAAElFTkSuQmCC");
			}
			
			.highlight-title {
				border-top: solid 1px rgba(128, 128, 128, 0.15);
			    margin: 15px;
			    font-size: larger;
			    width: 95% !important;
			    font-weight: 550;
			    padding-top: 10px;
			}
			
			.sport-highlight-btn {
				position:absolute;
				bottom: 0;
				left: 0;
				margin-bottom:20px;
				margin-left:20px;
				width: 560px;
				height: 45px;
				border-radius: 0.15em;
				font-size: large;
			}
			
			.play-btn {
				position: absolute;
			    top: 27%;
			    left: 44%;
			    z-index: 5;
			    width: 70px;
			    height: 70px;
			    background-repeat: no-repeat;
			    background-size: contain;
			    background-image: url(https://img.icons8.com/material-rounded/100/000000/circled-play.png);
			    background-color: white;
			    border-radius: 35px;
			    opacity: 0.5;
			}
			
			.play-btn:hover {
				background-color: #ff0000;
				opacity: 1;
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
		<script>
			$(function(){
				$(document).on("click", ".play-btn", function(){
					var no = $(this).prev().children().data("no");
					
					$.ajax({
						url : "/contentRest/getContentHighlightVideo",
						method : "POST",
						data: JSON.stringify({
							sportNo:no,
						}),
						dataType: "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status) {
							var link = JSONData.sportVideo;
							$('#sport-highlight-'+no).html(link+'<div class="sport-highlight-close-btn" data-no="'+no+'"></div>');
							
							$(".sport-highlight-close-btn").on("click", function(){
								var no = $(this).data("no");
								$('#sport-highlight-'+no).html('');
								$('#sport-highlight-'+no).attr('style','display:none;');
							});
							
							$('#sport-highlight-'+no).attr('style','display:block;');
						}
					});	
				});
			})
		</script>
	</head>
<body>
</body>
</html>