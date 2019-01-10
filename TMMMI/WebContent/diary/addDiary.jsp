<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <% 	Product product = (Product)request.getAttribute("product");
	System.out.println(product);
	User user = (User)request.getSession().getAttribute("user");
	System.out.println(user);
	
%> --%>

<html>
<head>

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	
  	
  	
	<script type="text/javascript">
	
	function fncAddDiary() {
		document.addDiary.submit();
		$('form[name="addDiary"]').attr("method" , "POST").attr("action" , "/diary/addDiary").submit();
	}
	
	
	
	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
		 $( "button.btn.btn-primary" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('Ȯ��')" ).html() );
			 fncAddDiary;
		});
		
		 $( "a.btn.btn-primary" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('�߰����')" ).html() );
				history.go(-1);
			});
	});




</script>
</head>


<body>

	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Tmmmi</a>
   		</div>
   	</div>
	
	<h1 class="bg-primary text-center">���̾ �� ��</h1>
	
	
		
		<div class="form-group">		
			<label for="userCategoryNo" class="col-sm-offset-1 col-sm-3 control-label text-center">����ī�װ�</label>
		    <div class="col-sm-4">
		      <input type="text" name="userCategoryNo" class="form-control" placeholder="����ī�װ�."/>
		       <span id="helpBlock" class="help-block">		      	
		      </span>
		    </div>
		</div>
		<hr/>
		    
		    <div class="form-group">
		    <label for="diaryTitle" class="col-sm-offset-1 col-sm-3 control-label text-center">����</label>
		    <div class="col-sm-4">
		      <input type="text" name="diaryTitle" class="form-control" placeholder="����"/>
		    </div>
		  </div>
		<hr/>
		<div class="form-group">
		    <label for="diaryDetail" class="col-sm-offset-1 col-sm-3 control-label text-center">����</label>
		    <div class="col-sm-4">
		      <input type="text" name="diaryDetail" class="form-control" />
		    </div>
		  </div>
		<hr/>
		  
		  
		  		  	  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label text-center">������ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" name="price" 	class="form-control" placeholder="�����ѹ�">
		      <span id="helpBlock" class="help-block">		      	 
		      </span>
		    </div>
		 </div>
		<hr/>
	

		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >���</button>
			  <a class="btn btn-primary" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		

	
</body>
</html>