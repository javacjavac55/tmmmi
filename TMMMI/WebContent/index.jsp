<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<body>
	<c:if test="${! empty userNo }"><c:import url="/common/loginIndex.jsp"></c:import></c:if>
	<c:if test="${ empty userNo }"><c:import url="/user/login.jsp"></c:import></c:if>
</body>

</html>