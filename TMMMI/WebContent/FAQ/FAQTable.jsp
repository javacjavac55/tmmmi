<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">


<head>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <script type="text/javascript">
		////////////////////////////////기본적으로 접혀있는상태
		$(document).ready(function() {	    	 
			$('.detail').slideToggle(1, function() {
	  	 });
		});
		
		////////////////////////////////누르면 펼쳐졌다 닫혔다
		  $(function() {  		    	
		  	$( ".title" ).on("click" , function() {
		  		var faqNo=$(this).data("param1");
		  		
		  		if(  $('.detail'+faqNo).is(":visible") ){
		  			$('.detail'+faqNo).slideUp(100);
		          }else{
		          	$('.detail'+faqNo).slideDown('fast');
		          }
				})
		  });
  </script>

</head>
<form>
<table class="table">	
			<colgroup>
               <col style="width:10%;">
               <col style="width:15%;">
               <col style="width:50%;">
               <col style="width:30%;">
            </colgroup>
            
            <tr>
			   <td style="padding:0.7%; text-align: center">No</td>
			   <td style="padding:0.7%; text-align: center;">분류유형</td>
			   <td style="padding:0.7%; text-align: center;">제목</td>
			   <td style="padding:0.7%;"></td>
		   	</tr>
			
		  	<c:set var="i" value="0" />
			<c:forEach var="faq" items="${list}">
			<c:set var="i" value="${i+1}" />
				<tr class="title${faq.FAQNo} title" data-param1="${faq.FAQNo}" style="font-family: 맑은 고딕; font-weight: 300">
					<td class="text-center" style="padding:0.7%;">${i}</td>
					<td class="text-center" style="padding:0.7%;">
						<c:if test="${faq.FAQCategory == 0}">
							회원정보
						</c:if><c:if test="${faq.FAQCategory == 1}">
							일정
						</c:if><c:if test="${faq.FAQCategory == 2}">
							컨텐츠 설정
						</c:if><c:if test="${faq.FAQCategory == 3}">
							다이어리/할일
						</c:if>
					</td>
					<td style="padding:0.7%;">${faq.FAQTitle}</td>
					<td style="padding:0.7%;"></td>
				</tr>
				
				<tr class="detail${faq.FAQNo} detail" >
					<td style="padding:0.7%;"></td>
					<td style="padding:0.7%;"></td>
					<td style="padding:0.7%;">${faq.FAQDetail} 
						<c:if test="${role == 0}">
							<button type="button"  class="btn btn-primary btn-round btn-sm" style="left: 95%;" data-param1="${faq.FAQNo}">수정하기</button>
							<button type="button"  class="btn btn-primary btn-round btn-sm" style="left: 95%;" data-param2="${faq.FAQNo}">삭제하기</button>
						</c:if>
					</td>
					<td style="padding:0.7%;"></td>
				</tr>
				
			</c:forEach>
			</table>			
			</form>
			<jsp:include page="../common/pageNavigator.jsp"/>
</html>