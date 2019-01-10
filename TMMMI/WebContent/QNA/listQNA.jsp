<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> listQNA </title>
	
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
	
		$.ajax({
		    type: "POST",
		    url: "/호출할 주소",
		    data: {key01:"value01", key02:"value02"},
		    success:function(result){
		        // 통신이 성공적으로 이루어진 경우 처리할 함수
		    },
		    complete:function(result){
		        // 통신이 실패했어도 완료 시 처리할 함수
		    },
		    error:function(xhr, status, error){
		        // 에러가 발생한 경우 처리할 함수
		    }
		});

	</script>	
	
</head>

	<body>
	


	</body>

</html>
	