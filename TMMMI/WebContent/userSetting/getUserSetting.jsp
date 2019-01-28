<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>사용자 설정</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
<!--  Fonts and icons -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link href="/css/template/material-kit.css" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/css/template/demo.css" rel="stylesheet" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 버튼 이벤트 -->
<script type="text/javascript">
$(function(){
	$("#update").on("click", function(){
		self.location = "/userSetting/updateUserSetting";
	});
});
</script>
</head>

<body class="index-page sidebar-collapse">
	<jsp:include page="/common/toolbar2.jsp"></jsp:include>
	<div class="page-header header-filter clear-filter" data-parallax="true" style="background-image: url(' ${ ! empty userSetting.image ? " ${userSetting.image}" : " /images/template/image_6845277191476929532543.jpg" }')">
		<div class="container">
			<div class="row">
				<div class="col-md-8 ml-auto mr-auto">
					<div class="brand">
						<h2 class="title">User Setting</h2>
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
									<label class="bmd-label-static">Main Color</label> 
									<input type="text" class="form-control" value="${userSetting.mainColorModeNo }" readonly="readonly">
								</div>
							</div>

							<div class="description text-center">
								<div class="form-group bmd-form-group">
									<label class="bmd-label-static">Menu Font Color</label> 
									<input type="text" class="form-control" value="${userSetting.menuFontColor }" readonly="readonly">
								</div>
							</div>

							<div class="description text-center">
								<div class="form-group bmd-form-group">
									<label class="bmd-label-static">Alarm</label> 
									<c:if test="${userSetting.showScrapAlarm eq 0}"><input type="text" class="form-control" value="알람을 사용하지 않습니다."></c:if>
									<c:if test="${userSetting.showScrapAlarm eq 1}"><input type="text" class="form-control" value="${userSetting.scrapAlarmTime }" readonly="readonly"></c:if>
								</div>
							</div>
							
							<div class="description text-center">
								<div class="form-group bmd-form-group">
									<label class="bmd-label-static">Image</label>
									<c:if test="${ empty userSetting.image  }"><input type="text" class="form-control" value="이미지가 없습니다. 수정해주세요!" readonly="readonly"></c:if> 
									<c:if test="${ ! empty userSetting.image }">이미지 띄우기</c:if>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12 text-center ">
									<button type="button" class="btn btn-primary btn-round" id="update">사용자 설정 수정</button>
								</div>
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