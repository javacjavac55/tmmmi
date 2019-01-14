<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> listFAQ </title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	
	<script type="text/javascript">
	
		$(document).ready(function(){
			//클릭하면 닫혔다 열렸다
			$(".clickk").on("click",function(){
				$("#asd").toggleClass("bline");
	        });
	 	});

	</script>
	
	<style>
   		.table .clickk{cursor:pointer;}
  		.hide{display:none;} 

	</style>

</head>

<body>
	<form name="listFAQ">
	
	<div class="container">
		
		<div class="page-header">
			<h2>FAQ 검색</h2>
		</div>
		
		<table class="table table-striped table-hover">
			<thead>
				<tr>
				<th class="col-md-1 text-center">No.</th>
				<th class="col-md-6">제목</th>
				<th class="col-md-1 text-center">작성날짜</th>
				</tr>
			</thead>
	
			<tbody>
				<c:set var="i" value="0" />
				<c:forEach var="faq" items="${list}">
					<c:set var="i" value="${i+1}" />
					<tr>
						<td class="text-center">${i}</td>
						<td class="clickk">${faq.FAQTitle}</td>
						<td class="text-center">${faq.FAQDate}</td>
					</tr>
					<tr>
						<td></td>
						<td class="hide" id="asd">${faq.FAQDetail}</td>
						<td></td>
					</tr>
				</c:forEach>
			</tbody>			
 		</table>
 		
 		<a class= "btn btn-default pull-right">글쓰기</a>
 		
 		
	</div>	
	</form>
</body>

</html>