<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
     
</head>
<form>
	<br>
	<div>
		��ü  ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������
	</div>
	
	<table class="table">	
			<colgroup>
               <col style="width:10%;">
               <col style="width:15%;">
               <col style="width:50%;">
               <col style="width:15%;">
               <col style="width:10%;">
            </colgroup>
            
            <tr>
			   <td style="padding:0.7%; text-align: center">No</td>
			   <td style="padding:0.7%; text-align: center;">�з�����</td>
			   <td style="padding:0.7%; text-align: center;">����</td>
			   <td style="padding:0.7%;">�ۼ���¥</td>
			   <td style="padding:0.7%;">�亯��Ȳ</td>
		   	</tr>
			
		  	<c:set var="i" value="0" />
			<c:forEach var="qna" items="${list}">
			<c:set var="i" value="${i+1}" />
				<tr style="font-family: ���� ���; font-weight: 300">
					<td class="text-center" style="padding:0.7%;">${i}</td>
					<td class="text-center" style="padding:0.7%;">
						<c:if test="${qna.QNACategory == 0}">
							ȸ������
						</c:if><c:if test="${qna.QNACategory == 1}">
							���� ����
						</c:if><c:if test="${qna.QNACategory == 2}">
							������ ����
						</c:if><c:if test="${qna.QNACategory == 3}">
							���̾/����
						</c:if><c:if test="${qna.QNACategory == 4}">
							��Ÿ
						</c:if>
					</td>
					<td style="padding:0.7%;" class="QNAtitle" data-param1="${qna.QNANo}">${qna.QNATitle}</td>
					<td style="padding:0.7%;">${qna.QNADate}</td>
					<td style="padding:0.7%;">
						<c:if test="${qna.QNAAnswerCheck == 0}">
						 	���
						</c:if>
						<c:if test="${qna.QNAAnswerCheck == 1}">
							�Ϸ�
						</c:if>
					</td>
				</tr>
			</c:forEach>
	</table>
			
			<jsp:include page="../common/pageNavigator.jsp"/>
</form>
</html>
