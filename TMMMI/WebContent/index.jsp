<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">

</head>

<body>
	<p>���� �ʿ��� ��ũ �ؿ� �ޱ�</p>	
	<!-- ���� -->
	<a href="/common/color-picker.jsp">�÷���Ŀ</a><br/>
	<a href="/calendar/getCalendarMonth.jsp">�� �޷�</a><br/>
	
	<!-- ���� -->
	<a href="/user/addUser.jsp">ȸ������</a><br/>
	<a href="/user/getUser?userNo=1">ȸ����������</a><br/>
	<a href="/user/login.jsp">�α���</a><br/>
	
	<!-- �߿� -->
	<a href="/common/test.jsp">������</a><br/>
	<a href="/diary/addDiary.jsp">���̾ ���</a><br/>
	<a href="/diary/getDiary?diaryNo=4">���̾ �󼼺���</a><br/>
	<a href="/diary/listDiary">���̾ ����Ʈ</a><br/>
	
	<!-- ���� -->
	<a href="/todo/listToDo.jsp">�� �� ����Ʈ</a><br/>
	
	<!-- ���� -->
	<a href="/QNA/listQNA.jsp">����ư �������ڽ�</a><br/>
	<a href="/FAQ/addFAQ.jsp">FAQ �ۼ�</a><br/>
</body>

</html>