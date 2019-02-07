<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> getQNA </title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  Fonts and icons -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
	
	<!-- CSS Files -->
	<link href="/css/template/material-kit.css" rel="stylesheet" />
	
	<!-- jQuery -->
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
<body class="index-page sidebar-collapse">
	<form name ="getQNA" >
	<jsp:include page="/common/toolbar2.jsp"></jsp:include>
	  <div class="page-header header-filter clear-filter" style="height:55vh; background-image: url('/images/weather/4016924c4eb809d80e5ac60ad0703088.jpg');">
	    <div class="container">
	      <div class="row">
	        <div class="col-md-8 ml-auto mr-auto">
	          <div class="brand">
	          </div>
	        </div>
	      </div>
	    </div>
	  </div> 
	  
	  <div class="main main-raised">
	   <div class="section section-basic">
	     <div class="container">
	      
		<div class="col-md-10 ml-auto mr-auto">
			<div class="form-group row">
				<div class="col-md-6">
			    	<label style="color:#9c27b0!important">카테고리</label>
					<c:if test="${qna.QNACategory ==0}">
				 	  <input type="text" class="form-control"  value="회원정보" readonly  style="background-color:rgb(0,0,0,0);">
					</c:if>
					<c:if test="${qna.QNACategory ==1}">
				 	  <input type="text" class="form-control"  value="일정" readonly  style="background-color:rgb(0,0,0,0);">
					</c:if>
					<c:if test="${qna.QNACategory ==2}">
				 	  <input type="text" class="form-control"  value="컨텐츠 설정" readonly  style="background-color:rgb(0,0,0,0);">
					</c:if>
					<c:if test="${qna.QNACategory ==3}">
				 	  <input type="text" class="form-control"  value="다이어리" readonly  style="background-color:rgb(0,0,0,0);">
					</c:if>
					<c:if test="${qna.QNACategory ==4}">
				 	  <input type="text" class="form-control"  value="스크랩" readonly  style="background-color:rgb(0,0,0,0);">
					</c:if>
			    </div>
				<div class="form-group col-md-6" >
				    <label style="color:#9c27b0!important;">작성 날짜</label>
				    <input type="text" class="form-control" name="QNADate" value="${qna.QNADate}" readonly  style="background-color:rgb(0,0,0,0);">
				</div>
		 	</div>
		 	
		 	<div class="form-group row">
				<div class="col-md-4">
			    	<label style="color:#9c27b0!important;">회원 아이디</label>
				    <input type="text" class="form-control" value="${writerUserId}" readonly  style="background-color:rgb(0,0,0,0);">
			    </div>
				<div class="form-group col-md-4">
				    <label style="color:#9c27b0!important;">회원 닉네임</label>
				    <input type="text" class="form-control" value="" readonly  style="background-color:rgb(0,0,0,0);">
				</div>
				<div class="form-group col-md-4">
				    <label style="color:#9c27b0!important;">답변 현황</label>
				    <c:if test="${qna.QNAAnswerCheck == 0}">
				    	<input type="text" class="form-control" value="미완료" readonly  style="background-color:rgb(0,0,0,0);">
				    </c:if>
				    <c:if test="${qna.QNAAnswerCheck == 1}">
				    	<input type="text" class="form-control" value="완료" readonly  style="background-color:rgb(0,0,0,0);">
				    </c:if>
				</div>
		 	</div>
		 	
		 	<div class="form-group">
				<label style="color:#9c27b0!important;">글 제목</label>
				<input type="text" class="form-control"  name="QNATitle" value="${qna.QNATitle}">
			</div>
			
			<div class="form-group">
				<label style="color:#9c27b0!important;">내용</label>
				<textarea class="form-control" rows="13" name="QNADetail" style="resize: none"  readonly="readonly">${qna.QNADetail}</textarea>
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
		
		<div class="row text-center ">
			<c:if test="${qna.QNAAnswerCheck == 1}">
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
			  		<button type="button" class="btn btn-pink col-md-10" >답변에 대한 재문의가 필요하신 경우 다시 문의 해주세요 
			  		</button>
			  	</div>
				 <c:if test="${role == 1}">
					 <div class="col-md-5"></div>
					<button type="button" class="btn btn-default ">목록보기</button>
				</c:if>
				</div>
			</c:if>
		</div>
		</div>
		</div>
		</div>
</div>
	</form>
</body>
</html>