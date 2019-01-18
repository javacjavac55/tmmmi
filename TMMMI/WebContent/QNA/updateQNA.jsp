<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> updateQNA </title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		.row {
 			margin-bottom:10px
 		}
	</style>

	<script type="text/javascript">
	
	$(function() {
		$( ".btn-pink:contains('수정하기')" ).on("click" , function() {
			alert("안떠?");
			var qnaNo = $(this).data("param1");
			fncUpdateQNA();
		});
		
		$( ".btn-default:contains('취소')" ).on("click" , function() {
			history.go(-1);
		});
	});
	
	function fncUpdateQNA() {
		
		var name=$("input[name='QNATitle']").val();
		var detail = $("input[name='QNADetail']").val();
		
		if(name == null || name.length<1){
			alert("제목은 반드시 입력하여야 합니다.");
			return;
		}
		 if(detail == null || detail.length<1){
			alert("내용은 반드시 입력하여야 합니다.");
			return;
		}
		
		$("form").attr("method" , "POST").attr("action", "/qna/updateQNA").submit();
	}

	</script>
	
</head>
<body>
	<form name ="updateQNA">
		<input type="hidden" name="QNANo" value="${qna.QNANo}" />
		<div class="container">
		
		<div class="page-header">
			<h2>1:1 문의하기</h2>
		</div>
		
		<div class="row">
			<div class="col-md-1">
				<button type="button" class="btn btn-default;">카테고리</button>
			</div>
		    <div class="col-md-2">
				<div class=" dropdown" style="background-color:rgb(0,0,0,0);">
			 		<button class="btn dropdown-toggle;" type="button" data-toggle="dropdown" style="background-color:rgb(0,0,0,0);">회원 정보
			 		<span class="caret"></span></button>
		  			<ul class="dropdown-menu">
				    <li>회원 정보</li>
				    <li>일정 관리</li>
				    <li>컨텐츠 설정</li>
				    <li>다이어리/스크랩</li>
				    <li>기타</li>
			  		</ul>
				</div>
			</div>
			<div class="col-md-1">
				<button type="button" class="btn btn-default;">작성날짜</button>
			</div>
			<div class="col-md-2" >
				<button type="button" class="btn btn-default;" style="background-color:rgb(0,0,0,0);">${qna.QNADate}</button>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-1">
				<button type="button" class="btn btn-default;">글 제목</button>
			</div>
			<div class="col-md-8">
				 <input type="text" class="form-control" name="QNATitle" value="${qna.QNATitle}">
			</div>
		</div>
	
		<div class="row" >
			<div class="col-md-1">
				<button type="button"  class="btn btn-default;">내용</button>
			</div>
			<div class="col-md-8">
				 <input type="text" class="form-control" rows="13" name="QNADetail" style="resize: none" value="${qna.QNADetail}" /> 
			</div>
			<div class="col-md-3"></div>
		</div>
		
		<div class="row text-center ">
	  		<div class="col-md-1"></div>
	  		<div class="col-md-8">
	  		<button type="button" class="btn btn-pink" data-param1="${qna.QNANo}">수정하기</button>
	  		<button type="button" class="btn btn-default">취소</button>
	  		</div>
	  		<div class="col-md-1"></div>
	  	</div>
		</div>

	</form>
</body>
</html>