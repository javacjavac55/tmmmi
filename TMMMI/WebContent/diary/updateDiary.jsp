<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Tmmmi</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--  Fonts and icons -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">

<!-- CSS Files -->
<link href="/css/template/material-kit.css" rel="stylesheet" />

<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/css/template/demo.css" rel="stylesheet" />

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--ck editor  -->
<script src="//cdn.ckeditor.com/4.7.3/full/ckeditor.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
	
		  $('#select option').each(function(){
	
		    if($(this).val()=="${diary.userCategoryName}"){
	
		      $(this).attr("selected","selected"); // attr����ȵɰ�� prop���� 
	
		    }
	
		  });
	
	});


/* $(document).ready(function() {    	   		
	$('#summernote').summernote({  	        
        height:"400px",
        width: "700px",
      	minHeight: null,
      	maxHeight: null,
      	focus: true,
      	callbacks: {
      		onImageUpload: function(files, editor, welEditable){
      			console.log(files);
      			console.log(files[0]);	      			
      			var form_data = new FormData();
      			form_data.append("file", files[0]);
      			
      			$note = $(this);
      			console.log("abcd");
      			$.ajax({
      	    		data: form_data,
      	    		type: "POST",
      	    		url: '/diaryRest/imageDiary',
      	    		cache: false,
      	    		contentType: false,	      	    		
      	    		enctype: 'multipart/form-data',
      	    		processData: false,
      	    		success: function(url){
      	    			console.log("hi");
      	    			isloading.start();
      	    			setTimeout(function() {
      	    				$note.summernote('insertImage',url);
      	    				isloading.stop();
      	    			},4000);	
      	    			
      	    		}
      	    	});
      		}
      	}
      
    	});
  /* $('textarea[name="Contents"]').html($('.summernote').code());
}); */
	function fncUpdateDiary(){	
		$('form[name="updateDiary"]').attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/diary/updateDiary").submit();
	}
	
	
		
		$(function(){
			$( "#update" ).on("click" , function() {			
				 fncUpdateDiary();
			});
		});
		 
		$(function(){
			$("#cancel").on("click" , function() {				
				self.location="/diary/listDiary";
			});
		});	
		 

		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
		/*  $( "#update" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('����')" ).html() );
			 fncUpdateDiary();
		}); */		
		
	
</script>
</head>
<body class="index-page sidebar-collapse">
	<jsp:include page="/common/toolbar2.jsp"></jsp:include>
	<div class="page-header header-filter clear-filter" data-parallax="true" style="background-image: url('/images/userSetting/ ${userSetting.image}')">
		
		<div class="container">
			<div class="row">
				<div class="col-md-8 ml-auto mr-auto">
					<div class="brand">
						<h2 class="title">Diary</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="main main-raised">
		<div class="section section-basic">
			<div class="container">
				<div align="center">
					<!-- Wrapper -->
					<div id="wrapper">
						<!-- Main -->
						<div id="main">
							
							<form name="updateDiary" class="form-horizontal">
								<%--<input type="hidden" name="prodNo" value="<%= product.getProdNo()%>"/> --%> 
								<input type="hidden" name="diaryNo" value="${diary.diaryNo}"/>
								
								<div class="form-group" align="left">
									<label for="userCategoryNo" class="col-sm-offset-1 col-sm-1 control-label text-center"></label>
									<h3>���̾ ����</h3>	
									<div class="col-sm-4">
																		
									</div>
								</div>								
								
								<div class="form-group" align="left">
									<label for="userCategoryNo" class="col-sm-offset-3 col-sm-3 control-label text-left">ī�װ� ����</label>
									<div class="col-sm-4">
										<select class="form-control" name="userCategoryNo" id="select">
											<c:forEach var="userCategory" items="${userCategory}">
												<c:set var="i" value="${i+1}" />
										    		<option value="${userCategory.userCategoryNo}" >${userCategory.userCategoryName}</option>
										    </c:forEach>
									    </select>
								    </div>
								</div>							
			 					
			 					<div class="form-group" align="left">			 					
									<label for="diaryTitle" class="col-sm-offset-1 col-sm-1 control-label text-left">����</label>
									<div class="col-sm-4">
										<input type="text" name="diaryTitle" class="form-control" placeholder="${diary.diaryTitle}" value="${diary.diaryTitle}"/>
									</div>
									<span class="col-sm-3 text-right" style ="float:right;">
										�ۼ���¥ : ${diary.diaryDate}
									</span>		
								</div>
								
              						
								<div>
									<label for="diaryDetail" class="col-sm-offset-1 col-sm-3 control-label text-center"></label>
									<div class="col-sm-12" align="center">
										<textarea id="ckeditor" name="diaryDetail" style="display: none;"s>
										${diary.diaryDetail }
										</textarea>
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-offset-4  col-sm-4 text-center">
										<button type="button" id="update" class="btn btn-primary" data-param2=${diary.diaryNo } >����</button>
										<a class="btn btn-primary btn" id="cancel" href="#" role="button">���</a>
									</div>
								</div>
							</form>
						</div>
					</div>	
				</div>
			</div>
		</div>
	</div>
	<hr />
	<%-- <jsp:include page="/common/footer.jsp"></jsp:include> --%>
	<jsp:include page="/common/footer.jsp"></jsp:include>
	<script>
		$(function() {

			CKEDITOR.replace('ckeditor', {//�ش� �̸����� �� textarea�� �����͸� ����
				width : '100%',
				height : '700PX',
				filebrowserImageUploadUrl : '/diary/imageDiary?type=image'

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

		});
	</script>
</body>
</html>