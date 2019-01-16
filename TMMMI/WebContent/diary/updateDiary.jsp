<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
<%@page import="java.util.*"%>
<%@page import="com.model2.mvc.common.Search"%>

<%@page import="com.model2.mvc.service.domain.Product"%>
<%@page import="com.model2.mvc.service.product.dao.ProductDAO"%>


<% Product product = (Product)request.getAttribute("product"); 

%>
--%>

<html>
<head>
<title>ȸ����������</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	
	<!-- summernote -->
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>		
	<link href="/css/summernote.css" rel="stylesheet">
  	<script src="/javascript/summernote.js"></script>
       
   <style>
		body {
            padding-top : 50px;
        }
    </style>
	

<script type="text/javascript">


$(document).ready(function() {    	   		
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
  			
  			var $note = $(this);
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
  	    			alert("here");
  	    			/* fncLoading(); */
  	    			$note.summernote('insertImage',url);	      	    			
  	    		}
  	    	});
  		}
  	}
  
	});
  /* $('textarea[name="Contents"]').html($('.summernote').code()); */
});
	
	function fncUpdateDiary(){
	//Form ��ȿ�� ����
		/* var prodName=$("input[name='prodName']").val();
		var prodDetail=$("input[name='prodDetail']").val();
		var manuDate =$("input[name='manuDate']").val();
		var price =$("input[name='price']").val();
		
		if(prodName == null || prodName.length<1){
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(prodDetail == null || prodDetail.length<1){
			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if(price == null || price.length<1){
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		} */
			
		/* document.detailForm.action='/product/updateProduct?menu=manage';
		document.detailForm.submit(); */
		$('form[name="updateDiary"]').attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/diary/updateDiary").submit();
	}
	
	
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
		 $( "#update" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('����')" ).html() );
			 fncUpdateDiary();
		});
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
		 $("#cancel").on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('���')" ).html() );
			 history.go(-1);
		});
	
</script>
</head>

<body>	
	<div class="container">
	
		
<form name="updateDiary" class="form-horizontal">

<%--<input type="hidden" name="prodNo" value="<%= product.getProdNo()%>"/> --%> 
	<input type="hidden" name="diaryNo" value="${diary.diaryNo}"/>
	
	<div class="page-header text-center">
	       <h3 class=" text-info">���̾ ����</h3>	       
    </div>
	    
		<div class="form-group">
		    <label for="diaryNo" class="col-sm-offset-1 col-sm-3 control-label">���̾ ��ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="diaryNo" name="diaryNo" value="${diary.diaryNo}">
		    </div>
		</div>
		 <div class="form-group">
		   <label for="userCategory" class="col-sm-offset-1 col-sm-3 control-label">����ī�װ�</label>
		   <div class="col-sm-4">
		     <input type="text" class="form-control" id="userCategory" name="userCategoryNo" value="${diary.userCategoryNo}">
		   </div>
		 </div>
		  <div class="form-group">
		    <label for="diaryTitle" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="diaryTitle" name="diaryTitle" value="${diary.diaryTitle}">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="diaryDetail" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <textarea id="summernote" class="form-control" name="diaryDetail">
		      ${diary.diaryDetail }
		      </textarea>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="uploadFile" class="col-sm-offset-1 col-sm-3 control-label">�ۼ���¥</label>
		    <div class="col-sm-4">
		     <div class="col-xs-8 col-md-4">${diary.diaryDate}</div>		      
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" id="update" class="btn btn-primary" data-param2=${diary.diaryNo } >����</button>
			  <a class="btn btn-primary btn" id="cancel" href="#" role="button">���</a>
		    </div>
		</div>
		<hr/>
	</form>
</div>
</body>
</html>