<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>내 정보 보기</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link href="/css/template/material-kit.css" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/css/template/demo.css" rel="stylesheet" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 유저 리스트 -->
<script type="text/javascript">
	function fncGetList(currentPage){
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/user/getUserList").submit();
	}
</script>
</head>
<body class="index-page sidebar-collapse">
	<jsp:include page="/common/toolbar2.jsp"></jsp:include>
	<div class="page-header header-filter clear-filter" data-parallax="true" style="background-image: url('/images/userSetting/ ${userSetting.image}')">
		<div class="container">
			<div class="row">
				<div class="col-md-8 ml-auto mr-auto">
					<div class="brand">
						<h2 class="title">My Page</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="main main-raised">
		<div class="section section-basic">
			<div class="container">
				<div align="center">
					<div id="wrapper">
						<div id="main">
				
							<!-- table 위쪽 검색 시작-->
							<div class="row">
								<div class="col-md- text-left">
									<p class="text-primary">
										전체  ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage}  페이지
									</p>
									<input type="hidden" id="currentPage" name="currentPage" value=""/>
								</div>		    
							</div>
							
							<!-- table 시작 -->
							<table class="table table-hover table-striped" >   
								<thead>
									<tr>
										<th align="center">No</th>
										<th align="center" >회원 번호</th>
										<th align="center">회원 아이디</th>            
										<th align="center">SNS</th>
										<th align="center">탈퇴</th>
										<th aling="center">탈퇴날짜</th>
										<th align="center">수정</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="i" value="0" />
									<c:forEach var="user" items="${list}">
									<c:set var="i" value="${ i+1 }" />
										<tr>
											<td align="center">${ i }</td>
											<td align="center">${user.userNo}</td>
											<td align="center">${user.userId}</td>
											<!-- snsName -->
											<td align="center">
												<c:choose>
													<c:when test="${user.snsName eq 1}">카카오</c:when>
													<c:when test="${user.snsName eq 2}">네이버</c:when>
													<c:when test="${user.snsName eq 3}">구글</c:when>
													<c:otherwise>X</c:otherwise>
												</c:choose>
											</td>
											<!-- 탈퇴 여부 -->
											<td align="center">
												<c:choose>
													<c:when test="${user.withdrawCheck eq 1 }">탈퇴</c:when>
													<c:otherwise>X</c:otherwise>
												</c:choose>
											</td>
											<td align="center">${user.withdrawDate}</td>
											<td align="center">수정</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						<!-- PageNavigation 시작 -->
						<jsp:include page="/common/pageNavigator.jsp"/>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>