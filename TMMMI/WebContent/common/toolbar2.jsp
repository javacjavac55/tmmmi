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
          <!-- 도형 -->
          <li class="dropdown nav-item">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">도형</a>
            <div class="dropdown-menu dropdown-with-icons">
				<a href="/common/color-picker.jsp" class="dropdown-item"> 컬러픽커 </a>
				<a href="/calendar/addUserCategory.jsp" class="dropdown-item">유저 카테고리</a>
				<a href="/calendar/getCalendarMonth" class="dropdown-item">월 달력</a>
				<a href="/calendar/getCalendarInterest" class="dropdown-item">관심사 달력</a>
            </div>
          </li>
          <!-- 지영 -->
          <li class="dropdown nav-item">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">지영</a>
            <div class="dropdown-menu dropdown-with-icons">
				<a href="/user/addUser" class="dropdown-item">회원가입</a>
				<a href="/user/snsAddUser" class="dropdown-item">SNS 회원가입</a>
				<a href="/user/login" class="dropdown-item">로그인</a>
				<a href="/user/getUserList" class="dropdown-item">회원 리스트</a>
				<a href="/user/searchUserId.jsp" class="dropdown-item">아이디 찾기</a>
				<a href="/user/searchUserPw.jsp" class="dropdown-item">비밀번호 찾기</a>
				<a href="/user/getUser" class="dropdown-item">내 정보 보기</a>
				<a href="/userSetting/getUserSetting" class="dropdown-item">사용자 설정</a>
				<a href="/contentSetting/contentSetting" class="dropdown-item">컨텐츠 설정</a>
            </div>
          </li>
          <!-- 중열 -->
          <li class="dropdown nav-item">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">중열</a>
            <div class="dropdown-menu dropdown-with-icons">
				<a href="/diary/addDiary.jsp" class="dropdown-item">다이어리 등록</a>
				<a href="/diary/listDiary" class="dropdown-item">다이어리 리스트</a>
				<a href="/content/sportContent.jsp" class="dropdown-item">스포츠 리스트</a>
            </div>
          </li>
          <!-- 명훈 -->
          <li class="dropdown nav-item">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">명훈</a>
            <div class="dropdown-menu dropdown-with-icons">
				<a href="/todo/getToDoList" class="dropdown-item">할 일 리스트</a>
				<a href="/content/tastyContent.jsp" class="dropdown-item">맛집컨텐츠박스</a>
				<a href="/todo/getToDoMonthGraph">할 일 그래프</a>
            </div>
          </li>
          <!-- 지슬 -->
          <li class="dropdown nav-item">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">지슬</a>
            <div class="dropdown-menu dropdown-with-icons">
				<a href="/faq/getFAQList" class="dropdown-item">FAQ 리스트</a>
				<a href="/qna/getQNAList" class="dropdown-item">QNA 리스트</a>
				<a href="/widget/getWeather3.jsp" class="dropdown-item">날씨 </a>
            </div>
          </li>
          <!-- 로그아웃 -->
          <li class="dropdown nav-item">
            <a href="/user/logout" class="nav-link" >로그아웃</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</body>
</html>