<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>�� ���� ����</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link href="/css/template/material-kit.css" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/css/template/demo.css" rel="stylesheet" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- ���� ����Ʈ -->
<script type="text/javascript">
	function fncGetList(currentPage){
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/user/getUserList").submit();
	}
</script>
</head>
<body class="index-page sidebar-collapse">
	<jsp:include page="/common/toolbar2.jsp"></jsp:include>
	<div class="page-header header-filter clear-filter" data-parallax="true" style="background-image: url('/images/userSetting/ ${userSetting.image}')">
		<div class="container">
			<div class="row">
				<div class="col-md-8 ml-auto mr-auto">
					<div class="brand">
						<h2 class="title">My Page</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="main main-raised">
		<div class="section section-basic">
			<div class="container">
				<div align="center">
					<div id="wrapper">
						<div id="main">
				
							<!-- table ���� �˻� ����-->
							<div class="row">
								<div class="col-md- text-left">
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
						<jsp:include page="/common/pageNavigator.jsp"/>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>