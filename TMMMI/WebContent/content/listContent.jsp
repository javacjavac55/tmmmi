<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ������</title>
<style>
body {
	background-color: #1d1d1d;
}
iframe {
	width: 100%;
	height: 800px;
	display: block;
	
}

.modal-dialog.modal-fullsize {
  width: 900px !important;
  height: 100%;
  margin: 3% 10%;
  padding: 0;
}
.modal-content.modal-fullsize {
  height: auto;
  width: 1500px !important;
  border-radius: 0; 
}

.modal-body iframe {
	width: 100%;
    height: 33em;
}
</style>
<link href="/css/template/material-kit.min.css?v=2.0.5" rel="stylesheet" />
<script src="/javascript/template/core/jquery.min.js" type="text/javascript"></script>
<script src="/javascript/template/core/popper.min.js" type="text/javascript"></script>
<script src="/javascript/template/core/bootstrap-material-design.min.js" type="text/javascript"></script>
<script async defer src="https://buttons.github.io/buttons.js"></script>
<script src="/javascript/template/material-kit.js?v=2.0.5" type="text/javascript"></script>
<script>
$(function(){
	window.onload = function () {  //call when iframe is fully loaded
		var tmp = $('#movieNew').contents().find('.content-model-btn').html();
		console.log(tmp);
		$($('#movieNew').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#movieNew').contents().find('#movieNewInput').val();
			  
			$('.modal-body').html('<iframe class="content-modal" src="'+content+'" />');
			$('.content-modal-btn').click();
		});
		  
		$($('#movieUpcoming').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#movieUpcoming').contents().find('#movieUpcomingInput').val();
			  
			$('.modal-body').html('<iframe class="content-modal" src="'+content+'" />');
			$('.content-modal-btn').click();
		});
		
		$($('#kSoccer').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#kSoccer').contents().find('#kSoccerInput').val();
			  
			$('.modal-body').html('<iframe class="content-modal" src="'+content+'" />');
			$('.content-modal-btn').click();
		});
		
		$($('#wSoccer').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#wSoccer').contents().find('#wSoccerInput').val();
			  
			$('.modal-body').html('<iframe class="content-modal" src="'+content+'" />');
			$('.content-modal-btn').click();
		});
		
		$($('#basketball').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#basketball').contents().find('#basketballInput').val();
			  
			$('.modal-body').html('<iframe class="content-modal" src="'+content+'" />');
			$('.content-modal-btn').click();
		});
		
		$($('#general').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#general').contents().find('#generalInput').val();
			  
			$('.modal-body').html('<iframe class="content-modal" src="'+content+'" />');
			$('.content-modal-btn').click();
		});
	};
});
</script>
	
</head>
<body>
<%-- <div><c:import url="/contentMovie/getContentMovieBoxOffice"></c:import></div>
<div><c:import url="/contentMovie/getContentMovieNew"></c:import></div>
<div><c:import url="/contentMovie/getContentMovieUpcoming"></c:import></div>
<div><c:import url="/contentMovie/getContentMovieReview"></c:import></div>
<div><c:import url="/contentMovie/getContentMovieTrailer"></c:import></div>

<div><c:import url="/contentShopping/getShoppingList"></c:import></div>
<div><c:import url="/contentShopping/getShoppingReviewList"></c:import></div> --%>

<iframe id="movieBoxOffice" src="/contentMovie/getContentMovieBoxOffice"></iframe>
<iframe id="movieNew" src="/contentMovie/getContentMovieNew"></iframe>
<iframe id="movieUpcoming" src="/contentMovie/getContentMovieUpcoming"></iframe>
<iframe id="movieReview" src="/contentMovie/getContentMovieReview"></iframe>
<iframe id="movieTrailer" src="/contentMovie/getContentMovieTrailer"></iframe>

<iframe src="/contentShopping/getShoppingList"></iframe>
<iframe src="/contentShopping/getShoppingReviewList"></iframe>

<iframe id="kSoccer" src="/contentSport/getContentKsoccerList"></iframe>
<iframe id="wSoccer" src="/contentSport/getContentWsoccerList"></iframe>
<iframe id="kBaseball" src="/contentSport/getContentKbaseballList"></iframe>
<iframe id="wBaseball" src="/contentSport/getContentWbaseballList"></iframe>
<iframe id="basketball" src="/contentSport/getContentBasketballList"></iframe>
<iframe id="general" src="/contentSport/getContentGeneralList"></iframe>

<button class="content-modal-btn" type="button" data-toggle="modal" data-target="#myFullsizeModal" style="display:none"></button>
<div class="modal fade" id="myFullsizeModal" tabindex="-1" role="dialog" aria-labelledby="myFullsizeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-fullsize">
    <div class="modal-content modal-fullsize">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">��ȭ �� ����</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
  </div>
</body>
</html>