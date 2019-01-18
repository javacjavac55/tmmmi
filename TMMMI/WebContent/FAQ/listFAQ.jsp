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
	
	<script type="text/javascript">
	
	function fncGetList(currentPage) {
		
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
	   	//document.detailForm.submit();
		$("form").attr("method" , "POST").attr("action" , "/faq/getFAQList").submit();
	}
	
	$(function() {	
		
		var faqNo=$(this).data("param1");
		$(".title").on("click",function(){
			/* alert("클릭됨?") */
			
			var faqNo=$(this).data("param1");
			$(".hide"+faqNo).toggleClass("show");
        });
		
		$("a:contains('글쓰기')" ).on("click" , function() {
			 self.location = "/faq/addFAQ";
		 });
		 
		$("a:contains('수정하기')" ).on("click" , function() {
			var faqNo =$(this).data("param2");
			 self.location = "/faq/updateFAQ?faqNo="+faqNo;
		 });
		
		$("a:contains('삭제하기')" ).on("click" , function() {
			var faqNo =$(this).data("param2");
			alert("asd");
			 self.location = "/faq/deleteFAQ?faqNo="+faqNo;
		 });
		
		$("button:contains('검색')" ).on("click" , function() {
			fncGetList(1);
		 });
 	});
	
</script>

<style>
		.title{cursor:pointer;}
</style>

</head>

<body>
<form name="listFAQ">

<div class="container">
	
	<div class="page-header">
		<h2>FAQ 검색</h2>
		<div>
			<select name="searchCondition" class="ct_input_g" style="width:80px; height:25px;">
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>글 제목</option>
				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>글 내용</option>
			</select>
			<input type="text" name="searchKeyword" 
						value="${! empty search.searchKeyword ? search.searchKeyword : ""}"  
						class="ct_input_g" style="width:200px; height:25px" > 
			<button type="button" class="btn btn-default" style="height:27px;">검색</button>
		</div>		
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
					<tr class="title${faq.FAQNo} title" data-param1="${faq.FAQNo}">
						<td class="text-center">${i}</td>
						<td>${faq.FAQTitle}</td>
						<td class="text-center">${faq.FAQDate}</td>
					</tr>
					<tr class="hide${faq.FAQNo} hide" >
						<td class="detail" >${faq.FAQDetail}
						<a class= "btn btn-default pull-right" data-param2="${faq.FAQNo}">수정하기</a>
						<a class= "btn btn-default pull-right" data-param2="${faq.FAQNo}">삭제하기</a></td>
					</tr>
			</c:forEach>
		</tbody>			
		</table>
		<hr/>
		
		<a class= "btn btn-default pull-right">글쓰기</a>
		
		
		<div>
			   <input type="hidden" id="currentPage" name="currentPage" value=""/>
				<jsp:include page="../common/pageNavigator.jsp"/>	
		</div>

</div>	
</form>
</body>

</html>