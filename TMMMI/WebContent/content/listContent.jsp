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
		display: block;
		border: none;
	}
	
	#content-setting {
		width: 39px;
	    height: 39px;
	    position: fixed;
	    bottom: 70px;
	    left: 25px;
	    background-image: url("data:image/png;base64,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");
		background-size: contain;
	    background-color: white;
	    border-radius: 2px;
	    cursor: pointer;
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
<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
function fncOpenModal(section, content, scrapBtnShow) {
	if (scrapBtnShow) {
		$('#addScrap').attr('data-section',section);
		$('#addScrap').show();
	} else {
		$('#addScrap').attr('data-section','');
		$('#addScrap').hide();
	}
	$('.modal-body').html('<iframe class="content-modal" src="'+content+'" />');
	$('.content-modal-btn').click();
}
$(function(){
	window.onload = function () {  //call when iframe is fully loaded
		$($('#movieBoxOffice').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#movieBoxOffice').contents().find('#movieBoxOfficeInput').val();
			fncOpenModal(1, content, true);
		});
		
		$($('#movieNew').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#movieNew').contents().find('#movieNewInput').val();
			fncOpenModal(1, content, true);
		});
		  
		$($('#movieUpcoming').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#movieUpcoming').contents().find('#movieUpcomingInput').val();
			fncOpenModal(1, content, true);
		});
		
		$($('#movieReview').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#movieReview').contents().find('#movieReviewInput').val();
			fncOpenModal(1, content, true);
		});
		
		$($('#movieReview').contents().find('.movie-review-link')).on('click', function(){
			var content = $('#movieReview').contents().find('#movieReviewInput').val();
			fncOpenModal(1, content, true);
		});
		
		$($('#movieTrailer').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#movieTrailer').contents().find('#movieTrailerInput').val();
			fncOpenModal(1, content, true);
		});
		
		$($('#movieTrailer').contents().find('.scrap-btn')).on('click', function(){
			fncScrapArticle(1, "[예고편] "+$(this).siblings('.movie').find('.trailer-title').text().trim(), $(this).closest('article').get(0).outerHTML)
		});
		
		$($('#kSoccer').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#kSoccer').contents().find('#kSoccerInput').val();
			fncOpenModal(2, content, true);
		});
		
		$($('#wSoccer').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#wSoccer').contents().find('#wSoccerInput').val();
			fncOpenModal(2, content, true);
		});
		
		$($('#kBaseball').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#kBaseball').contents().find('#kBaseballInput').val();
			fncOpenModal(2, content, true);
		});
		
		$($('#wBaseball').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#wBaseball').contents().find('#wBaseballInput').val();
			fncOpenModal(2, content, true);
		});
		
		$($('#basketball').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#basketball').contents().find('#basketballInput').val();
			fncOpenModal(2, content, true);
		});
		
		$($('#general').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#general').contents().find('#generalInput').val();
			fncOpenModal(2, content, true);
		});
		
		$($('#highlight').contents().find('.scrap-btn')).on('click', function(){
			fncScrapArticle(2, $(this).siblings('.highlight-title').text().trim(), $(this).closest('article').get(0).outerHTML)
		});
		
		$($('#tasty').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#tasty').contents().find('#tastyInput').val();
			fncOpenModal(3, content, true);
		});
		
		$($('#tasty').contents().find('.scrap-btn')).on('click', function(){
			fncScrapArticle(3, $(this).siblings('.tasty-tasty-title').text().trim(), $(this).closest('article').get(0).outerHTML)
		});
		
		$($('#shoppingFirst').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#shoppingFirst').contents().find('#shoppingFirstInput').val();
			fncOpenModal(4, content, true);
		});
		
		$($('#shoppingSecond').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#shoppingSecond').contents().find('#shoppingSecondInput').val();
			fncOpenModal(4, content, true);
		});
		
		$($('#shoppingThird').contents().find('.content-model-btn')).on('click', function(){
			var content = $('#shoppingThird').contents().find('#shoppingThirdInput').val();
			fncOpenModal(4, content, true);
		});
		
		$($('#shoppingReview').contents().find('.scrap-btn')).on('click', function(){
			fncScrapArticle(4, $(this).siblings('.shopping-review-title').text().trim(), $(this).closest('article').get(0).outerHTML)
		});
				
		$('#content-setting').on('click', function(){
			fncOpenModal(0, "/contentSetting/getContentSetting", false);
		});
	};
	
	$('#addScrap').on('click', function() {
		var sectionNo = $(this).data('section');
		console.log('start');
		console.log('link',$('.content-modal').attr('src'));
		$.ajax({
			url : "/scrapRest/addScrap",
			method : "POST",
			data: JSON.stringify({
				sectionNo: sectionNo,
				scrapLink: $('.content-modal').attr('src'),
				scrapType: 0
			}),
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData, status) {
				console.log('success');
				swal({
					title : "스크랩 완료 " , 
					text: "컨텐츠를 성공적으로 스크랩 했습니다" , 
					icon : "success" , 
				}).then((value) => {
					$('.btn.btn-secondary').click();
				});
			}, 
			error: function(error) {
				console.log(error)
			}
		});
		console.log('end');
	});
});

function fncScrapArticle(sectionNo, title, html) {
	$.ajax({
		url : "/scrapRest/addScrapLink",
		method : "POST",
		data: JSON.stringify({
			sectionNo: sectionNo,
			scrapTitle: title,
			scrapDetail: html,
			scrapType: 1
		}),
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		success : function(JSONData, status) {
			console.log('success');
			swal({
				title : "스크랩 완료 " , 
				text: "컨텐츠를 성공적으로 스크랩 했습니다" , 
				icon : "success" , 
			}).then((value) => {
				$('.btn.btn-secondary').click();
			});
		}, 
		error: function(error) {
			console.log(error)
		}
	});
}

function fncCloseModal(){
	$('.btn.btn-secondary').click();
	location.reload();
}
</script>
	
</head>
<body>
${contentHtml}

<div id="content-setting"></div>

<button class="content-modal-btn" type="button" data-toggle="modal" data-target="#myFullsizeModal" style="display:none"></button>
<div class="modal fade" id="myFullsizeModal" tabindex="-1" role="dialog" aria-labelledby="myFullsizeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-fullsize">
    <div class="modal-content modal-fullsize">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
	          <span aria-hidden="true">&times;</span>
	      </div>
	      <div class="modal-body"></div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary" data-section="" id="addScrap">스크랩 하기</button>
	      </div>
	    </div>
	  </div>
  </div>
  <jsp:include page="/common/mainMenu.jsp"/>
</body>
</html>