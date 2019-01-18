<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> updateQNAAnswer </title>
</head>

<body>
	<c:if test="${qna.QNAAnswerCheck == 1}">
			<div class="container">
			<div class="row" >
				<div class="col-md-1">
					<button type="button"  class="btn btn-default;">내용</button>
				</div>
				<div class="col-md-8">
					 <textarea class="form-control" rows="13" name="QNAAnswerDetail" style="resize: none"  readonly="readonly">${qna.QNAAnswerDetail}</textarea> 
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<br/>
			
			<div class="row text-center ">
				<div class="col-md-1"></div>
		  		<button type="button" class="btn btn-pink col-md-8" >답변에 대한 재문의가 필요하신 경우 다시 문의 해주세요 
		  		</button>
		  	</div>
		 	</div>
	</c:if>
</body>

</html>