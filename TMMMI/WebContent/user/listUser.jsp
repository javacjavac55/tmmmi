<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ȸ�� ��� ��ȸ</title>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- styleSheet -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<!-- ���� ����Ʈ -->
	<script type="text/javascript">
		function fncGetList(currentPage){
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/user/getUserList").submit();
		}
	</script>
</head>
<body>
	<!-- sideMenu.jsp �߰� -->
	<!-- ȭ�鱸�� -->
	<div style="width: 98%; margin-left: 10px;">
		<form name="detailForm">
		<input type="hidden" value="search"/>
			<div class="container">
				<div class="page-header text-info">
					<h3>ȸ�������ȸ</h3>
				</div>
				
				<!-- table ���� �˻� ����-->
				<div class="row">
					<div class="col-md-6 text-left">
						<p class="text-primary">
							��ü  ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage}  ������
						</p>
						<input type="hidden" id="currentPage" name="currentPage" value=""/>
					</div>		    
				</div>
			
				<!-- table ���� -->
				<table class="table table-hover table-striped" >   
					<thead>
						<tr>
							<th align="center">No</th>
							<th align="center" >ȸ�� ��ȣ</th>
							<th align="center">ȸ�� ���̵�</th>            
							<th align="center">SNS</th>
							<th align="center">Ż��</th>
							<th aling="center">Ż��¥</th>
							<th align="center">����</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="i" value="0" />
						<c:forEach var="user" items="${list}">
						<c:set var="i" value="${ i+1 }" />
							<tr>
								<td align="center">${ i }</td>
								<td align="center">${user.userNo}</td>
								<td align="center">${user.userId}</td>
								<!-- snsName -->
								<td align="center">
									<c:choose>
										<c:when test="${user.snsName eq 1}">īī��</c:when>
										<c:when test="${user.snsName eq 2}">���̹�</c:when>
										<c:when test="${user.snsName eq 3}">����</c:when>
										<c:otherwise>X</c:otherwise>
									</c:choose>
								</td>
								<!-- Ż�� ���� -->
								<td align="center">
									<c:choose>
										<c:when test="${user.withdrawCheck eq 1 }">Ż��</c:when>
										<c:otherwise>X</c:otherwise>
									</c:choose>
								</td>
								<td align="center">${user.withdrawDate}</td>
								<td align="center">����</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		
			<!-- PageNavigation ���� -->
			<jsp:include page="../common/pageNavigator.jsp"/>
		</form>
	</div>
</body>
</html>