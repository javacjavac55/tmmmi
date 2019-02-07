<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



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
	<div class="page-header header-filter clear-filter" data-parallax="true" style="background-image: url('/images/userSetting/ ${userSetting.image}')">
		<div class="container">
			<div class="row">
				<div class="col-md-8 ml-auto mr-auto">
					<div class="brand">
						<h2 class="title">Diary</h2>						
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
							
								<div class="form-group" align="left">
									<label for="userCategoryNo" class="col-sm-offset-1 col-sm-1 control-label text-center"></label>
									<div class="col-sm-12" >
										<strong>ī�װ� : </strong>${userCategory.userCategoryName}								
									</div>
								</div>
								<div class="progress progress-line-primary">
                					<div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width:0%;">
					                  <span class="sr-only">60% Complete</span>
                					</div>
              					</div>
								
								<div class="form-group" align="left" style="height:50px;">
									<label for="diaryTitle" class="col-sm-offset-1 col-sm-1 control-label text-center"></label>
									<div class="col-sm-12" >
										<span style="float:left; font-weight:bold; font-size:2em;">${diary.diaryTitle}</span>
										<span style="float:right;"><strong>�ۼ���¥ : </strong>${diary.diaryDate}</span>
									</div>
								</div>
								
								<div class="progress progress-line-primary">
                					<div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
					                  <span class="sr-only">60% Complete</span>
                					</div>
              					</div>
              					
								<div class="form-group" align="left" style="height:500px;">
									<label for="diaryDetail" class="col-sm-offset-1 col-sm-1 control-label text-center"></label>
									<div class="col-sm-12" >
										${diary.diaryDetail}
									</div>
								</div>
								<hr/>
								<div class="form-group">
									<div class="col-sm-offset-4  col-sm-4 text-center">
										<button type="button" id="update" class="btn btn-primary" data-param1="${diary.diaryNo}">����</button>
										<button type="button" id="back" class="btn btn-default" >Ȯ��</button>
									</div>
								</div>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- <jsp:include page="/common/footer.jsp"></jsp:include> --%>
	<jsp:include page="/common/footer.jsp"></jsp:include>
</body>

</html>