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
				<a href="/user/addUser.jsp" class="dropdown-item">회원가입</a>
				<a href="/user/login.jsp" class="dropdown-item">로그인</a>
				<a href="/user/getUserList" class="dropdown-item">회원 리스트</a>
				<a href="/user/searchUserId.jsp" class="dropdown-item">아이디 찾기</a>
				<a href="/user/getUser.jsp" class="dropdown-item">내 정보 보기</a>
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
        </ul>
      </div>
    </div>
  </nav>
</body>
</html>