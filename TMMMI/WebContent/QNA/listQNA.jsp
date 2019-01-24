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
	   	
	 <!-- template -->
	<link rel="stylesheet" href="/css/template/main.css">
	
	<script type="text/javascript">
	
	function fncGetList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
	   	//document.detailForm.submit();
		$("form").attr("method" , "POST").attr("action" , "/qna/getQNAList").submit();
	}
	
	$(function() {	
		
		$("a:contains('문의하기')" ).on("click" , function() {
			 self.location = "/qna/addQNA";
		 });
		
		$("button:contains('검색')" ).on("click" , function() {
			fncGetList(1);
		 });
		
		//제목 클릭시 getQNA 페이지로 이동
		$(".title" ).on("click" , function() {
			alert("sdf");
			var qnaNo =$(this).data("param1");
			self.location = "/qna/getQNA?qnaNo="+qnaNo;
		 });
		
		var answerCheck =$(this).data("param1");
		
		console.log(answerCheck)
	
 	});
	
</script>

<style>
		.title{cursor:pointer;}
		/* .finish{background-color: whitesmoke} */
</style>

</head>

<body>
<form name="listQNA">

<div class="container">
	
	<div class="page-header">
		<h2>1:1 문의하기</h2>
		<p align="right">
		<select name="searchCondition" class="ct_input_g" style="width:80px; height:25px;">
			<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>글 제목</option>
			<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>글 내용</option>
		</select>
		<input type="text" name="searchKeyword" 
					value="${! empty search.searchKeyword ? search.searchKeyword : ""}"  
					class="ct_input_g" style="width:200px; height:25px" > 
		<button type="button" class="btn btn-default" style="height:27px;">검색</button>
		</p>
	</div>
	
	<div>
		전체  ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage} 페이지
	</div>
	
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th class="col-md-2 text-center">No.</th>
				<th class="col-md-2 ">분류유형</th>
				<th class="col-md-4 text-center">질문</th>
				<th class="col-md-2 text-center">작성날짜</th>
				<th class="col-md-2 text-center">답변현황</th>
			</tr>
		</thead>

		<tbody>
			<c:set var="i" value="0" />
			<c:forEach var="qna" items="${list}">
			<c:set var="i" value="${i+1}" />
				<tr class="finish">
					<td class="text-center">${i}</td>
					<td >
						<c:if test="${qna.QNACategory == 0}">
							회원정보
						</c:if><c:if test="${qna.QNACategory == 1}">
							일정
						</c:if><c:if test="${qna.QNACategory == 2}">
							컨텐츠 설정
						</c:if><c:if test="${qna.QNACategory == 3}">
							다이어리/스크랩
						</c:if><c:if test="${qna.QNACategory == 4}">
							기타
						</c:if>
					</td>
					<td class="title" data-param1="${qna.QNANo}">${qna.QNATitle}</td>
					<td class="text-center">${qna.QNADate}</td>
					<td class="text-center" data-param2="${qna.QNAAnswerCheck}">
						<c:if test="${qna.QNAAnswerCheck == 0}">
						 	대기
						</c:if>
						<c:if test="${qna.QNAAnswerCheck == 1}">
							완료
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>			
		</table>
		<hr/>
		
		<a class= "btn btn-default pull-right" >1:1 문의하기</a>
		
		<div>
			   <input type="hidden" id="currentPage" name="currentPage" value="" />
				<jsp:include page="../common/pageNavigator.jsp"/>	
		</div>

</div>	
</form>
</body>

</html>