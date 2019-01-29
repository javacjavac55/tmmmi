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

<!-- color picker -->
<script type="text/javascript" src="/javascript/colorPicker/farbtastic.js"></script>
<link rel="stylesheet" href="/css/colorPicker/farbtastic.css" type="text/css" />

<!-- style -->
<style type="text/css">
	.farbtastic{
		margin: 0 auto;
	}
</style>

<script type="text/javascript" charset="utf-8">
$(document).ready(function() {
    var f = $.farbtastic('#picker');
    var selected;
    $('.colorwell')
      .each(function () { f.linkTo(this);})
      .focus(function() {
        if (selected) {
          $(selected).removeClass('colorwell-selected');
        }
        f.linkTo(this);
        $(selected = this).css('opacity', 1).addClass('colorwell-selected');
      });
  });
</script>

<!-- 버튼 이벤트 -->
<script type="text/javascript">
$(function(){
	$("#update").on("click", function(){
		$("form").attr("method" , "POST").attr("action" , "/userSetting/updateUserSetting").submit();
	});
});
</script>
</head>
<body class="index-page sidebar-collapse">
<!-- top menu -->
<jsp:include page="/common/toolbar2.jsp"></jsp:include>

<!-- page header -->
<div class="page-header header-filter clear-filter" data-parallax="true" style="background-image: url('/images/userSetting/ ${userSetting.image}')">
	<div class="container">
		<div class="row">
			<div class="col-md-8 ml-auto mr-auto">
				<div class="brand">
					<h2 class="title">UserSetting Update</h2>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- main -->
<div class="main main-raised">
	<div class="section section-basic">
	<form enctype="multipart/form-data">
		<div class="container">
			<div class="tab-content tab-space" style="margin :0 auto;">
				<div class="row">
					<div class="col-md-3 ml-auto" style="margin :0 auto;" >
						<div class="description text-center">
							<div class="form-group bmd-form-group">
								<label class="bmd-label-static">Main Color</label>
								<div class="form-check form-check-radio">
									<label class="form-check-label">
										<input class="form-check-input" type="radio" name="mainColorModeNo" id="mainColorModeNo0" value="0"  ${ ! empty userSetting.mainColorModeNo && userSetting.mainColorModeNo eq 0 ? "checked" : "" } >
										<div id="chgcolor" style="background-color:#483949;heihgt:50px;width:280px;border:solid 1px">
										컨텐츠 배경색 입니다.
										</div>
										<div id="chgcolor" style="background-color:#fafafa;heihgt:50px;width:280px;border:solid 1px">
										컨텐츠 폰트색 입니다.
										</div>
										<span class="circle">
											<span class="check"></span>
										</span>
									</label>
								</div>
								<div class="form-check form-check-radio">
									<label class="form-check-label">
										<input class="form-check-input" type="radio" name="mainColorModeNo" id="mainColorModeNo1" value="1"  ${ ! empty userSetting.mainColorModeNo && userSetting.mainColorModeNo eq 1 ? "checked" : "" }>
										<div id="chgcolor" style="background-color:#fafafa;heihgt:50px;width:280px;border:solid 1px">
										컨텐츠 배경색 입니다.
										</div>
										<div id="chgcolor" style="background-color:#483949;heihgt:50px;width:280px;border:solid 1px">
										컨텐츠 폰트색 입니다.
										</div>
										<span class="circle">
										<span class="check"></span>
										</span>
									</label>
								</div>
							</div>
							<br/>
							<div>
								<input type="file" name="file" class="form-control" maxLength="13" /><br/><br/>
							</div>
							<div class="form-group bmd-form-group">
								<label class="bmd-label-static">Menu Font Color</label>
								<div id="picker"></div>
								<div><label style="width:195px;" for="color1">현재 메뉴 폰트 색상:</label><input type="text" id="color1" name="color1" class="colorwell" value="${userSetting.menuFontColor }" /></div>
								<div><label style="width:195px;" for="menuFontColor">변경할 메뉴 폰트 색상:</label><input type="text" id="menuFontColor" name="menuFontColor" class="colorwell" value="${userSetting.menuFontColor }" /></div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 text-center ">
								<br/>
								<button type="button" class="btn btn-primary btn-round" id="update">사용자 설정 수정</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	</div>
</div>

<!-- footer -->
<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>