<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> updateQNA </title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  Fonts and icons -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
	
	<!-- CSS Files -->
	<link href="/css/template/material-kit.css" rel="stylesheet" />
	
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	<!-- sweetAlert -->
	<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script >
	
	<!--ckeditor  -->
	<!-- <script src="/ckeditor/ckeditor.js"></script> -->
	<script src="//cdn.ckeditor.com/4.7.3/full/ckeditor.js"></script>

	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">

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
		 /*  background-color:#9c27b0; */
		  font-size: 12px;
		  border: 3px solid';
		}
	</style>

	<script type="text/javascript">
	
		////////////////////////////////수정하기
		$(function() {	
			$("button:contains('수정하기')" ).on("click" , function() {
				
				var qnaNo = $(this).data("param1");
				
				var name=$("input[name='QNATitle']").val();
				/* var detail = $("textarea[name='QNADetail']").val(); */
					
				if(name == null || name.length<1){
					swal("제목은 반드시 입력하여야 합니다!", "얼른 입력해주세요");
					return;
				}
				/*  if(detail == null || detail.length<1){
					 swal("내용은 반드시 입력하여야 합니다!", "얼른 입력해주세요");
					return;
				} */
				 swal("수정완료 하시겠습니까?", {
					 buttons: true,
					 value: true,
					}).then((result)=>{
						if (result === true) {
							swal({
								title : "수정완료 " , 
								text: "리스트 페이지로 이동합니다! " , 
								icon : "success" , 
							}).then((value) => {
								$("form").attr("method" , "POST").attr("action", "/qna/updateQNA").submit();
							});
					      }
					}, function (dismiss) { });
			});
		});
		
		////////////////////////////////취소
		$(function() {
			$( ".btn-default:contains('취소')" ).on("click" , function() {
				history.go(-1);
			});
		});
	
	</script>
	
</head>
<body class="index-page sidebar-collapse">
<form>
<input type="hidden" name="QNANo" value="${qna.QNANo}" />

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
				    <select class="form-control selectpicker" data-style="btn btn-link" name ="QNACategory">
				      <option value="0" >회원 정보</option>
					  <option value="1" >일정 관리</option>
					  <option value="2" >컨텐츠 설정</option>
					  <option value="3" >다이어리/스크랩</option>
					  <option value="4" >기타</option>
				    </select>
			    </div>
				<div class="form-group col-md-6" style="margin-top: 0.67%;">
				    <label style="color:#9c27b0!important; margin-left: 3.5%;">작성 날짜</label>
				    <input type="text" class="form-control" name="QNADate" value="${qna.QNADate}" readonly  style="background-color:rgb(0,0,0,0);">
				</div>
		 	</div>
		 
		 <div class="form-group">
			<label>글 제목</label>
			<input type="text" class="form-control"  name="QNATitle" value="${qna.QNATitle}">
		</div>
			
		<div class="form-group">
		    <label>글 내용</label>
		    <textarea id="ckeditor" name="QNADetail" style="display: none;">${qna.QNADetail}</textarea>
		</div>
		 	
		<div align="center">
			<button type="button" class="btn btn-primary"  data-param1="${qna.QNANo}">수정하기</button>
		    <button type="button" class="btn btn-default">취소</button>
		</div>
		
		</div>			
		</div>
      </div>
     </div>
  </form>
  <jsp:include page="/common/footer.jsp"></jsp:include>
  
  <script>
		CKEDITOR.replace('ckeditor', {//해당 이름으로 된 textarea에 에디터를 적용
			/* extraPlugins: 'autoembed,embedsemantic,image2,uploadimage,uploadfile',
			removePlugins: 'image', */
			width : '100%',
			height : '350PX',
			filebrowserImageUploadUrl : '/qna/imageQNA'
		});

		CKEDITOR.on('dialogDefinition', function(ev) {
			var dialogName = ev.data.name;
			var dialogDefinition = ev.data.definition;

			switch (dialogName) {
			case 'image': //Image Properties dialog
				//dialogDefinition.removeContents('info');
				dialogDefinition.removeContents('Link');
				dialogDefinition.removeContents('advanced');
				break;
			}
		});
	</script>
</body>
</html>