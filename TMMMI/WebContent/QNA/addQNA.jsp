<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> addQNA </title>
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
		$( ".btn-pink:contains('문의하기')" ).on("click" , function() {
			alert("왜오애애애애")
			/* var userNo=16; */
			fncAddQNA();
		});
		
		$( ".btn-default:contains('취소')" ).on("click" , function() {
			history.go(-1);
		});
	});
	
	function fncAddQNA() {
		
		var name=$("input[name='QNATitle']").val();
		var detail = $("textarea[name='QNADetail']").val();
		
		if(name == null || name.length<1){
			alert("제목은 반드시 입력하여야 합니다.");
			return;
		}
		 if(detail == null || detail.length<1){
			alert("내용은 반드시 입력하여야 합니다.");
			return;
		}
		
		$("form").attr("method" , "POST").attr("action", "/qna/addQNA").submit();
	}

	</script>
	
</head>
<body>
	<form name ="addQNA">
		<div class="container">
		
		<div class="page-header">
			<h2>1:1 문의하기</h2>
		</div>
		
		<div class="row">
			<div class="col-md-1">
				<button type="button" class="btn btn-default;">카테고리</button>
			</div>
		    <div class="col-md-3">
				<select name ="QNACategory" class="form-control">
				  <option value="0" >회원 정보</option>
				  <option value="1" >일정 관리</option>
				  <option value="2" >컨텐츠 설정</option>
				  <option value="3" >다이어리/스크랩</option>
				  <option value="4" >기타</option>
				</select>
			</div>
			<div class="col-md-1">
				<button type="button" class="btn btn-default;">회원아이디</button>
			</div>
			<div class="col-md-2" >
				<button type="button" class="btn btn-default;" style="background-color:rgb(0,0,0,0);" >${userId}</button>
			</div>
			<div class="col-md-1">
				<button type="button" class="btn btn-default;">작성날짜</button>
			</div>
			<div class="col-md-2" >
				<button type="button" class="btn btn-default;" style="background-color:rgb(0,0,0,0);">2019-01-16</button>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-1">
				<button type="button" class="btn btn-default;">글 제목</button>
			</div>
			<div class="col-md-8">
				 <input type="text" class="form-control" name="QNATitle" >
			</div>
		</div>
	
		<div class="row" >
			<div class="col-md-1">
				<button type="button"  class="btn btn-default;">내용</button>
			</div>
			<div class="col-md-8">
				 <textarea class="form-control" rows="13" name="QNADetail" style="resize: none"></textarea> 
			</div>
			<div class="col-md-3"></div>
		</div>
		
		<div class="row text-center ">
	  		<div class="col-md-1"></div>
	  		<div class="col-md-8">
	  		<button type="button" class="btn btn-pink">문의하기</button>
	  		<button type="button" class="btn btn-default">취소</button>
	  		</div>
	  		<div class="col-md-1"></div>
	  	</div>
		</div>

	</form>
</body>
</html>