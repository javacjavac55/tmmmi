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
<title>다이어리 정보 수정</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	
	<!-- summernote -->
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>		
	<link href="/css/summernote/summernote.css" rel="stylesheet">
  	<script src="/javascript/summernote/summernote.js"></script>     
    
    
  	<!-- 로딩 -->
  	<link rel="stylesheet" href="/css/summernote/loading.css">  	
  	<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->
    <script src="/javascript/summernote/loading.js"></script>
    
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
  /* $('textarea[name="Contents"]').html($('.summernote').code()); */
});
	
	function fncUpdateDiary(){
	//Form 유효성 검증
		/* var prodName=$("input[name='prodName']").val();
		var prodDetail=$("input[name='prodDetail']").val();
		var manuDate =$("input[name='manuDate']").val();
		var price =$("input[name='price']").val();
		
		if(prodName == null || prodName.length<1){
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if(prodDetail == null || prodDetail.length<1){
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if(price == null || price.length<1){
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		} */
			
		/* document.detailForm.action='/product/updateProduct?menu=manage';
		document.detailForm.submit(); */
		$('form[name="updateDiary"]').attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/diary/updateDiary").submit();
	}
	
	
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)

		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.
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
		 

		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		/*  $( "#update" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('가입')" ).html() );
			 fncUpdateDiary();
		}); */		
		
	
</script>
</head>

<body>	
	<div class="container">
	
		
<form name="updateDiary" class="form-horizontal">

<%--<input type="hidden" name="prodNo" value="<%= product.getProdNo()%>"/> --%> 
	<input type="hidden" name="diaryNo" value="${diary.diaryNo}"/>
	
	<div class="page-header text-center">
	       <h3 class=" text-info">다이어리 수정</h3>	       
    </div>
		 <div class="form-group">
		   <label for="userCategory" class="col-sm-offset-1 col-sm-3 control-label">유저카테고리</label>
		   <div class="col-sm-4">
		     <input type="text" class="form-control" id="userCategory" name="userCategoryNo" value="${diary.userCategoryNo}">
		   </div>
		   <label for="diaryDate" class="col-sm-offset-1 col-sm-3 control-label">작성날짜 ${diary.diaryDate}</label>		    
		 </div>
		  <div class="form-group">
		    <label for="diaryTitle" class="col-sm-offset-1 col-sm-3 control-label">제목</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="diaryTitle" name="diaryTitle" value="${diary.diaryTitle}">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="diaryDetail" class="col-sm-offset-1 col-sm-3 control-label">내용</label>
		    <div class="col-sm-4">
		      <textarea id="summernote" class="form-control" name="diaryDetail">
		      ${diary.diaryDetail }
		      </textarea>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" id="update" class="btn btn-primary" data-param2=${diary.diaryNo } >수정</button>
			  <a class="btn btn-primary btn" id="cancel" href="#" role="button">취소</a>
		    </div>
		</div>
		<hr/>
	</form>
</div>
</body>
</html>