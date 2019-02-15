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
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	<!-- sweetAlert -->
	<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script >
	
	<!--ckeditor  -->
	<!-- <script src="/ckeditor/ckeditor.js"></script> -->
	<script src="//cdn.ckeditor.com/4.7.3/full/ckeditor.js"></script>
	
	<!-- CSS Files -->
	<link href="/javascript/sweet/libgif-js-master/libgif.js" rel="stylesheet" />
	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link href="/javascript/sweet/libgif-js-master/rubbable.js"" rel="stylesheet" />
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
	
				var name=$("input[name='QNATitle']").val();
				var detail = CKEDITOR.instances.ckeditor.getData();
				
				if(name == null || name.length<1){
					swal("������ �ݵ�� �Է��Ͽ��� �մϴ�!", "�� �Է����ּ���");
					return;
				}
				if(detail == null || detail.length<10){
					 swal("������ 10���̻� �Է��Ͽ��� �մϴ�!", "�� �Է����ּ���");
					return;
				}
				 
				 swal("�ۼ��Ϸ� �Ͻðڽ��ϱ�?", {
					 buttons: true,
					 value: true,
					}).then((result)=>{
						if (result === true) {
							swal({
								title : "�ۼ��Ϸ� " , 
								text: "����Ʈ �������� �̵��մϴ�! " , 
								icon : "success" , 
							}).then((value) => {
								$("form").attr("method" , "POST").attr("action", "/qna/addQNA").submit();
							});
					      }
					}, function (dismiss) { });
			});
		});
	
		////////////////////////////////���
	    $(function() {	
	    	$( ".btn-default" ).on("click" , function() {
				 swal("����Ͻðڽ��ϱ�?", {
					 buttons: true,
					 value: true,
					}).then((result)=>{
						history.go(-1);
					}, function (dismiss) { });
			});
	    });

	    $$('img').each(function (img_tag) {
			if (/.*\.gif/.test(img_tag.src)) {
				var rub = new SuperGif({ gif: img_tag } );
				rub.load(function(){
					console.log('oh hey, now the gif is loaded');
				});
			}
		});
	    
	    
	</script>
	
</head>
<body class="index-page sidebar-collapse">
<form>

<jsp:include page="/common/toolbar2.jsp"></jsp:include>
  <div class="page-header header-filter clear-filter" style="background-image: url('/images/weather/4016924c4eb809d80e5ac60ad0703088.jpg');">
    <div class="container">
      <div class="row">
        <div class="col-md-8 ml-auto mr-auto">
          <div class="brand">
          	<h2 class="title">QNA</h2>
          	<h3 style="margin-top:-3%" >Question and Answer</h3>
          </div>
        </div>
      </div>
    </div>
  </div>
	  
  <div class="main main-raised">
    <div class="section section-basic">
      <div class="container">
      
      <img src="./example1_preview.gif" rel:animated_src="./example1.gif"
		width="360" height="360" rel:auto_play="1" rel:rubbable="1" />
      
		<div class="col-md-10 ml-auto mr-auto">
			<div class="form-group row">
				<div class="col-md-6">
			   	 <label for="" style="color:#9c27b0!important">ī�װ�</label>
				    <select class="form-control selectpicker" data-style="btn btn-link" name ="QNACategory">
				      <option value="0" >ȸ�� ����</option>
					  <option value="1" >���� ����</option>
					  <option value="2" >������ ����</option>
					  <option value="3" >���̾/����</option>
					  <option value="4" >��Ÿ</option>
				    </select>
			 	</div>
			 	<div class="form-group col-md-6" style="margin-top: 0.67%;">
				    <label style="color:#9c27b0!important; margin-left: 3.5%;">ȸ�����̵�</label>
				    <input type="text" class="form-control" value="${userId}" readonly  style="background-color:rgb(0,0,0,0);">
				</div>
		 	</div>
		 	
		 	<div>
		 	<input type=text name=��aa�� value=����>
				<img src="/images/QNAImage/tmmmi.gif" rel:animated_src="/images/QNAImage/tmmmi.gif" width="150" height="150" rel:auto_play="1" rel:rubbable="1"  onclick=��goX();/>
			</div>
			
		 	<div class="form-group">
			    <label>�� ����</label>
			    <input type="text" class="form-control"  name="QNATitle" id="title">
			</div>
			
			
			<div class="form-group">
			    <label>�� ����</label>
			    <textarea id="ckeditor" name="QNADetail" style="display: none;"></textarea>
			</div>
			
			<br/>
			
			<div align="center">
				<button type="button" class="btn btn-primary btn-round btn-sm" >�����ϱ�</button>
		        <button type="button" class="btn btn-default btn-round btn-sm">���</button>
			</div>
			
	 	</div>

		<br/><br/><br/><br/>
		
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