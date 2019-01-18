<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js">

	</script>
</head>

<body>
	<p>각자 필요한 링크 밑에 달기</p>	
	<!-- 도형 -->
	<a href="/common/color-picker.jsp">컬러픽커</a><br/>
	<a href="/calendar/getCalendarMonth">월 달력</a><br/>
	
	<!-- 지영 -->
	<a href="/user/addUser.jsp">회원가입</a><br/>
	<a href="/user/login.jsp">로그인</a><br/>
	<a href="/user/getUserList">회원 리스트</a><br/>
	<a href="/user/searchUserId.jsp">아이디 찾기</a><br/>
	
	<!-- 중열 -->
	<a href="/common/test.jsp">에디터</a><br/>
	<a href="/diary/addDiary.jsp">다이어리 등록</a><br/>
	<a href="/diary/getDiary?diaryNo=1">다이어리 상세보기</a><br/>
	<a href="/diary/listDiary">다이어리 리스트</a><br/>
	<a href="/diary/updateDiary?diaryNo=1">다이어리 수정</a><br/>	
	<a href="/common/loading.jsp">로딩</a><br/>
	
	<!-- 명훈 -->
	<a href="/todo/getToDoListGET?userNo=7" >할 일 리스트</a><br/>
	
	<!-- 지슬 -->
	<!-- <a href="/QNA/contentBox.jsp">컨텐츠박스ㅎ_ㅎ나중에하시면수정해드려여</a><br/> -->
	<a href="/faq/getFAQList">FAQ 리스트</a><br/>
	<!-- <<!-- a href="/QNA/listQNA.jsp">QNA 리스트</a><br/> -->
	<a href="/qna/getQNAList">QNA 리스트(!!)</a><br/>

	
</body>

</html>