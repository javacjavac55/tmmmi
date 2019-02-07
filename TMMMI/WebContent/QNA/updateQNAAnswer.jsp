<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
	<title> updateQNAAnswer </title>
		
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
	
		////////////////////////////////�����ϱ�
		$(function() {	
			$("button:contains('�����ϱ�')" ).on("click" , function() {
	
				/* var detail = $("textarea[name='QNAAnswerDetail']").val();
				/* var detail = $("textarea[name='QNADetail']").val(); */
				
				/* if(detail == null || detail.length<1){
					alert("������ �ݵ�� �Է��Ͽ��� �մϴ�.");
					return;
				}  */
				 
				 swal("�����Ϸ� �Ͻðڽ��ϱ�?", {
					 buttons: true,
					 value: true,
					}).then((result)=>{
						if (result === true) {
							swal({
								title : "�����Ϸ� " , 
								text: "�亯 �������� �̵��մϴ�! " , 
								icon : "success" , 
							}).then((value) => {
								$("form").attr("method" , "POST").attr("action", "/qna/addQNAAnswer").submit();
							});
					      }
					}, function (dismiss) { });
			});
		});
		
		////////////////////////////////���
	    $(function() {	
	    	$( ".btn-default" ).on("click" , function() {
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
				<div class="form-group">
				    <textarea id="ckeditor" name="QNAAnswerDetail" style="display: none;">${qna.QNAAnswerDetail}</textarea>
				</div>
				
				<div align="center">
					<button type="button" class="btn btn-primary btn-round btn-sm" >�����ϱ�</button>
			        <button type="button" class="btn btn-default btn-round btn-sm">���</button>
				</div>
			</div>
			</div>
		</div>
	</div>

</form>
<jsp:include page="/common/footer.jsp"></jsp:include>
  
  <script>
		CKEDITOR.replace('ckeditor', {//�ش� �̸����� �� textarea�� �����͸� ����
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