<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> shoppingContent </title>
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	   	
	<script type="text/javascript">
	
	$(function() {
		
		$('button').on("click" , function() {

			  $.ajax({
				   type:"GET",
				   url:"/contentRest/getContentList",
				   dataType : "json",
				   headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
				   success:function(data){
					   console.log(data);
				   },
				   error: function(xhr,status,error){
					   alert('다시 시도해 주십시오.');
				   }
			  }); 
		});
	});
	
</script>

<style>
	
</style>

</head>

<body>
<form name="shoppingContent">

	<button type="button">버튼</button>

</form>
</body>

</html>