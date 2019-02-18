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
		////////////////////////////////�⺻������ �����ִ»���
		$(document).ready(function() {	    	 
			$('.detail').slideToggle(1, function() {
	  	 });
		});
		
		////////////////////////////////������ �������� ������
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
               <col style="width:20%;">
               <col style="width:70%;">
            </colgroup>
            
            <tr>
			   <td style="padding:0.7%; text-align: center">No</td>
			   <td style="padding:0.7%; text-align: center;">�з�����</td>
			   <td style="padding:0.7%; text-align: center;">����</td>
		   	</tr>
			
		  	<c:set var="i" value="0" />
			<c:forEach var="faq" items="${list}">
			<c:set var="i" value="${i+1}" />
				<tr class="title${faq.FAQNo} title" data-param1="${faq.FAQNo}" style="font-family: ���� ���; font-weight: 300" onMouseover="this.style.backgroundColor='#ede3fb';" onMouseout="this.style.backgroundColor='rgb(0,0,0,0)';">
					<td class="text-center" style="padding:0.7%;">${i}</td>
					<td class="text-center" style="padding:0.7%;">
						<c:if test="${faq.FAQCategory == 0}">
							ȸ������
						</c:if><c:if test="${faq.FAQCategory == 1}">
							����
						</c:if><c:if test="${faq.FAQCategory == 2}">
							������ ����
						</c:if><c:if test="${faq.FAQCategory == 3}">
							���̾/����
						</c:if>
					</td>
					<td style="padding:0.7%;">${faq.FAQTitle}</td>
				</tr>
				
				<tr class="detail${faq.FAQNo} detail" >
					<td style="padding:0.7%;"></td>
					<td style="padding:0.7%;"></td>
					<td style="padding:0.7%;">${faq.FAQDetail}
						<c:if test="${role == 0}">
							<button type="button"  class="btn btn-primary btn-round btn-sm" data-param1="${faq.FAQNo}">�����ϱ�</button>
							<button type="button"  class="btn btn-primary btn-round btn-sm" data-param2="${faq.FAQNo}">�����ϱ�</button>
						</c:if>
					</td>
				</tr>
				
			</c:forEach>
			</table>			
			</form>
			<br>
			<jsp:include page="../common/pageNavigator.jsp"/>
</html>