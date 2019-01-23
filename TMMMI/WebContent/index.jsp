<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>

</head>

<body>
	
	<jsp:include page="/common/toolbar.jsp"  />
	
	<p>각자 필요한 링크 밑에 달기</p>	
	<!-- 도형 -->
	<a href="/common/color-picker.jsp">컬러픽커</a><br/>
	<a href="/calendar/addUserCategory.jsp">유저 카테고리</a><br/>
	<a href="/calendar/getCalendarMonth">월 달력</a><br/>
	<a href="/calendar/getCalendarInterest">관심사 달력</a><br/>
	
	<!-- 지영 -->
	<a href="/user/addUser.jsp">회원가입</a><br/>
	<a href="/user/login.jsp">로그인</a><br/>
	<a href="/user/getUserList">회원 리스트</a><br/>
	<a href="/user/searchUserId.jsp">아이디 찾기</a><br/>
	
	<!-- 중열 -->
	<a href="/diary/addDiary.jsp">다이어리 등록</a><br/>
	<a href="/diary/listDiary">다이어리 리스트</a><br/>
	<a href="/content/getContentKsoccerList">국내축구 리스트</a><br/>
	<a href="/content/getContentWsoccerList">해외축구 리스트</a><br/>
	<a href="/content/getContentKbaseballList">국내야구 리스트</a><br/>
	<a href="/content/getContentWbaseballList">해외야구 리스트</a><br/>
	<a href="/content/getContentBasketballList">농구 리스트</a><br/>
	<a href="/content/getContentGeneralList">일반 리스트</a><br/>
	<br/>
	
	<!-- 명훈 -->
	
	<a href="/todo/getToDoList">할 일 리스트</a><br/>
	<a href="/content/tastyContent.jsp">맛집컨텐츠박스</a><br/>
	
	<!-- 지슬 -->
	<a href="/faq/getFAQList">FAQ 리스트</a><br/>
	<a href="/qna/getQNAList">QNA 리스트</a><br/>
	<a href="/widget/getWeather3.jsp">날씨 </a><br/>


</body>

</html>