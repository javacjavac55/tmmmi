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
<script src="/javascript/scroll/rebind.js" charset="utf-8"></script>
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

function fncCloseModal(){
	$('.btn.btn-secondary').click();
	location.reload();
}

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

function bind(id){
	map[id]();
}

window.onload = function() {
	$('iframe').each(function(index, item){
		bind($(item).attr('src').split('/get')[1]);
	})
};

$(function(){
	$('#content-setting').on('click', function(){
		fncOpenModal(0, "/contentSetting/getContentSetting", false);
	});
	
	$(document).on('click', '#addScrap', function() {
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
	});	
});


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