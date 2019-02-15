<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<noscript><link rel="stylesheet" href="/css/scroll/noscript.css" /></noscript>
		<style>
			article {
				display: inline-block;
				width: 356px !important;
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
			    transform: translate(68%, 15%);
			}
			
			/* Review */
			.content-shopping-review {
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
			
			.shopping-videoThmb-wrap {
				position: relative;
				top: 0;
				width: 560px !important;
				height: 315px !important;
				display: inline-block !important;
				margin-top: 20px;
				overflow: hidden;
			}
			
			.shopping-videoThmb {
				width: 560px !important;
				margin-top: -52px;
			}
			
			.shopping-review {
				position:absolute;
				top:0px;
				z-index:5;
				display:none;
			}
			
			.shopping-review-close-btn {
				position: absolute;
			    top: 10px;
			    right: 10px;
			    height: 25px;
			    width: 25px;
			    z-index: 5;
			    cursor: pointer;
				background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAABfAAAAXwBsrqMZwAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAADKSURBVEiJ7ZTRCoJAEEWHvkCppLT//4yCHqJSMBRK+5bq9NBEgwitbr5UFxZ0nT0HdByRf34zwBo4AFOH2gjYAMsugh2PlED0Bl5q7baLIABSPVgDSUtNApy1JgUCZ4GRZAo4W4k33IDCpgRYGHgGhL3gRjIDTgo86npez7zgRjIFCl4pXDpMRGTk6LiJyNXcX3TPP8AEyFteUQ6MfeExUJluCRsfvgLmH4ObZ6H5Tyog7gOvFbBv63MviUJhwFGx4jHAhhl2/3xX7nHZjmOoiqB8AAAAAElFTkSuQmCC");
			}
			
			.shopping-review-title {
			    font-size: larger;
			    width: 95% !important;
			    font-weight: 550;
			    padding-top: 10px;
			    word-break: keep-all;
			    margin-left: 10px;
			}
			
			.shopping-review-channel {
				position: absolute;
			    border: 3px solid;
			    margin: 0 20px;
			    bottom: 20px;
			    width: 93%;
			}
			
			.shopping-review-detail {
				position: absolute;
			    top: 0px;
			    width: 560px;
			    height: 315px;
			    margin-left: 20px;
			    margin-top: 20px;
			    color: white;
			    word-break: keep-all;
			    background-color: rgba(100, 100, 100, 0.5);
			    opacity: 0;
			}
			
			.shopping-review-detail:hover {
				opacity: 1;
			}
			
			.shopping-review-detail span {
				position: absolute;
			    bottom: 0px;
			    left: 0;
			    width: 550px;
			}
			
			.shopping-review-btn {
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
					console.log("clicked",$(this).prev());
					var no = $(this).prev().children().children().data("no");
					var link = $(this).prev().children().children().data("link");
					$('#shopping-review-'+no).html(link+'<div class="shopping-review-close-btn" data-no="'+no+'"></div>');
					
					$(".shopping-review-close-btn").on("click", function(){
						var no = $(this).data("no");
						$('#shopping-review-'+no).html('');
						$('#shopping-review-'+no).attr('style','display:none;');
					});
					
					$('#shopping-review-'+no).attr('style','display:block;');
				});
			})
		</script>
	</head>
<body>
</body>
</html>