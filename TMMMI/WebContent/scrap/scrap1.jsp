<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<link rel="stylesheet" href="/css/scroll/main_movie.css">
		<noscript><link rel="stylesheet" href="/css/scroll/noscript.css" /></noscript>
		<style>
			article {
				display: inline-block;
				width: 712px !important;
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
			}
			
			.content-movie-trailer {
				display: inline-block;
				width: 600px !important;
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
			}
			
			article p {
				text-align: center;
			}
			
			article header {
				text-align: center;
				width: 50%;
				display: inline-block !important;
				float:right;
				vertical-align:top;
			}
			
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
			
			.movie {
				height: 540px;
			}
			
			.movie-title {
				margin: 10px 10px 20px 10px;
			    font-size: larger;
			    width: 47% !important;
			    padding: 0.3em;
			    border-radius: 0.15em;
			    font-weight: 550;
			}
			
			.movie-info {
				text-align: left;
			}
			
			.movie .field {
				font-weight: normal;
			    color: white;
			    background: #483949;
			    display: inline-block;
			    width: 97px !important;
			    padding: 0 10px 0 10px;
			    border-radius: 2px;
			    border: 0;
			    margin: 0 0.2em 0.3em 0.5em;
			    height: auto;
			    box-sizing: content-box;
			    text-align: center;
			    vertical-align: top;
			}
			
			.movie .detail {
				display: inline-block;
			    width: 30%;
			}
			
			.movie-preview {
				position:absolute;
				width:712px;
				top:0px;
				left:0px;
				z-index:5;
				display:none;
			}
			
			.movie-preview-close-btn {
				position: absolute;
			    top: 10px;
			    right: 10px;
			    height: 25px;
			    width: 25px;
			    z-index: 5;
			    cursor: pointer;
				background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAABfAAAAXwBsrqMZwAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAADKSURBVEiJ7ZTRCoJAEEWHvkCppLT//4yCHqJSMBRK+5bq9NBEgwitbr5UFxZ0nT0HdByRf34zwBo4AFOH2gjYAMsugh2PlED0Bl5q7baLIABSPVgDSUtNApy1JgUCZ4GRZAo4W4k33IDCpgRYGHgGhL3gRjIDTgo86npez7zgRjIFCl4pXDpMRGTk6LiJyNXcX3TPP8AEyFteUQ6MfeExUJluCRsfvgLmH4ObZ6H5Tyog7gOvFbBv63MviUJhwFGx4jHAhhl2/3xX7nHZjmOoiqB8AAAAAElFTkSuQmCC");
			}
			
			/* trailer */
			.trailer-title {
				margin: 10px;
			    font-size: larger;
			    width: 93% !important;
			    padding: 0.3em;
			    border-radius: 0.15em;
			    font-weight: 550;
			}
			
			.movie-trailer-info {
				text-align: left;
				line-height: 180%;
			}
			
			.movie .trailer-field {
				font-weight: normal;
			    color: white;
			    background: #483949;
			    display: inline-block;
			    width: 60px !important;
			    padding: 0 10px 0 10px;
			    border-radius: 2px;
			    border: 0;
			    margin: 0 0.2em 0.3em 1em;
			    height: auto;
			    box-sizing: content-box;
			    text-align: center;
			    vertical-align: top;
			}
			
			.movie-trailer-preview {
				position:absolute;
				top:0px;
				z-index:5;
				display:none;
			}
			
			.videoThmb {
				position: relative;
				top: 0;
				width: 560px !important;
				height: 315px !important;
				display: inline-block !important;
				margin-top: 20px;
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
					var link = $(this).prev().children().data("link");
					$('#movie-preview-'+no).html(link+'<div class="movie-preview-close-btn" data-no="'+no+'"></div>');
					
					$(".movie-preview-close-btn").on("click", function(){
						var no = $(this).data("no");
						$('#movie-preview-'+no).html('');
						$('#movie-preview-'+no).attr('style','display:none;');
					});
					
					$('#movie-preview-'+no).attr('style','display:block;');
				});
			})
		</script>
	</head>
<body>
</body>
</html>