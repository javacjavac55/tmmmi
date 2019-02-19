<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> getQNA </title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
	
	<!-- CSS Files -->
	<link href="/css/template/material-kit.css" rel="stylesheet" />
	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link href="/css/template/demo.css" rel="stylesheet" />
	
	<!--  Fonts and icons -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
	
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!-- styleSheet -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


	<script type="text/javascript">
	
		////////////////////////////////수정하기
		$(function() {
			$( ".btn-primary:contains('수정하기')" ).on("click" , function() {
				var qnaNo = $(this).data("param1");
				self.location = "/qna/updateQNA?qnaNo="+qnaNo;
			});
		});
		
		////////////////////////////////목록보기
		$(function() {
			$( ".btn-default:contains('목록보기')" ).on("click" , function() {	
				self.location = "/qna/getQNAList";
			});
		});
		
		////////////////////////////////답변달기
		$(function() {
			$( ".btn-primary:contains('답변달기')" ).on("click" , function() {
				var qnaNo = $(this).data("param1");
				self.location = "/qna/addQNAAnswer?qnaNo="+qnaNo;
			});
		});
		
		////////////////////////////////답변수정하기
		$(function() {
			$( ".btn-primary:contains('답변수정하기')" ).on("click" , function() {
				var qnaNo = $(this).data("param1");
				self.location = "/qna/updateQNAAnswer?qnaNo="+qnaNo;
			});
		});
		
		////////////////////////////////재문의하기
		$(function() {
			$( ".btn-primary:contains('재문의하기')" ).on("click" , function() {
				self.location = "/qna/addQNA";
			});
		});
		
	</script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		.row {
 			margin-bottom:10px
 		}
 		.giyong{
 			padding-left : 10px;
 		}
 		.index-page{
 			font-family: 맑은 고딕; 
 			font-weight: 300;
 		}
	</style>
	
