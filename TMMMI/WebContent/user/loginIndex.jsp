<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
	<c:if test="${ !empty userNo }">
		<jsp:include page="/common/toolbar.jsp"  />
		
		<p>���� �ʿ��� ��ũ �ؿ� �ޱ�</p>	
		<!-- ���� -->
		<a href="/common/color-picker.jsp">�÷���Ŀ</a><br/>
		<a href="/calendar/addUserCategory.jsp">���� ī�װ�</a><br/>
		<a href="/calendar/getCalendarMonth">�� �޷�</a><br/>
		<a href="/calendar/getCalendarInterest">���ɻ� �޷�</a><br/>
		
		<!-- ���� -->
		<a href="/user/addUser.jsp">ȸ������</a><br/>
		<a href="/user/login.jsp">�α���</a><br/>
		<a href="/user/getUserList">ȸ�� ����Ʈ</a><br/>
		<a href="/user/searchUserId.jsp">���̵� ã��</a><br/>
		<a href="/contentSetting/getContentSetting">������ ����</a><br/>
		
		<!-- �߿� -->
		<a href="/diary/addDiary.jsp">���̾ ���</a><br/>
		<a href="/diary/listDiary">���̾ ����Ʈ</a><br/>
		<a href="/content/sportContent.jsp">������ ������ ����Ʈ</a>
		<br/>
		
		<!-- ���� -->
		
		<a href="/todo/getToDoList">�� �� ����Ʈ</a><br/>
		<a href="/content/tastyContent.jsp">�����������ڽ�</a><br/>
	<a href="/todo/getToDoMonthGraph">�� �� �׷���</a><br/>
		<!-- ���� -->
		<a href="/faq/getFAQList">FAQ ����Ʈ</a><br/>
		<a href="/qna/getQNAList">QNA ����Ʈ</a><br/>
		<a href="/widget/getWeather3.jsp">���� </a><br/>
	
 	</c:if>
 	<c:if test="${ empty userNo }">
 		�ٽ� �α����� �õ��ϼ���.<br/>
 		<a href="/user/login">�α��� �������� �̵�</a>
 	</c:if>
</body>
</html>