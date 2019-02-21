<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> updateFAQ </title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
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
	<script type="text/javascript">
	
		////////////////////////////////�����ϱ�
		$(function() {	
			$("button:contains('�����ϱ�')" ).on("click" , function() {
				
				var faqNo = $(this).data("param1");
				
				var name=$("input[name='FAQTitle']").val();
				var detail = CKEDITOR.instances.ckeditor.getData();
					
				if(name == null || name.length>30){
					swal("������ 30���̳����� �մϴ�!", "�� �Է����ּ���");
					return;
				}
				 if(detail == null || detail.length<10){
					 swal("������ 10���̻� �Է��Ͽ��� �մϴ�!", "�� �Է����ּ���");
					return;
				}
				 swal("�����Ϸ� �Ͻðڽ��ϱ�?", {
					 buttons: true,
					 value: true,
					}).then((result)=>{
						if (result === true) {
							swal({
								title : "�����Ϸ� " , 
								text: "����Ʈ �������� �̵��մϴ�! " , 
								icon : "success" , 
							}).then((value) => {
								$("form").attr("method" , "POST").attr("action" ,"/faq/updateFAQ?faqNo="+faqNo).submit();
							});
					      }
					}, function (dismiss) { });
			});
		});
		
		////////////////////////////////���
	    $(function() {	
	    	$( ".btn-default:contains('���')" ).on("click" , function() {
	    			swal("��� �Ͻðڽ��ϱ�?", {
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
          		<h3  class="title" style="margin-top:-3%" >Frequent Asked Question</h3>
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
			    	<label style="color:#9c27b0!important">ī�װ�</label>
				    <select class="form-control selectpicker" data-style="btn btn-link" name ="FAQCategory">
				      <option value="0" ${faq.FAQCategory ==0 ? "selected" : "" }>ȸ�� ����</option>
					  <option value="1" ${faq.FAQCategory ==1 ? "selected" : "" }>���� ����</option>
					  <option value="2" ${faq.FAQCategory ==2 ? "selected" : "" }>������ ����</option>
					  <option value="3" ${faq.FAQCategory ==3 ? "selected" : "" }>���̾/����</option>
				    </select>
			    </div>
				<div class="form-group col-md-6" style="margin-top: 0.67%;">
				    <label style="color:#9c27b0!important; margin-left: 3.5%;">�ۼ� ��¥</label>
				    <input type="text" class="form-control" name="FAQDate" value="${faq.FAQDate}" readonly  style="background-color:rgb(0,0,0,0);">
				</div>
		 	</div>
		 
		 <div class="form-group">
			<label>�� ����</label>
			<input type="text" class="form-control"  name="FAQTitle" value="${faq.FAQTitle}">
		</div>
			
		<div class="form-group">
		    <label>�� ����</label>
		    <textarea id="ckeditor" name="FAQDetail" style="display: none;">${faq.FAQDetail}</textarea>
		</div>
		 	
		<div align="center">
			<button type="button" class="btn btn-primary btn-round btn-sm"  data-param1="${faq.FAQNo}">�����ϱ�</button>
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