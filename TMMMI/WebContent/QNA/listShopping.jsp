<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> listShopping </title>
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<style>
	</style>
   	
	<script type="text/javascript">
	
	$(function() {
		var userId = $(this).next().val();
		
		$.ajax( 
				{
					url : "/user/json/getUser/"+userId ,
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {

						var displayValue = "<h6>"
													+"아이디 : "+JSONData.userId+"<br/>"
													+"이  름 : "+JSONData.userName+"<br/>"
													+"이메일 : "+JSONData.email+"<br/>"
													+"ROLE : "+JSONData.role+"<br/>"
													+"등록일 : "+JSONData.regDate+"<br/>"
													+"</h6>";
						$("h6").remove();
						$( "#"+userId+"" ).html(displayValue);
					}
			});
		
	});
		
		

	</script>	
	
	</head>

	<body>
	
	


	</body>

</html>
	