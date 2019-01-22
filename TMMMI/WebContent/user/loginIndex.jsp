<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${ !empty userNo }">
		<a href="../index.jsp">인덱스로 갑시당!</a><br/>
 		<a href="/user/getUser">회원정보보기</a><br/>
 		<a href="/user/updateUser">유저업데이트</a><br/>
		<a href="/user/getUserList">회원 리스트</a><br/>
		<a href="/user/logout">로그아웃</a><br/>
		<a href="/userSetting/getUserSetting">사용자 설정</a><br/>
		<a href="/contentSetting/getContentSetting">컨텐츠 설정</a><br/>
		<a href="/content/userKeywordContent.jsp">유저 컨텐츠 키워드</a><br/>
		<a href="/content/sportContent">스포츠 컨텐츠</a>
 	</c:if>
 	<c:if test="${ empty userNo }">
 		다시 로그인을 시도하세요.<br/>
 		<a href="/user/login">로그인 페이지로 이동</a>
 	</c:if>
</body>
</html>