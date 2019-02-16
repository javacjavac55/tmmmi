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
	.page-header .title, .page-header>.container { color : ${userSetting.menuFontColor}!important;}
	.navbar .navbar-brand { color : ${userSetting.menuFontColor} !important; }
	.navbar.navbar-transparent{ color : ${userSetting.menuFontColor}!important;}
	
	/* 추가한 부분 */
	.logo{ height:160%; margin-top: -9px; }
	.nav-link{ margin-top: 10px; font-size:15px !important;}
	ul li {	padding-left: 0em !important; margin-bottom: -1%;} /* 패딩은 FAQ,QNAQ때문에 꼭 넣어야함 */ 
	 
	
</style>
</head>
<body>
  <nav class="navbar navbar-transparent navbar-color-on-scroll fixed-top navbar-expand-lg" color-on-scroll="100" id="sectionsNav"">
    <div class="container">
      <div class="navbar-translate">
     	 <a class="navbar-brand" href="../index.jsp" style="font-size: 25px; font-weight: bold;">
       		TMMMI
       		<!-- 로고 이미지 -->
       	<!-- <img src="/images/Logo/logoReset2.png" alt="" class="logo"> --> 	
       </a>
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
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown" >Calendar</a>
            <div class="dropdown-menu dropdown-with-icons">
            	<a href="/calendar/getCalendarMonth" class="dropdown-item">월 달력</a>
				<a href="/calendar/getCalendarInterest" class="dropdown-item">관심사 달력</a>
				<a href="/calendar/getUserCategoryList" class="dropdown-item">카테고리</a>
            </div>
          </li>
          
          <li class="dropdown nav-item">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">Diary</a>
            <div class="dropdown-menu dropdown-with-icons">
				<a href="/diary/addDiary" class="dropdown-item">다이어리 등록</a>
				<a href="/diary/listDiary" class="dropdown-item">다이어리 리스트</a>
            </div>
          </li>
          
          <li class="dropdown nav-item">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">Scrap</a>
            <div class="dropdown-menu dropdown-with-icons">
				<a href="/scrap/getScrapList" class="dropdown-item">스크랩 리스트</a>
            </div>
          </li>
          
          <li class="dropdown nav-item">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">To do</a>
            <div class="dropdown-menu dropdown-with-icons">
				<a href="/todo/getToDoList" class="dropdown-item">할 일 리스트</a>
				<a href="/todo/getToDoMonthGraph" class="dropdown-item">할 일 그래프</a>
            </div>
          </li>
          
          <li class="dropdown nav-item">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">FAQ/QNA</a>
            <div class="dropdown-menu dropdown-with-icons">
				<a href="/faq/getFAQList" class="dropdown-item">FAQ 리스트</a>
				<a href="/qna/getQNAList" class="dropdown-item">QNA 리스트</a>
            </div>
          </li>
          
          <li class="dropdown nav-item">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">Content</a>
            <div class="dropdown-menu dropdown-with-icons">
				<a href="/content/getContentList" class="dropdown-item">컨텐츠</a>
            </div>
          </li>
          
          <li class="dropdown nav-item">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">My page</a>
            <div class="dropdown-menu dropdown-with-icons">
            	<a href="/user/getUser" class="dropdown-item">내 정보 보기</a>
            	<a href="/userSetting/getUserSetting" class="dropdown-item">사용자 설정</a>
            	<c:if test="${userNo eq 101 }"><a href="/user/getUserList" class="dropdown-item">회원 리스트</a></c:if>
            </div>
          </li>
          
          <!-- 로그아웃 -->
          <li class="dropdown nav-item">
            <a href="/user/logout" class="nav-link" >Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</body>
</html>