</head>
<body class="index-page sidebar-collapse">
	<form name ="getQNA" >
	<jsp:include page="/common/topMenu.jsp"></jsp:include>
	  <div class="page-header header-filter clear-filter" style="background-image: url('/images/userSetting/ ${userSetting.image}')">
	    <div class="container">
	      <div class="row">
	        <div class="col-md-8 ml-auto mr-auto">
	          <div class="brand">
	          	<h2 class="title" style="font-family: 맑은 고딕;">1:1 답변 확인</h2>
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
				 	  <input type="text" class="form-control giyong"  value="회원정보" readonly  style="background-color:rgb(0,0,0,0);">
					</c:if>
					<c:if test="${qna.QNACategory ==1}">
				 	  <input type="text" class="form-control giyong"  value="일정 관리" readonly  style="background-color:rgb(0,0,0,0);">
					</c:if>
					<c:if test="${qna.QNACategory ==2}">
				 	  <input type="text" class="form-control giyong"  value="컨텐츠 설정" readonly  style="background-color:rgb(0,0,0,0);">
					</c:if>
					<c:if test="${qna.QNACategory ==3}">
				 	  <input type="text" class="form-control giyong"  value="다이어리/할일" readonly  style="background-color:rgb(0,0,0,0);">
					</c:if>
					<c:if test="${qna.QNACategory ==4}">
				 	  <input type="text" class="form-control giyong"  value="기타" readonly  style="background-color:rgb(0,0,0,0);">
					</c:if>
			    </div>
				<div class="form-group col-md-6" >
				    <label style="color:#9c27b0!important;">작성 날짜</label>
				    <input type="text" class="form-control giyong" name="QNADate" value="${qna.QNADate}" readonly  style="background-color:rgb(0,0,0,0);">
				</div>
		 	</div>
		 	
		 	<div class="form-group row">
		 		<c:if test="${role == 0}">
					<div class="col-md-4">
				    	<label style="color:#9c27b0!important;">회원 아이디</label>
					    <input type="text" class="form-control giyong" value="${writerUserId}" readonly  style="background-color:rgb(0,0,0,0);">
				    </div>
					<div class="form-group col-md-4">
					    <label style="color:#9c27b0!important;">회원 닉네임</label>
					    <input type="text" class="form-control giyong" value="${writerUserName }" readonly  style="background-color:rgb(0,0,0,0);">
					</div>
					<div class="form-group col-md-4">
					    <label style="color:#9c27b0!important;">답변 현황</label>
					    <c:if test="${qna.QNAAnswerCheck == 0}">
					    	<input type="text" class="form-control giyong" value="미완료" readonly  style="background-color:rgb(0,0,0,0);">
					    </c:if>
					    <c:if test="${qna.QNAAnswerCheck == 1}">
					    	<input type="text" class="form-control giyong" value="완료" readonly  style="background-color:rgb(0,0,0,0);">
					    </c:if>
					</div>
				</c:if>
		 		<c:if test="${role == 1}">
					<div class="col-md-6">
				    	<label style="color:#9c27b0!important;">회원 아이디</label>
					    <input type="text" class="form-control giyong" value="${writerUserId}" readonly  style="background-color:rgb(0,0,0,0);">
				    </div>
					<div class="form-group col-md-6">
					    <label style="color:#9c27b0!important;">답변 현황</label>
					    <c:if test="${qna.QNAAnswerCheck == 0}">
					    	<input type="text" class="form-control giyong" value="미완료" readonly  style="background-color:rgb(0,0,0,0);">
					    </c:if>
					    <c:if test="${qna.QNAAnswerCheck == 1}">
					    	<input type="text" class="form-control giyong" value="완료" readonly  style="background-color:rgb(0,0,0,0);">
					    </c:if>
					</div>
				</c:if>
		 	</div>
		 	
		 	<div class="form-group">
				<label style="color:#9c27b0!important;">질문 제목</label>
				<input type="text" class="form-control giyong"  name="QNATitle" value="${qna.QNATitle}" readonly  style="background-color:rgb(0,0,0,0); ">
			</div>
			
			<div class="form-group ">
			    <label style="color:#9c27b0!important;">질문 내용</label>
			    <div style="min-height:300px; border:1px solid; color:#d2d2d2">
			    	<div style="color:black; margin: 2%;">
			    		${qna.QNADetail}
			    	</div>
			    </div>
			</div>
			
			<div class="form-group"  align="center">
				<c:if test="${role == 0}">
					<c:if test="${qna.QNAAnswerCheck == 0}">
						<button type="button" class="btn btn-primary btn-round btn-sm"  data-param1="${qna.QNANo}">답변달기</button>
		  				<button type="button" class="btn btn-default btn-round btn-sm">목록보기</button>
		  			</c:if>
		  			<c:if test="${qna.QNAAnswerCheck == 1}">
		  				<button type="button" class="btn btn-primary btn-round btn-sm"  data-param1="${qna.QNANo}">답변수정하기</button>
		  				<button type="button" class="btn btn-default btn-round btn-sm">목록보기</button>
					</c:if>				
				</c:if>
				<c:if test="${role == 1}">
					<c:if test="${qna.QNAAnswerCheck == 0}">
						<button type="button" class="btn btn-primary btn-round btn-sm"  data-param1="${qna.QNANo}">수정하기</button>
		  				<button type="button" class="btn btn-default btn-round btn-sm">목록보기</button>
					</c:if>
				</c:if>
			</div>
		</div>
		
		<div class="col-md-10 ml-auto mr-auto">
		
			<c:if test="${qna.QNAAnswerCheck == 1}">
				<div class="form-group ">
				    <label style="color:#9c27b0!important;">답변 내용</label>
				    <div style="min-height:300px; border:1px solid; color:#d2d2d2">
				    	<div style="color:black; margin: 2%;">
				    	<img src="/images/common/234.png" style="position:relative;">
				    		${qna.QNAAnswerDetail}
				    	</div>
				    </div>
				</div>
				
				<div style="border:1px solid; color:#df86ee;" class="col-md-12" >
				    	<div style="color:black; text-align:center; font-size: 14px; height: 38px;">
				    		답변에 대한 재문의가 필요하신 경우 다시 문의 해주세요
				    		<button type="button" class="btn btn-primary btn-round btn-sm">재문의하기</button>
				    	</div>
				 </div>
				
				<br>
				
				<c:if test="${role == 1}" >
					<div align="center">
						<button type="button" class="btn btn-default btn-round btn-sm" >목록보기</button>
					</div>
				</c:if>
			</c:if>
		</div>
		
	<br/><br/><br/><br/>
		
		</div>
      </div>
    </div>
  </form>
</body>
</html>
<jsp:include page="/common/footer.jsp"></jsp:include>