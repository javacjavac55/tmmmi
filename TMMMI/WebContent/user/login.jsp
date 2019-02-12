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
  <!-- sweetalert -->
  <script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script >
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
			
			$.ajax({
				url : "/userRest/login",
				method : "POST",
				data : JSON.stringify(
					{
						'userId' : id,
						'password' : pw
					}		
				),
				dataType : 'text',
				headers : {
	            	"Accept" : "application/json",
					"Content-Type" : "application/json"
	            },
	            success : function(JSONData, status){

	            	var result = JSONData;
	            	console.log(result);
	            	
	            	if(result == -1){
	            		swal({
		    				title : "탈퇴 회원" , 
		    				text: "탈퇴한 회원 입니다." , 
		    				icon : "warning" , 
		    			});
	            	}else if(result == 0){
	            		swal({
		    				title : "관리자 모드" , 
		    				text: "회원 관리를 할 수 있습니다." , 
		    				icon : "success" , 
		    			}).then((value)=>{
		    				window.location = '../index.jsp';
		    			})
	            	}else if(result == 1){
	            		swal({
		    				title : "회원 확인" , 
		    				text: "로그인 되셨습니다." , 
		    				icon : "success" , 
		    			}).then((value)=>{
		    				window.location = '../index.jsp';
		    			})
	            	}else{
	            		swal({
		    				title : "다시 입력" , 
		    				text: "아이디나 비밀번호가 틀렸습니다." , 
		    				icon : "success" , 
		    			})
	            	}
	            }
			});
		};
	</script>
	
	<!-- 버튼 이벤트 -->
	<script type="text/javascript">
		$( function() {
			$("span:contains('아이디')").on("click" , function() {
				self.location = "/userRest/searchUserId"
			});
			
			$("span:contains('비밀번호')").on("click" , function() {
				self.location = "/userRest/searchUserPw"
			});
		});
	</script>

	
	<!-- 팝업창 -->
	<script language="JavaScript">
	function openNewWindow(window) { 
		open (window,"Mail","toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, width=550, height=500"); 
	}
	</script>
</head>

<body class="login-page sidebar-collapse">
  <div class="page-header header-filter" style="background-image: url('/images/template/bg2.jpg'); background-size: cover; background-position: top center;">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 col-md-6 ml-auto mr-auto">
          <div class="card card-login">
            <form class="form">
              <div class="card-header card-header-primary text-center">
                <h4 class="card-title">Login</h4>
              </div>
              <div style="text-align : center;">
             	<a href="javascript:openNewWindow('/SNSLogin/kakaoLoginRequest')" id="kakaoLogin"><img src="/images/loginImage/kakaolink_btn_small_ov.png"  width="45px" id="kakaoLogin" /></a>
              	<a href="javascript:openNewWindow('/SNSLogin/googleLoginRequest')" id="googleLogin"><img src="/images/loginImage/googleg_standard_color_128dp.png"  width="40px" id="googleLogin" style="margin : 0 20px 0 20px"/></a>
              	<a href="javascript:openNewWindow('/SNSLogin/naverLoginRequest')" id="naverLogin"><img src="/images/loginImage/naverLogin.PNG"  width="50px" id="naverLogin" /></a><br/>
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
                  <input type="password" class="form-control" name="password" id="password" placeholder="Password" onKeyPress="if(event.keyCode=='13'){fncLogin()}">
                </div>
              </div>
              <div id="yeong" style="margin: 50px 0 50px 0;">
              		<span class="description text-center">아이디/</span>
              		<span class="description text-center">비밀번호</span>
              		<span class="description text-center">찾기</span>
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