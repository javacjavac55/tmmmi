<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> getQNA </title>
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
			 self.location = "/faq/updateQNA;
		});
		
		$( ".btn-default:contains('목록보기'')" ).on("click" , function() {
			self.location = "/faq/getQNAList;
		});
	});
	
	</script>
	
</head>
<body>
	<form name ="addQNA">
		<div class="container">
		
		<div class="page-header">
			<h2>FAQ 작성하기</h2>
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
				<button type="button" class="btn btn-default;">회원아이디</button>
			</div>
			<div class="col-md-2" >
				<button type="button" class="btn btn-default;" style="background-color:rgb(0,0,0,0);" value="user16">user16</button>
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
	  		<button type="button" class="btn btn-pink">수정하기</button>
	  		<button type="button" class="btn btn-default">목록보기</button>
	  		</div>
	  		<div class="col-md-1"></div>
	  	</div>
		</div>

	</form>
</body>
</html>