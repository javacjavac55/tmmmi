<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--
<%
	Product product = (Product)request.getAttribute("product");
	String menu = request.getParameter("menu");
	User vo = (User) session.getAttribute("user");

	String role = "";

	if (vo != null) {
		role = vo.getRole();
	}
%>	
--%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>��ǰ����ȸ</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
    
   
   <style>
 		body {
            padding-top : 50px;
        }
     </style>
     
	<script type="text/javascript">	
	
	
	</script>
</head>
	
<body>
	
	
	<div class="container">
	
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>���̾��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${diary.diaryNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>����ī�װ�</strong></div>
			<div class="col-xs-8 col-md-4">${diary.userCategoryNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>����</strong></div>
			<div class="col-xs-8 col-md-4">${diary.diaryTitle}</div>
			
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>����</strong></div>
			<div class="col-xs-8 col-md-4">${diary.diaryDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��¥</strong></div>
			<div class="col-xs-8 col-md-4">${diary.diaryDate}</div>
		</div>
		
		<hr/>
		
		
		
		<hr/>
	</div>
		
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>

</html>