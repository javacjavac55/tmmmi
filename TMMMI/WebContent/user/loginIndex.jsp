<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${ !empty userNo }">
 		<a href="/user/getUser?userNo=${userNo }">회원정보보기</a><br/>
 		<a href="/user/updateUser?userNo=${userNo }">유저업데이트</a><br/>
		<a href="/user/getUserList.jsp">회원 리스트</a><br/>
 	</c:if>
</body>
</html>