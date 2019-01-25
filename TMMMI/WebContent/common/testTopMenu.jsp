<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>Tmmmi</title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="/css/template/material-kit.css" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="/css/template/demo.css" rel="stylesheet" />
</head>

<body class="index-page sidebar-collapse">
  <nav class="navbar navbar-transparent navbar-color-on-scroll fixed-top navbar-expand-lg" color-on-scroll="100" id="sectionsNav">
    <div class="container">
      <div class="navbar-translate">
        <a class="navbar-brand" href="http://localhost:8080/common/TopMenu.jsp">Tmmmi</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="sr-only">Toggle navigation</span>
          <span class="navbar-toggler-icon"></span>
          <span class="navbar-toggler-icon"></span>
          <span class="navbar-toggler-icon"></span>
        </button>
      </div>
      <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
          <!-- ���� -->
          <li class="dropdown nav-item">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">����</a>
            <div class="dropdown-menu dropdown-with-icons">
				<a href="/common/color-picker.jsp" class="dropdown-item"> �÷���Ŀ </a>
				<a href="/calendar/addUserCategory.jsp" class="dropdown-item">���� ī�װ�</a>
				<a href="/calendar/getCalendarMonth" class="dropdown-item">�� �޷�</a>
				<a href="/calendar/getCalendarInterest" class="dropdown-item">���ɻ� �޷�</a>
            </div>
          </li>
          <!-- ���� -->
          <li class="dropdown nav-item">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">����</a>
            <div class="dropdown-menu dropdown-with-icons">
				<a href="/user/addUser.jsp" class="dropdown-item">ȸ������</a>
				<a href="/user/login.jsp" class="dropdown-item">�α���</a>
				<a href="/user/getUserList" class="dropdown-item">ȸ�� ����Ʈ</a>
				<a href="/user/searchUserId.jsp" class="dropdown-item">���̵� ã��</a>
				<a href="/user/getUser.jsp" class="dropdown-item">�� ���� ����</a>
            </div>
          </li>
          <!-- �߿� -->
          <li class="dropdown nav-item">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">�߿�</a>
            <div class="dropdown-menu dropdown-with-icons">
				<a href="/diary/addDiary.jsp" class="dropdown-item">���̾ ���</a>
				<a href="/diary/listDiary" class="dropdown-item">���̾ ����Ʈ</a>
				<a href="/content/sportContent.jsp" class="dropdown-item">������ ����Ʈ</a>
            </div>
          </li>
          <!-- ���� -->
          <li class="dropdown nav-item">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">����</a>
            <div class="dropdown-menu dropdown-with-icons">
				<a href="/todo/getToDoList" class="dropdown-item">�� �� ����Ʈ</a>
				<a href="/content/tastyContent.jsp" class="dropdown-item">�����������ڽ�</a>
            </div>
          </li>
          <!-- ���� -->
          <li class="dropdown nav-item">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">����</a>
            <div class="dropdown-menu dropdown-with-icons">
				<a href="/faq/getFAQList" class="dropdown-item">FAQ ����Ʈ</a>
				<a href="/qna/getQNAList" class="dropdown-item">QNA ����Ʈ</a>
				<a href="/widget/getWeather3.jsp" class="dropdown-item">���� </a>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="page-header header-filter clear-filter purple-filter" data-parallax="true" style="background-image: url('./assets/img/bg2.jpg');">
    <div class="container">
      <div class="row">
        <div class="col-md-8 ml-auto mr-auto">
          <div class="brand">
            <h1>Tmmmi</h1>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="main main-raised">
    <div class="section section-basic">
      <div class="container">
		 <div aling="center">^-^</div>
      </div>
    </div>
  </div>

  <footer class="footer" data-background-color="black">
    <div class="container">
      <nav class="float-left">
        <ul>
          <li>
          	Calendar
          </li>
          <li>
          	Content
          </li>
        </ul>
      </nav>
      <div class="copyright float-right">
        <i class="material-icons">favorite</i>Tmmmi
      </div>
    </div>
  </footer>
  <!--   Core JS Files   -->
  <script src="/javascript/template/core/jquery.min.js" type="text/javascript"></script>
  <script src="/javascript/template/core/popper.min.js" type="text/javascript"></script>
  <script src="/javascript/template/core/bootstrap-material-design.min.js" type="text/javascript"></script>
  <script src="/javascript/template/plugins/moment.min.js"></script>
  <!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
  <script src="/javascript/template/plugins/bootstrap-datetimepicker.js" type="text/javascript"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="/javascript/template/plugins/nouislider.min.js" type="text/javascript"></script>
  <!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
  <script src="/javascript/template/material-kit.js" type="text/javascript"></script>
</body>

</html>