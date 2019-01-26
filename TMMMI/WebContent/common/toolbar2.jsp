<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
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
				<a href="/todo/getToDoMonthGraph">�� �� �׷���</a>
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
</body>
</html>