<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%--
<%
	Product product = (Product)request.getAttribute("product");
	String menu = request.getParameter("menu");
	User vo = (User) session.getAttribute("user");

	String role = "";

	if (vo != null) {
		role = vo.getRole();
	}
%>	
--%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Tmmmi</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--  Fonts and icons -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link href="/css/template/material-kit.css" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/css/template/demo.css" rel="stylesheet" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
body {
	padding-top: 50px;
}
</style>

<script type="text/javascript">
	$(function() {

		$('#update').on("click", function() {
			var diaryNo = $(this).data('param1');
			self.location = "/diary/updateDiary?diaryNo=" + diaryNo;
		});

		$('#back').on("click", function() {
			self.location = "/diary/listDiary";
		});
	});
</script>
</head>

<body class="index-page sidebar-collapse">
	<%-- <jsp:include page="/common/toolbar2.jsp"></jsp:include> --%>
	<jsp:include page="/common/toolbar2.jsp"></jsp:include>
	<div class="page-header header-filter clear-filter purple-filter"
		data-parallax="true">
		<div class="container">
			<div class="row">
				<div class="col-md-8 ml-auto mr-auto">
					<div class="brand">
						<h2 class="title">Tmmmi Side Menu</h2>
						<h3 class="title">��� �������ô�</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="main main-raised">
		<div class="section section-basic">
			<div class="container">
				<div align="center">
					<!-- Wrapper -->
					<div id="wrapper">

						<!-- Main -->
						<div id="main">
							<div class="info">
								<a href="/diary/listDiary" class="logo"><h2>
										<strong>���̾</strong>
									</h2>&nbsp;&nbsp;&nbsp;<strong>���� ī�װ� :</strong>&nbsp;
									${diary.userCategoryNo}</a>
								<p align="right">
									<strong>�ۼ���¥ : </strong>${diary.diaryDate}</p>


								<h4 class="info-title">${diary.diaryTitle}</h4>
								<p>${diary.diaryDetail}</p>
							</div>

						</div>
						<div align="right" style="margin-left: 70%;">
							<button type="button" id="update" class="btn btn-primary"
								data-param1="${diary.diaryNo}">����</button>
							<button type="button" id="back" class="btn btn-default">Ȯ��</button>
						</div>
					</div>



					<hr />
				</div>
			</div>
		</div>
	</div>
	<%-- <jsp:include page="/common/footer.jsp"></jsp:include> --%>
	<jsp:include page="/common/footer.jsp"></jsp:include>
</body>

</html>