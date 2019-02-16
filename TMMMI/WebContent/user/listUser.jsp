<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>ȸ�� ����Ʈ</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/css/template/demo.css" rel="stylesheet" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- sweetalert -->
<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script >
<!-- ���� ����Ʈ -->
<script type="text/javascript">
	function fncGetList(currentPage){
		$("#currentPage").val(currentPage)
		console.log(currentPage);
		$("form").attr("method" , "POST").attr("action" , "/user/getUserList").submit();
	}
</script>

<!-- ��ư �̺�Ʈ -->
<script type="text/javascript">
	$(function() {
		$(document).on('click', 'button.btn.btn-primary', function() {
			var userNo = $(this).data('param');
			self.location = "/user/updateUserAdmin/"+userNo;
		});
		
		$(document).on('click', 'button.btn.btn-info', function(){
			var userNo = $(this).data('withdraw');
			fncWithdraw(userNo);
		});
		
		$(document).on('click', 'button.btn.btn-warning', function(){
			var userNo = $(this).data('withdrawcancle');
			fncWithdrawCancle(userNo);
		});
	})
</script>

<!-- Ajax -->
<script type="text/javascript">
	function fncWithdraw(data){
		var userNo = data;
		$.ajax({
			url : "/userRest/withdrawAdmin",
			method : "POST",
			data : JSON.stringify(userNo),
			dataType : "json",
			headers : {
            	"Accept" : "application/json",
				"Content-Type" : "application/json"
            },
            success : function(JSONData, status){
            	var result = JSONData;
            	if(result == 0){
            		swal({
	    				title : "Ż�� ����",
	    				icon : "warning",
	    				buttons: true,
	    			})
            	}else{
            		swal({
	    				title : "Ż�� �Ϸ�",
	    				icon : "success",
	    				buttons: true,
	    			}).then((value)=>{
	    				$('#withdraw'+result).remove()
				    	$($('#helf'+result).last().after('<button type="button" class="btn btn-warning btn-round" data-withdrawCancle="'+result+'" id="withdrawCancle'+result+'">����</button>'))
					})
            	}
            }
		})
	}
	
	function fncWithdrawCancle(data){
		var userNo = data;
		$.ajax({
			url : "/userRest/withdrawCancle",
			method : "POST",
			data : JSON.stringify(userNo),
			dataType : "json",
			headers : {
            	"Accept" : "application/json",
				"Content-Type" : "application/json"
            },
            success : function(JSONData, status){
            	var result = JSONData;
            	if(result == 0){
	            	swal({
	    				title : "���� ����",
	    				icon : "warning",
	    				buttons: true,
	    			})
            	}else{
            		swal({
	    				title : "���� �Ϸ�",
	    				icon : "success",
	    				buttons: true,
	    			}).then((value)=>{
	    				$('#withdrawCancle'+result).remove()
				    	$($('#helf'+result).last().after('<button type="button" class="btn btn-info btn-round" data-withdraw="'+result+'" id="withdraw'+result+'">Ż��</button>'))
					})
            	}
            }
		})
	}
</script>
</head>
<body class="index-page sidebar-collapse">
<form>
	<jsp:include page="/common/toolbar2.jsp"></jsp:include>
	<div class="page-header header-filter clear-filter" data-parallax="true" style="background-image: url('/images/userSetting/ ${userSetting.image}')">
		<div class="container">
			<div class="row">
				<div class="col-md-8 ml-auto mr-auto">
					<div class="brand">
						<h2 class="title">User List</h2>
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
				
							<!-- table ���� �˻� ����-->
							<div class="row">
								<div class="col-md-6 text-left">
									<p class="text-primary">
										��ü  ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage}  ������
									</p>
									<input type="hidden" id="currentPage" name="currentPage" value=""/>
								</div>
							</div>
							<nav class="navbar navbar-default navbar-expand-lg" style="float:right;">
								<div class="container">
									<form name="detailForm" class="form-inline ml-auto">
										<div class="form-group bmd-form-group" style="align-content: right;">
											<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="����+����" value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
											<input type="hidden" id="currentPage" name="currentPage"  value="" />
										</div>
										<button type="button" class="btn btn-white btn-raised btn-fab btn-round" id="search">
											<i class="material-icons">search</i>
										</button>
									 </form>
								</div>
							</nav>
							<!-- table ���� -->
							<table class="table table-hover" >   
								<thead style="box-shadow:1px 1px 1px 1px gray;">
									<tr>
										<th style="text-align: -webkit-center;">No</th>
										<th style="text-align: -webkit-center;">ȸ�� ��ȣ</th>
										<th style="text-align: -webkit-center;">ȸ�� ���̵�</th>            
										<th style="text-align: -webkit-center;">SNS</th>
										<th style="text-align: -webkit-center;">Ż��</th>
										<th style="text-align: -webkit-center;">Ż��¥</th>
										<th style="text-align: -webkit-center;">����</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="i" value="0" />
									<c:forEach var="user" items="${list}">
									<c:set var="i" value="${ i+1 }" />
										<tr>
											<td align="center" style="padding:25px;">${ i }</td>
											<td align="center" style="padding:25px;">${user.userNo}</td>
											<td align="center" style="padding:25px;">${user.userId}</td>
											<!-- snsName -->
											<td align="center" style="padding:25px;">
												<c:choose>
													<c:when test="${user.snsName eq 1}">īī��</c:when>
													<c:when test="${user.snsName eq 2}">���̹�</c:when>
													<c:when test="${user.snsName eq 3}">����</c:when>
													<c:otherwise>X</c:otherwise>
												</c:choose>
											</td>
											<td align="center" style="padding:25px;">${user.withdrawDate}</td>
											<!-- Ż�� ���� -->
											<td align="center">
												<span id="helf${user.userNo }"></span>
												<c:choose>
													<c:when test="${user.withdrawCheck eq 1 }">
														<button type="button" class="btn btn-warning btn-round" id="withdrawCancle${user.userNo }" data-withdrawcancle="${user.userNo }">����</button>
													</c:when> 
													<c:otherwise>
														<button type="button" class="btn btn-info btn-round" id="withdraw${user.userNo }" data-withdraw="${user.userNo }">Ż��</button>
													</c:otherwise>
												</c:choose>
											</td>
											<td align="center"><button type="button" class="btn btn-primary btn-round" id="update${user.userNo }" data-param="${user.userNo }">����</button></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						<!-- PageNavigation ���� -->
						<jsp:include page="/common/pageNavigator.jsp"/>
						<br><br><br>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>