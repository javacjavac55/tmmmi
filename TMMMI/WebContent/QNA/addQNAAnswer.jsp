<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> addQNAAnswer </title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- template -->
	<link rel="stylesheet" href="/css/template/main.css">
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		.row {
 			margin-bottom:10px
 		}
	</style>

	<script type="text/javascript">
	
	$(function() {
		$( ".btn-pink:contains('답변달기')" ).on("click" , function() {
			alert("진짜 달꺼야?")
			/* var userNo=16; */
			fncAddQNAAnswer();
		});
		
		$( ".btn-default:contains('취소')" ).on("click" , function() {
			history.go(-1);
		});
	});

	function fncAddQNAAnswer() {
		
		var detail = $("textarea[name='QNAAnswerDetail']").val();
		
		 if(detail == null || detail.length<1){
			alert("내용은 반드시 입력하여야 합니다.");
			return;
		}
		
		$("form").attr("method" , "POST").attr("action", "/qna/addQNAAnswer").submit();
	}

	</script>
	
</head>
<body>
	<form name ="addQNAAnswer">
		<input type="hidden" name="QNANo" value="${qna.QNANo}" />
		<div class="container">
		
		<div class="page-header">
			<h2>1:1 답변하기</h2>
		</div>
		
		<div class="row" >
			<div class="col-md-1">
				<button type="button"  class="btn btn-default;">내용</button>
			</div>
			<div class="col-md-8">
				 <textarea class="form-control" rows="13" name="QNAAnswerDetail" style="resize: none" >${qna.QNAAnswerDetail }</textarea> 
			</div>
			<div class="col-md-3"></div>
		</div>
		
		<div class="row text-center ">
	  		<div class="col-md-1"></div>
	  		<div class="col-md-8">
	  		<button type="button" class="btn btn-pink">답변달기</button>
	  		<button type="button" class="btn btn-default">취소</button>
	  		</div>
	  		<div class="col-md-1"></div>
	  	</div>
		</div>

	</form>
</body>
</html>