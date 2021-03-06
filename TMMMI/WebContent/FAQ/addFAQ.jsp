<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
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
		
		.form-control{
		 padding-left : 10px;
		}
	</style>

	<script type="text/javascript" >
	
	////////////////////////////////작성하기
	$(function() {
		 $( ".btn-primary:contains('작성하기')" ).on("click" , function() {
			var name=$("input[name='FAQTitle']").val();
			var detail = CKEDITOR.instances.ckeditor.getData();
				
			if(name == null || name.length>30){
				swal("제목은 30자 미만이여야 합니다!", "얼른 입력해주세요");
				return;
			}
			if(detail == null || detail.length<10){
				 swal("내용은 10자이상 입력하여야 합니다!", "얼른 입력해주세요");
				return;
			}
			 swal("작성완료 하시겠습니까?", {
				 buttons: true,
				 value: true,
				}).then((result)=>{
					if (result === true) {
						fncAddFAQ();
				      }
				}, function (dismiss) { });
		});
	});
	
	function fncAddFAQ() {
		swal({
			title : "작성완료 " , 
			text: "리스트 페이지로 이동합니다! " , 
			icon : "success" , 
		}).then((value) => {
			 $("form").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/faq/addFAQ").submit();
		});
	}
	
	////////////////////////////////취소
    $(function() {	
    	$( ".btn-default:contains('취소')" ).on("click" , function() {
    			swal("취소 하시겠습니까?", {
			      buttons: true,
			    }).then((result)=>{
			    	if (result === true) {
			    		history.go(-1);
			    	}
			    }, function (dismiss) { });   		
		});
    });
	</script>
	
</head>
<body class="index-page sidebar-collapse">
<form>

<jsp:include page="/common/topMenu.jsp"></jsp:include>
  <div class="page-header header-filter clear-filter" style="background-image: url('/images/userSetting/ ${userSetting.image}')">
    <div class="container">
      <div class="row">
        <div class="col-md-8 ml-auto mr-auto">
          <div class="brand">
           <h2 class="title">FAQ</h2>
          	<h3 class="title" style="margin-top:-3%" >Frequent Asked Question</h3>
          </div>
        </div>
      </div>
    </div>
  </div>
	  
  <div class="main main-raised">
    <div class="section section-basic">
      <div class="container">
      
		<div class="col-md-10 ml-auto mr-auto">
			<div class="form-group">
		    <label for="" style="color:#9c27b0!important">카테고리</label>
			    <select class="form-control selectpicker" data-style="btn btn-link" name ="FAQCategory">
			      <option value="0" >회원 정보</option>
				  <option value="1" >일정 관리</option>
				  <option value="2" >컨텐츠 설정</option>
				  <option value="3" >다이어리/할일</option>
			    </select>
		 	</div>
		 	
		 	<div class="form-group">
			    <label>글 제목</label>
			    <input type="text" class="form-control"  name="FAQTitle" >
			</div>
			
			<div class="form-group">
			    <label>글 내용</label>
			    <textarea id="ckeditor" name="FAQDetail" style="display: none;"></textarea>
			</div>
			
			<br/>
			
			<div align="center">
				<button type="button" class="btn btn-primary btn-round btn-sm" >작성하기</button>
		        <button type="button" class="btn btn-default btn-round btn-sm">취소</button>
			</div>
			
	 	</div>

		<br/><br/><br/><br/>
		
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
			filebrowserImageUploadUrl : '/faq/imageFAQ'
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