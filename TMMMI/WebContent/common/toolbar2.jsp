<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- style -->
<style type="text/css">
	.page-header .title, .page-header>.container { color : ${userSetting.menuFontColor};}
	.navbar .navbar-brand { color : ${userSetting.menuFontColor}; }
	.navbar.navbar-transparent{ color : ${userSetting.menuFontColor};}
	
	/* �߰��� �κ� */
	.logo{ height:160%; margin-top: -9px; }
	.nav-link{ margin-top: 10px; font-size:14px !important; }
	
</style>
</head>
<body>
  <nav class="navbar navbar-transparent navbar-color-on-scroll fixed-top navbar-expand-lg" color-on-scroll="100" id="sectionsNav">
    <div class="container">
      <div class="navbar-translate">
       <a class="navbar-brand" href="../index.jsp"><img src="/images/Logo/logoPurple.png" alt="" class="logo"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="sr-only">Toggle navigation</span>
          <span class="navbar-toggler-icon"></span>
          <span class="navbar-toggler-icon"></span>
          <span class="navbar-toggler-icon"></span>
        </button>
      </div>
      <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
          
          <li class="dropdown nav-item">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">Calendar</a>
            <div class="dropdown-menu dropdown-with-icons">
            	<a href="/calendar/getCalendarMonth" class="dropdown-item">�� �޷�</a>
				<a href="/calendar/getCalendarInterest" class="dropdown-item">���ɻ� �޷�</a>
				<a href="/calendar/getUserCategoryList" class="dropdown-item">ī�װ�</a>
            </div>
          </li>
          
          <li class="dropdown nav-item">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">Diary</a>
            <div class="dropdown-menu dropdown-with-icons">
				<a href="/diary/addDiary" class="dropdown-item">���̾ ���</a>
				<a href="/diary/listDiary" class="dropdown-item">���̾ ����Ʈ</a>
            </div>
          </li>
          
          <li class="dropdown nav-item">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">To do</a>
            <div class="dropdown-menu dropdown-with-icons">
				<a href="/todo/getToDoList" class="dropdown-item">�� �� ����Ʈ</a>
				<a href="/todo/getToDoMonthGraph" class="dropdown-item">�� �� �׷���</a>
				<a href="/todo/getToDoWordCloud" class="dropdown-item">�� �� ����Ŭ����</a>
            </div>
          </li>
          
          <li class="dropdown nav-item">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">FAQ/QNA</a>
            <div class="dropdown-menu dropdown-with-icons">
				<a href="/faq/getFAQList" class="dropdown-item">FAQ ����Ʈ</a>
				<a href="/qna/getQNAList" class="dropdown-item">QNA ����Ʈ</a>
            </div>
          </li>
          
          <li class="dropdown nav-item">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">Setting</a>
            <div class="dropdown-menu dropdown-with-icons">
				<a href="/userSetting/getUserSetting" class="dropdown-item">����� ����</a>
				<a href="/contentSetting/getContentSetting" class="dropdown-item">������ ����</a>
            </div>
          </li>
          
          <li class="dropdown nav-item">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">My page</a>
            <div class="dropdown-menu dropdown-with-icons">
            	<a href="/user/getUser" class="dropdown-item">�� ���� ����</a>
            	<c:if test="${userNo eq 101 }"><a href="/user/getUserList" class="dropdown-item">ȸ�� ����Ʈ</a></c:if>
            </div>
          </li>
          
          <!-- �α׾ƿ� -->
          <li class="dropdown nav-item">
            <a href="/user/logout" class="nav-link" >Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</body>
</html>