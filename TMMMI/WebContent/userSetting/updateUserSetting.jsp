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
            <h2 class="title">UserSetting Update</h2>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="main main-raised">
    <div class="section section-basic">
      <div class="container" style="width: 500px; heigth:700px;">
		 <form>
		  <div id="picker" style="float: right;"></div>
		  <div class="form-item"><label for="color1">Color 1:</label><input type="text" id="color1" name="color1" class="colorwell" value="#000000" /></div>
		  <div class="form-item"><label for="color2">Color 2:</label><input type="text" id="color2" name="color2" class="colorwell" value="#ffffff" /></div>0
		</form>
      </div>
    </div>
  </div>
  <jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>