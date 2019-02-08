<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>메인 컨텐츠</title>
<link href="/css/template/material-kit.min.css?v=2.0.5" rel="stylesheet" />
<style>
body {
	background-color: #eee;
}
iframe {
	width: 100%;
	height: 680px;
	display: block;
	border: none;
}

.normal-card{
	height: 664px;
}

.wide-card {
	height: 686px;
}

.modal-dialog.modal-fullsize {
  width: 900px !important;
  height: 100%;
  margin: 3% 10%;
  padding: 0;
}

.modal-content.modal-fullsize {
  height: 87%;
  width: 1500px !important;
  border-radius: 0; 
}

.modal-body iframe {
	width: 100%;
    height: 43em;
}
</style>
<script src="/javascript/template/core/jquery.min.js" type="text/javascript"></script>
<script src="/javascript/template/core/popper.min.js" type="text/javascript"></script>
<script src="/javascript/template/core/bootstrap-material-design.min.js" type="text/javascript"></script>
<script async defer src="https://buttons.github.io/buttons.js"></script>
<script src="/javascript/template/material-kit.js?v=2.0.5" type="text/javascript"></script>
<script>
$(function(){
	window.onload = function () {  //call when iframe is fully loaded
		$($('#movieBoxOffice').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#movieBoxOffice').contents().find('#movieBoxOfficeInput').val();
			  
			$('.modal-body').html('<iframe class="content-modal" src="'+content+'" />');
			$('.content-modal-btn').click();
		});
		
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
		
		$($('#movieReview').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#movieReview').contents().find('#movieReviewInput').val();
			
			$('.modal-body').html('<iframe class="content-modal" src="'+content+'" />');
			$('.content-modal-btn').click();
		});
		
		$($('#movieReview').contents().find('.movie-review-link')).on('click', function(){
			var content = $('#movieReview').contents().find('#movieReviewInput').val();
			
			$('.modal-body').html('<iframe class="content-modal" src="'+content+'" />');
			$('.content-modal-btn').click();
		});
		
		$($('#movieTrailer').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#movieTrailer').contents().find('#movieTrailerInput').val();
			
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
		
		$($('#kBaseball').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#kBaseball').contents().find('#kBaseballInput').val();
			  
			$('.modal-body').html('<iframe class="content-modal" src="'+content+'" />');
			$('.content-modal-btn').click();
		});
		
		$($('#wBaseball').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#wBaseball').contents().find('#wBaseballInput').val();
			  
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
		
		$($('#tasty').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#tasty').contents().find('#tastyInput').val();
			  
			$('.modal-body').html('<iframe class="content-modal" src="'+content+'" />');
			$('.content-modal-btn').click();
		});
		
		$('#addScrap').on('click', function(){
			fncAddScrap();
		});
	};
});


function fncAddScrap() {
	document.addScrap.submit();
	$('form[name="addScrap"]').attr("method", "POST").attr("enctype",
			"multipart/form-data").attr("action", "/scrap/addScrap")
			.submit();
}
</script>
	
</head>
<body>
${contentHtml}
<button class="content-modal-btn" type="button" data-toggle="modal" data-target="#myFullsizeModal" style="display:none"></button>
<div class="modal fade" id="myFullsizeModal" tabindex="-1" role="dialog" aria-labelledby="myFullsizeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-fullsize">
    <div class="modal-content modal-fullsize">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <form name="addScrap" class="form-horizontal">
	      <div class="modal-body">	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" id="addScrap">Save changes</button>
	      </div>
	      </form>
	    </div>
	  </div>
  </div>
  <jsp:include page="/common/mainMenu.jsp"/>
</body>
</html>