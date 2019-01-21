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
	<p>���� �ʿ��� ��ũ �ؿ� �ޱ�</p>	
	<!-- ���� -->
	<a href="/common/color-picker.jsp">�÷���Ŀ</a><br/>
	<a href="/calendar/getCalendarMonth">�� �޷�</a><br/>
	
	<!-- ���� -->
	<a href="/user/addUser.jsp">ȸ������</a><br/>
	<a href="/user/login.jsp">�α���</a><br/>
	<a href="/user/getUserList">ȸ�� ����Ʈ</a><br/>
	<a href="/user/searchUserId.jsp">���̵� ã��</a><br/>
	
	<!-- �߿� -->
	<a href="/common/test.jsp">������</a><br/>
	<a href="/diary/addDiary.jsp">���̾ ���</a><br/>
	<a href="/diary/getDiary?diaryNo=24">���̾ �󼼺���</a><br/>
	<a href="/diary/listDiary">���̾ ����Ʈ</a><br/>
	<a href="/diary/updateDiary?diaryNo=1">���̾ ����</a><br/>	
	<a href="/common/loading.jsp">�ε�</a><br/>
	
	<!-- ���� -->
	
	<a href="/todo/getToDoList">�� �� ����Ʈ</a><br/>
	<a href="/content/tastyContent.jsp">�����������ڽ�</a><br/>
	
	
	<!-- ���� -->
	<!-- <a href="/QNA/contentBox.jsp">�������ڽ���_�����߿��Ͻø�����ص����</a><br/> -->
	<a href="/faq/getFAQList">FAQ ����Ʈ</a><br/>
	<a href="/qna/getQNAList">QNA ����Ʈ</a><br/>


</body>

</html>