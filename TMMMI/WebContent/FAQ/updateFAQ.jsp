
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> updateFAQ </title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- template -->
	<link rel="stylesheet" href="/css/template/main.css">
	
	<!-- sweetAlert -->
	<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js " > </script > 
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		.row {
 			margin-bottom:10px
 		}
 		.swal-title {
		  margin: 0px;
		  font-size: 16px;
		  margin-bottom: 28px;
		}
		.swal-button {
		  padding: 1px 16px;
		  background-color: #f4f6c6;
		  font-size: 12px;
		  border: 3px solid #f4f6c6;
		}

	</style>
	<script type="text/javascript">
		$(function() {	
			
			$("button:contains('수정하기')" ).on("click" , function() {
				var name=$("input[name='FAQTitle']").val();
				var detail = $("textarea[name='FAQDetail']").val();
					
				if(name == null || name.length<1){
					swal("제목은 반드시 입력하여야 합니다!", "얼른 입력해주세요");
					return;
				}
				 if(detail == null || detail.length<1){
					 swal("내용은 반드시 입력하여야 합니다!", "얼른 입력해주세요");
					return;
				}
				 swal("수정완료 하시겠습니까?", {
					 buttons: true,
					 value: true,
					}).then((result)=>{
						if (result === true) {
							fncUpdateFAQ();
					      }
					}, function (dismiss) { });
			});

			
			 $( ".btn-default" ).on("click" , function() {
					history.go(-1);
			});
		});
		
		function fncUpdateFAQ() {
			swal({
				title : "작성완료 " , 
				text: "리스트 페이지로 이동합니다! " , 
				icon : "success" , 
			}).then((value) => {
				$("form").attr("method" , "POST").attr("action" ,"/faq/updateFAQ?faqNo="+faqNo).submit();
			});
		}
	</script>
	
</head>
<body>
	<form name = "addFAQ">
		<div class="container">
		
		<div class="page-header">
			<h2>FAQ 수정하기</h2>
		</div>
		
		<div class="row">
			<div class="col-md-1">
				<button type="button" class="btn btn-default;">카테고리</button>
			</div>
		    <div class="col-md-5">
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
			<button type="button" class="btn btn-default;" style="background-color:rgb(0,0,0,0);" name="FAQDate" >${faq.FAQDate}</button>
		</div>
		</div>
		
		<div class="row">
			<div class="col-md-1">
				<button type="button" class="btn btn-default;">글 제목</button>
			</div>
			<div class="col-md-8">
				 <input type="text" class="form-control" name="FAQTitle" value="${faq.FAQTitle}">
			</div>
		</div>
	
		<div class="row" >
			<div class="col-md-1">
				<button type="button"  class="btn btn-default;">내용</button>
			</div>
			<div class="col-md-8">
				 <textarea class="form-control" rows="13" name="FAQDetail"  style="resize: none; " >${faq.FAQDetail}</textarea> 
			</div>
			<div class="col-md-3"></div>
		</div>
		
		<div class="row text-center ">
	  		<div class="col-md-1"></div>
	  		<div class="col-md-8">
	  		<button type="button" class="btn btn-pink"  data-param1="${faq.FAQNo}">수정하기</button>
	  		<button type="button" class="btn btn-default">취소</button>
	  		</div>
	  		<div class="col-md-1"></div>
	  	</div>
		</div>

	</form>
</body>
</html>