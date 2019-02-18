<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>����� ����</title>
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
<!-- ��ư �̺�Ʈ -->
<script type="text/javascript">
$(function(){
	$("#update").on("click", function(){
		self.location = "/userSetting/updateUserSetting";
	});
});
</script>

<!-- �߰��� �κ� -->
<style>
	.form-group{
		width: 100%; 
		text-align: center;
	}
	.bmd-label-static{
		width: 100%;
		text-align:center;
	}
	#chgcolor{
		display: inline-block;
	}
</style>

</head>


<body class="index-page sidebar-collapse">
	<jsp:include page="/common/toolbar2.jsp"></jsp:include>
	<div class="page-header header-filter clear-filter" data-parallax="true" style="background-image: url('/images/userSetting/${userSetting.image}')">
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
									<c:if test="${userSetting.mainColorModeNo eq 0}">
										<div id="chgcolor" style="background-color:#483949; width:300px; border:solid 1px">
											������ ���� �Դϴ�.
										</div>
										<div id="chgcolor" style="background-color:#fafafa; width:300px;border:solid 1px">
											������ ��Ʈ�� �Դϴ�.
										</div>
									</c:if>
									<c:if test="${userSetting.mainColorModeNo eq 1}">
										<div id="chgcolor" style="background-color:#fafafa; width:300px;border:solid 1px">
											������ ���� �Դϴ�.
										</div>
										<div id="chgcolor" style="background-color:#483949; width:300px;border:solid 1px">
											������ ��Ʈ�� �Դϴ�.
										</div>
									</c:if>
								</div>
							</div>
							<br>

							<div class="description text-center">
								<div class="form-group bmd-form-group" >
									<label class="bmd-label-static" width: 100%;>Menu Font Color</label> 
									<div id="chgcolor" style="background-color:${userSetting.menuFontColor};width:300px;border:solid 1px;">
										������ �޴� ��Ʈ �����Դϴ�.
									</div>
								</div>
							</div>
							<br>
							
							<div class="description text-center">
								<div class="form-group bmd-form-group">
									<label class="bmd-label-static">Image</label>
									<c:if test="${ empty userSetting.image  }"><input type="text" class="form-control" value="�̹����� �����ϴ�. �������ּ���!" readonly="readonly"></c:if> 
									<c:if test="${ ! empty userSetting.image }"><img src="/images/userSetting/${userSetting.image}"  height="80%" width="55%"></c:if>
								</div>
							</div>
							<br>

							<div class="row">
								<div class="col-md-12 text-center ">
									<button type="button" class="btn btn-primary btn-round" id="update">����� ���� ����</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br><br>
			</div>
		</div>
	</div>
	<jsp:include page="/common/footer.jsp"></jsp:include>
</body>

</html>