<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <title>Tmmmi</title>
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
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
  <!-- Style -->
  <style type="text/css">
  	#yeong{
  		width : 100%;
  		text-align : center;
  	}
  	.card.bg-primary, .card .card-header-primary, .card.card-rotate.bg-primary .back, .card.card-rotate.bg-primary .front {
    	background: linear-gradient(60deg, #e09e9e, #f56a6a);
	}
	.btn.btn-primary.btn-link, .btn.btn-primary.btn-link:active, .btn.btn-primary.btn-link:focus, .btn.btn-primary.btn-link:hover {
   		background-color: transparent;
    	color: #e91e63;
	}
  </style>
   <!-- 로그인  -->
	<script type="text/javascript">
		$(function() {
			$( "#login" ).on("click" , function() {
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
		
	</script>
</head>

<body class="login-page sidebar-collapse">
  <div class="page-header header-filter" style="background-image: url('/images/template/bg2.jpg'); background-size: cover; background-position: top center;">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 col-md-6 ml-auto mr-auto">
          <div class="card card-login">
            <form class="form" method="" action="">
              <div class="card-header card-header-primary text-center">
                <h4 class="card-title">Login</h4>
              </div>
              <div id="yeong" style="margin: 50px 0 50px 0;">
              		<span class="description text-center">아이디/</span>
              		<span class="description text-center">비밀번호</span>
              		<span class="description text-center">찾기</span>
              	</div>
              <div class="card-body">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="material-icons">face</i>
                    </span>
                  </div>
                  <input type="text" class="form-control"  name="userId" id="userId" placeholder="Id">
                </div>
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="material-icons">lock_outline</i>
                    </span>
                  </div>
                  <input type="password" class="form-control" name="password" id="password" placeholder="Password" onKeyPress="if(event.keyCode=='13'){fncLogin() }">
                </div>
              </div>
              <div class="footer text-center">
                <a href="/user/addUser" class="btn btn-primary btn-link btn-wd btn-lg">Sign in</a>
              	<span class="btn btn-primary btn-link btn-wd btn-lg" id="login">Login</span>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

</html>