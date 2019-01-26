<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>내 정보 보기</title>
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
<!-- style -->
<style type="text/css">
	.page-header .title, .page-header>.container { color : ${userSetting.menuFontColor}; }
	.navbar .navbar-brand { color : ${userSetting.menuFontColor}; }
	.navbar.navbar-transparent { color : ${userSetting.menuFontColor}; }
</style>

<!-- 버튼 이벤트 -->
<script type="text/javascript">
	$(function() {
		$(document).on('click', 'button.btn.btn-primary', function() {
			self.location = "/user/updateUser"
		});
	})
</script>

</head>

<body class="index-page sidebar-collapse">
	<jsp:include page="/common/toolbar2.jsp"></jsp:include>
	<div class="page-header header-filter clear-filter" style="background-image: url('/images/template/image_6845277191476929532543.jpg')" data-parallax="true">
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
				<div class="row">
					<div class="col-md-6 ml-auto mr-auto">
						<div class="profile">

							<div class="description text-center">
								<div class="form-group bmd-form-group">
									<label class="bmd-label-static">Id</label> <input type="text" class="form-control" value="${user.userId }" readonly="readonly">
								</div>
							</div>

							<div class="description text-center">
								<div class="form-group bmd-form-group">
									<label class="bmd-label-static">Name</label> <input type="text" class="form-control" value="${user.userName }" readonly="readonly">
								</div>
							</div>

							<div class="description text-center">
								<div class="form-group bmd-form-group">
									<label class="bmd-label-static">Email</label> <input type="text" class="form-control" value="${user.email }" readonly="readonly">
								</div>
							</div>
							
							<div class="description text-center">
								<div class="form-group bmd-form-group">
									<label class="bmd-label-static">Birthday</label> <input type="text" class="form-control" value="${user.birthday }" readonly="readonly">
								</div>
							</div>

							<div class="row">
								<div class="col-md-12 text-center ">
									<button type="button" class="btn btn-primary btn-round">회원정보수정</button>
								</div>
								<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>
