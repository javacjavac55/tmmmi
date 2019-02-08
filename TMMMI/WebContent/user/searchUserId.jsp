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
	
	<!-- 버튼 이벤트 -->
	<script type="text/javascript">
		$(function(){
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncSearchUserId();
			});
		})
	</script>
	
	<script type="text/javascript">
		function fncSearchUserId(){
			
			var inUserName=$("input[name='userName']").val();
			var inEmail=$("input[name=email]").val();
			
			if(inUserName == null || inUserName.length <1){
				alert("닉네임은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if(inEmail == null || inEmail.length <1){
				alert("이메일은 반드시 입력하셔야 합니다.");
				return;
			}
			
		    $.ajax({
	            url : "/SNSLogin/searchUserId",
	            method : "POST",
	            data : JSON.stringify(
	            	{
	            		'userName' : inUserName,
	            		'email' : inEmail
	            	}					
	            ),
	            dataType : 'text',
	            headers : {
	            	'Accept' : 'application/json',
					'Content-Type' : 'application/json'
	            },
	            success : function(Data){
	            	var result = Data;
            		alert('아이디는'+result+'*** 입니다.');
            		window.location = '/user/login.jsp';
	            },
	            error : function(request, status, error ) {  

	            	console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);

	            }
			});
		}
	</script>

</head>

<body class="index-page sidebar-collapse">
	<jsp:include page="/common/toolbar2.jsp"></jsp:include>
	<div class="page-header header-filter clear-filter" data-parallax="true" style="background-image: url('/images/userSetting/moon-1527501_960_720.jpg')">
		<div class="container">
			<div class="row">
				<div class="col-md-8 ml-auto mr-auto">
					<div class="brand">
						<h2 class="title">Search UserId</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="main main-raised">
		<div class="section section-basic">
			<div class="container">
				<div class="row">
					<div class="col-md-6 ml-auto mr-auto">
						<div class="profile">
							<form class="form-horizontal">
								<div class="description text-center">
									<div class="form-group bmd-form-group">
								 		<label for="userId" class="bmd-label-static">Nickname</label>
										<input type="text" class="form-control" id="userName" name="userName" placeholder="닉네임을 입력하세요."/>
								  	</div>
								</div>
							  
								<div class="description text-center">
									<div class="form-group bmd-form-group">
										<label for="password" class="bmd-label-static">E-mail</label>
									 	<input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요.">
									</div>
								</div>
								
								<div align="center">
									<button type="button" class="btn btn-primary" >아이디 찾기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>