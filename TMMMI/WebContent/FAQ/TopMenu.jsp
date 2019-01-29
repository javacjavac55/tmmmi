<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <title>listFAQ</title>
  
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  
  <!--  Fonts and icons -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  
  <!-- CSS Files -->
  <link href="/css/template/material-kit.css" rel="stylesheet" />

  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
</head>

<body class="index-page sidebar-collapse">
<jsp:include page="/common/toolbar2.jsp"></jsp:include>
  <div class="page-header header-filter clear-filter purple-filter" data-parallax="true">
    <div class="container">
      <div class="row">
        <div class="col-md-8 ml-auto mr-auto">
          <div class="brand">
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="main main-raised">
    <div class="section section-basic">
      <div class="container">
		 <div align="center">이 부분에 코딩한거 넣으세요~^_^*
		 <br/>toolbar2, footer부분 주석 풀고 원래문장 지우면 됨!</div>
      </div>
    </div>
  </div>
  <%-- <jsp:include page="/common/footer.jsp"></jsp:include> --%>
  <jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>