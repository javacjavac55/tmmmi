<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>로그인</title>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- template -->
	<link rel="stylesheet" href="/css/template/main.css">
    
    <!-- font and icons-->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  
	<!-- style -->
<!--     <style>
  		body, h2, h4{
  			font-family: "Nanum Gothic", sans-serif;
  		}
  	</style> -->
  	
    <!-- 로그인  -->
	<script type="text/javascript">
		$(function() {
			$( "button.button.primary" ).on("click" , function() {
				fncLogin();
			});
		});	
		
		function fncLogin() {
			
			var id=$("input:text").val();
			var pw=$("input:password").val();
			
			if(id == null || id.length <1) {
				alert('ID 를 입력하지 않으셨습니다.');
				$("#userId").focus();
				return;
			}
			
			if(pw == null || pw.length <1) {
				alert('패스워드를 입력하지 않으셨습니다.');
				$("#password").focus();
				return;
			}
			
			$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
		};
		
		//============= 회원원가입화면이동 =============
		$( function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
	</script>		
	
</head>

<body>
	<!-- sideMenu.jsp 추가 -->
	<!-- 화면구성 -->
	<div class="container">
		<div class="row" style="padding-top: 15%;">
			<div style="margin: auto;">
			<br/><br/>
				<div align="center">	 	 	
				<h1 class="text-center">Login</h1>
					<form class="form-horizontal">
					<div class="form-group" align="center">
						<div class="col-sm-12">
							<input type="text" class="form-control" name="userId" id="userId"  placeholder="아이디" >
						</div>
					</div>  
					<div class="form-group" >
						<div class="col-sm-12">
							<input type="password" class="form-control" name="password" id="password" placeholder="패스워드" onKeyPress="if(event.keyCode=='13'){fncLogin() }" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12 text-center">
							<button type="button" class="button primary" >&nbsp;&nbsp;Login&nbsp;&nbsp;</button>
							<a class="button" href="#" role="button">&nbsp;Sign in&nbsp;</a>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>

</html>