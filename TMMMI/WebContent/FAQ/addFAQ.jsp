<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> addFAQ </title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- summernote -->
	<link href="/css/summernote/summernote.css" rel="stylesheet">
  	<script src="/javascript/summernote/summernote.js"></script>
  	<!-- 로딩 -->
  	<link rel="stylesheet" href="/css/summernote/loading.css">  	
    <script src="/javascript/summernote/loading.js"></script>
    
    <!-- template -->
	<link rel="stylesheet" href="/css/template/main.css">
  	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		.row {
 			margin-bottom:10px
 		}
	</style>

	<script type="text/javascript">
	
	var $note = null;
    $(document).ready(function() {
    		
			$('#summernote').summernote({  	        
	        height:"300px",
	      	minHeight: null,
	      	maxHeight: null,
	      	focus: true,
	      	callbacks: {
	      		onImageUpload: function(files, editor, welEditable){
	      			console.log(files);
	      			console.log(files[0]);	      			
	      			var form_data = new FormData();
	      			form_data.append("file", files[0]);
	      			
	      			$note = $(this);
	      			console.log("abcd");
	      			$.ajax({
	      	    		data: form_data,
	      	    		type: "POST",
	      	    		url: '/faqRest/imageFAQ',
	      	    		cache: false,
	      	    		contentType: false,	      	    		
	      	    		enctype: 'multipart/form-data',
	      	    		processData: false,
	      	    		success: function(url){
	      	    			/* console.log("hi"); */
	      	    			isloading.start();
	      	    			setTimeout(function() {
	      	    				$note.summernote('insertImage',url);
	      	    				isloading.stop();
	      	    			},1500);	
	      	    			
	      	    		}
	      	    	});
	      		}
	      	}
	      
		});
    });
	
	$(function() {
		$( ".btn-pink:contains('작성하기')" ).on("click" , function() {
			fncAddFAQ();
		});
		
		$( ".btn-default:contains('취소')" ).on("click" , function() {
			history.go(-1);
		});
	});
	
	function fncAddFAQ() {
		
		var name=$("input[name='FAQTitle']").val();
		var detail = $("textarea[name='FAQDetail']").val();
		
		if(name == null || name.length<1){
			alert("제목은 반드시 입력하여야 합니다.");
			return;
		}
		 if(detail == null || detail.length<1){
			alert("내용은 반드시 입력하여야 합니다.");
			return;
		}
		
		$("form").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/faq/addFAQ").submit();

	}

	</script>
	
</head>
<body>
	<form name = "addFAQ">
		<div class="container">
		
		<div class="page-header">
			<h2>FAQ 작성하기</h2>
		</div>
		
		<div class="row">
			<div class="col-md-1">
				<button type="button" class="btn btn-default;">카테고리</button>
			</div>
		    <div class="col-md-3">
				<select name ="FAQCategory" class="form-control">
				  <option value="0" >회원 정보</option>
				  <option value="1" >일정 관리</option>
				  <option value="2" >컨텐츠 설정</option>
				  <option value="3" >다이어리/스크랩</option>
				  <option value="4" >기타</option>
				</select>
			</div>
			<div class="col-md-1">
				<button type="button" class="btn btn-default;">작성날짜</button>
			</div>
			<div class="col-md-5" >
				<button type="button" class="btn btn-default;" style="background-color:rgb(0,0,0,0);">2019-01-11</button>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-1">
				<button type="button" class="btn btn-default;">글 제목</button>
			</div>
			<div class="col-md-8">
				 <input type="text" class="form-control" name="FAQTitle">
			</div>
		</div>
	
		<div class="row" >
			<div class="col-md-1">
				<button type="button"  class="btn btn-default;">내용</button>
			</div>
			<div class="col-md-8">
				<textarea id="summernote" name="FAQDetail"></textarea>	
				<!--  <textarea class="form-control" rows="13" name="FAQDetail" style="resize: none"></textarea>  -->
			</div>
			<div class="col-md-3"></div>
		</div>
		
		<div class="row text-center ">
	  		<div class="col-md-1"></div>
	  		<div class="col-md-8">
	  		<button type="button" class="btn btn-pink">작성하기</button>
	  		<button type="button" class="btn btn-default">취소</button>
	  		</div>
	  		<div class="col-md-1"></div>
	  	</div>
		</div>

	</form>
</body>
</html>