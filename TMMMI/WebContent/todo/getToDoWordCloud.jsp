<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- JQcloud CSS -->
<link rel="stylesheet" href="/css/jqcloud/jqcloud.min.css">
<!-- Material Kit JS -->
<script src="/javascript/template/core/jquery.min.js" type="text/javascript"></script>
<script src="/javascript/template/core/bootstrap-material-design.min.js" type="text/javascript"></script>
<script async defer src="https://buttons.github.io/buttons.js"></script>
<script src="/javascript/template/material-kit.js?v=2.0.5" type="text/javascript"></script>
<link href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Material Kit CSS -->
<link href="/css/template/material-kit.min.css?v=2.0.5" rel="stylesheet" />
<link href="/css/template/demo.css" rel="stylesheet" />
<!-- JQcloud JS -->
<script src="/javascript/jqcloud/jqcloud.min.js" charset="utf-8"></script>
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<title>TMMMI</title>
<style>
	#todocloud {
		height: 500px;
		width: 500px;
	}
</style>
</head>
<body class="index-page sidebar-collapse">
<jsp:include page="/common/toolbar2.jsp"></jsp:include>
  <div class="page-header header-filter clear-filter" data-parallax="true" style="background-image: url('/images/userSetting/ ${userSetting.image}')">
    <div class="container">
      <div class="row">
        <div class="col-md-8 ml-auto mr-auto">
          <div class="brand">
          	<h2 class="title">ToDo WordCloud</h2>
            <h3 class="title">Your Words </h3>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="main main-raised">
    <div class="section section-basic">
      <div class="container">
		<div id="todocloud" class="todocloud">
			</div>
			<script>
			$(function () {
				var words =${wordList};
				
			$('#todocloud').jQCloud(words,{
				autoResize : true,
				colors: ["#800026", "#bd0026", "#e31a1c", "#fc4e2a", "#fd8d3c", "#feb24c", "#fed976", "#ffeda0", "#ffffcc"]
			});
			console.log('words');
			});
			</script>
      </div>
    </div>
  </div>
  <jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>