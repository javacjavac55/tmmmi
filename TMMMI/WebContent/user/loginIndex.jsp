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
		<a href="../index.jsp">�ε����� ���ô�!</a><br/>
 		<a href="/user/getUser">ȸ����������</a><br/>
 		<a href="/user/updateUser">����������Ʈ</a><br/>
		<a href="/user/getUserList">ȸ�� ����Ʈ</a><br/>
		<a href="/user/logout">�α׾ƿ�</a><br/>
		<a href="/userSetting/getUserSetting">����� ����</a><br/>
		<a href="/contentSetting/getContentSetting">������ ����</a><br/>
		<a href="/content/userKeywordContent.jsp">���� ������ Ű����</a><br/>
		<a href="/content/sportContent">������ ������</a>
 	</c:if>
 	<c:if test="${ empty userNo }">
 		�ٽ� �α����� �õ��ϼ���.<br/>
 		<a href="/user/login">�α��� �������� �̵�</a>
 	</c:if>
</body>
</html>