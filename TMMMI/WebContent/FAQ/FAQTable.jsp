<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />

       
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
			   <td style="padding:0.7%; text-align: center;">�з�����</td>
			   <td style="padding:0.7%; text-align: center;">����</td>
			   <td style="padding:0.7%;"></td>
		   	</tr>
			
		  	<c:set var="i" value="0" />
			<c:forEach var="faq" items="${list}">
			<c:set var="i" value="${i+1}" />
				<tr class="title${faq.FAQNo} title" data-param1="${faq.FAQNo}" style="font-family: ���� ���; font-weight: 300">
					<td class="text-center" style="padding:0.7%;">${i}</td>
					<td class="text-center" style="padding:0.7%;">
						<c:if test="${faq.FAQCategory == 0}">
							ȸ������
						</c:if><c:if test="${faq.FAQCategory == 1}">
							����
						</c:if><c:if test="${faq.FAQCategory == 2}">
							������ ����
						</c:if><c:if test="${faq.FAQCategory == 3}">
							���̾/��ũ��
						</c:if>
					</td>
					<td style="padding:0.7%;">${faq.FAQTitle}</td>
					<td style="padding:0.7%;"></td>
				</tr>
				<tr class="hide${faq.FAQNo} hide" >
					<td style="padding:0.7%;"></td>
					<td style="padding:0.7%;"></td>
					<td class="detail" style="padding:0.7%;">${faq.FAQDetail} 
						<c:if test="${role == 0}">
							<button type="button"  class="btn btn-primary btn-round btn-sm" style="left: 95%;" data-param1="${faq.FAQNo}">�����ϱ�</button>
							<button type="button"  class="btn btn-primary btn-round btn-sm" style="left: 95%;" data-param2="${faq.FAQNo}">�����ϱ�</button>
						</c:if>
					</td>
					<td style="padding:0.7%;"></td>
				</tr>
			</c:forEach>
			</table>
			
			<jsp:include page="../common/pageNavigator.jsp"/>
</form>
</html>