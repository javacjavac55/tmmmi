<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> listFAQ </title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<script type="text/javascript">
	$(document).ready(function () { // 페이지 document 로딩 완료 후 스크립트 실행 $("#viewhidden").click(function () { status = $("#hidden").css("display"); if (status == "none") { $("#hidden").css("display", ""); } else { $("#hidden").css("display", "none"); } }); });

</script>

<style>
		body{
  padding:10px;
}
</style>

</head>

<body>
<form name="listFAQ">
<table> <tr> <th scope="row">tr 메뉴 숨김 처리</th> <td><a href="#" id="viewhidden" onclick="return false;" class="button">클릭</a></td> </tr> <tr id="hidden" style="display:none;"> <th>숨김메뉴</th> <td><input type="text"/></td> </tr> <tr> <th>하단</th> <td>하단</td> </tr> </table>

</form>
</body>

</html>