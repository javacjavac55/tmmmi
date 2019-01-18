<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			var qnaNo = $(this).data("param1");
			self.location = "/qna/updateQNA?qnaNo="+qnaNo;
		});
		
		$( ".btn-default:contains('목록보기')" ).on("click" , function() {
			self.location = "/qna/getQNAList";
		});
		
		$( ".btn-default:contains('답변달기')" ).on("click" , function() {
			var qnaNo = $(this).data("param1");
			self.location = "/qna/addQNAAnswer?qnaNo="+qnaNo;
		});
		
		$( ".btn-default:contains('답변수정하기')" ).on("click" , function() {
			var qnaNo = $(this).data("param1");
			self.location = "/qna/updateQNAAnswer?qnaNo="+qnaNo;
		});
		
		$( ".btn-pink:contains('재문의하기')" ).on("click" , function() {
			self.location = "/qna/addQNA";
		});
	});
	
	</script>
	
</head>
<body>
	<form name ="getQNA" >
		<div class="container" >
		
		<div class="page-header">
			<h2>1:1문의내역</h2>
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
				<button type="button" class="btn btn-default;" style="background-color:rgb(0,0,0,0);" >${userId}</button>
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
			<div class="col-md-5">
				 <button type="button" class="btn btn-default;" style="background-color:rgb(0,0,0,0);">${qna.QNATitle}</button>
			</div>
			<div class="col-md-1">
				<button type="button" class="btn btn-default;">답변 현황</button>
			</div>
			<div class="col-md-2">
				<div>
					<c:if test="${qna.QNAAnswerCheck == 0}">
						<button type="button" class="btn btn-default;" style="background-color:rgb(0,0,0,0);">미완료</button>
					</c:if><c:if test="${qna.QNAAnswerCheck == 1}">
						<button type="button" class="btn btn-default;" style="background-color:rgb(0,0,0,0);">완료</button>
					</c:if>
				</div>
			</div>
		</div>
	
		<div class="row" >
			<div class="col-md-1">
				<button type="button"  class="btn btn-default;">내용</button>
			</div>
			<div class="col-md-8">
				 <textarea class="form-control" rows="13" name="QNADetail" style="resize: none"  readonly="readonly">${qna.QNADetail}</textarea> 
			</div>
			<div class="col-md-3"></div>
		</div>
		
		<div class="row text-center ">
	  		<div class="col-md-1"></div>
	  		<div class="col-md-8">
	  		<c:if test="${role == 1}">
	  			<c:if test="${qna.QNAAnswerCheck == 0}">
	  				<button type="button" class="btn btn-pink"  data-param1="${qna.QNANo}">수정하기</button>
	  				<button type="button" class="btn btn-default">목록보기</button>
	  			</c:if>
	  			<c:if test="${qna.QNAAnswerCheck == 1}">
	  				<jsp:include  page="/QNA/QNAAnswer.jsp"  />
	  				<button type="button" class="btn btn-default">목록보기</button>
	  			</c:if>
	  		</c:if>
	  		<c:if test="${role == 0}">
	  			<c:if test="${qna.QNAAnswerCheck == 0}">
	  				<button type="button" class="btn btn-default" data-param1="${qna.QNANo}">답변달기</button>
	  				<button type="button" class="btn btn-default">목록보기</button>
	  			</c:if>
	  			<c:if test="${qna.QNAAnswerCheck == 1}">
	  				<button type="button" class="btn btn-default" data-param1="${qna.QNANo}">답변수정하기</button>
	  				<button type="button" class="btn btn-default">목록보기</button>
	  			</c:if>
	  		</c:if>
	  		<div class="col-md-1"></div>
	  	</div>
		</div>
		
		<%-- <c:if test="${qna.QNAAnswerCheck == 1}">
			<div class="container">
			<div class="row" >
				<div class="col-md-1">
					<button type="button"  class="btn btn-default;">내용</button>
				</div>
				<div class="col-md-8">
					 <textarea class="form-control" rows="13" name="QNAAnswerDetail" style="resize: none"  readonly="readonly">${qna.QNAAnswerDetail}</textarea> 
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<br/>
			
			<div class="row text-center ">
				<div class="col-md-1"></div>
		  		<button type="button" class="btn btn-pink col-md-8" >답변에 대한 재문의가 필요하신 경우 다시 문의 해주세요 
		  		</button>
		  	</div>
		 	</div>
		</c:if> --%>
	</div>
	</form>
</body>
</html>