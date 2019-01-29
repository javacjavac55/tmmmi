<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- style -->
<style type="text/css">
	.page-header .title, .page-header>.container { color : ${userSetting.menuFontColor}; }
	.navbar .navbar-brand { color : ${userSetting.menuFontColor}; }
	.navbar.navbar-transparent { color : ${userSetting.menuFontColor}; }
</style>
</head>
<body>
  <nav class="navbar navbar-transparent navbar-color-on-scroll fixed-top navbar-expand-lg" color-on-scroll="100" id="sectionsNav">
    <div class="container">
      <div class="navbar-translate">
       <!--  <a class="navbar-brand" href="http://localhost:8080/common/TopMenu.jsp">Tmmmi</a> -->
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
				<a href="/user/addUser" class="dropdown-item">ȸ������</a>
				<a href="/user/snsAddUser" class="dropdown-item">SNS ȸ������</a>
				<a href="/user/login" class="dropdown-item">�α���</a>
				<a href="/user/getUserList" class="dropdown-item">ȸ�� ����Ʈ</a>
				<a href="/user/searchUserId.jsp" class="dropdown-item">���̵� ã��</a>
				<a href="/user/searchUserPw.jsp" class="dropdown-item">��й�ȣ ã��</a>
				<a href="/user/getUser" class="dropdown-item">�� ���� ����</a>
				<a href="/userSetting/getUserSetting" class="dropdown-item">����� ����</a>
				<a href="/contentSetting/getContentSetting" class="dropdown-item">������ ����</a>
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
				<a href="/contentTasty/contentTastyList" class="dropdown-item">�����������ڽ�</a>
				<a href="/todo/getToDoMonthGraph" class="dropdown-item">�� �� �׷���</a>
            </div>
          </li>
          <!-- ���� -->
          <li class="dropdown nav-item">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">����</a>
            <div class="dropdown-menu dropdown-with-icons">
				<a href="/faq/getFAQList" class="dropdown-item">FAQ ����Ʈ</a>
				<a href="/qna/getQNAList" class="dropdown-item">QNA ����Ʈ</a>
				<a href="/widget/getWeather3.jsp" class="dropdown-item">���� </a>
				<a href="/contentShopping/getShoppingList" class="dropdown-item">����������</a>
				<a href="/contentShopping/getShoppingReviewList" class="dropdown-item">��Ʃ��</a>
            </div>
          </li>
          <!-- �α׾ƿ� -->
          <li class="dropdown nav-item">
            <a href="/user/logout" class="nav-link" >�α׾ƿ�</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</body>
</html>