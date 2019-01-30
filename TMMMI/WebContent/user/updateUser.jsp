<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
	<link rel="icon" type="image/png" href="./assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Tmmmi</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
	<!--  Fonts and icons -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
	<!-- CSS Files -->
	<link href="/css/template/material-kit.css" rel="stylesheet" />
	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link href="/css/template/demo.css" rel="stylesheet" />
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
  	<!-- styleSheet -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<!-- 버튼 이벤트 -->
	<script type="text/javascript">
		//============= "수정"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncUpdateUser();
			});
		});	
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});
		
		function fncUpdateUser() {
			
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var userName=$("input[name='userName']").val();
			var birthday=$("input[name='birthday']").val();
			var email=$("input[name=email]").val();
			var emailCheck=$("input[name=emailCheck]").val();
			
			if(pw == null || pw.length <1){
				alert("패스워드는  반드시 입력하셔야 합니다.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("패스워드 확인은  반드시 입력하셔야 합니다.");
				return;
			}
			if(userName == null || userName.length <1){
				alert("닉네임은  반드시 입력하셔야 합니다.");
				return;
			}
			if(email == null || email.length <1){
				alert("이메일은 반드시 입력하셔야 합니다.");
				return;
			}
			if(emailCheck == null || emailCheck.length <1){
				alert("이메일 인증을 완료 해야합니다.");
				return;
			}
			
			if( pw != pw_confirm ) {				
				alert("비밀번호 확인이 일치하지 않습니다.");
				$("input:text[name='password2']").focus();
				return;
			}
				
			$("form").attr("method" , "POST").attr("action", "/user/updateUser").submit();
		}
	</script>
	
	<!-- 이메일 인증 -->
	<script type="text/javascript">
		//============= "이메일 인증"  Event 연결 =============
		 $(function() {
			$( "button.btn.btn-default" ).on("click" , function() {
				fncEmailAuth();
			});
		});
	
		function fncEmailAuth(){
			var email=$("input[name=email]").val();
			$.ajax({
				url : "/userRest/emailAuth",
				method : "POST",
				data : JSON.stringify(email),
				dataType : "json",
				headers : {
	            	"Accept" : "application/json",
					"Content-Type" : "application/json"
	            },
	            success : function(JSONData, status){
	            	console.log("aaa");
	            	var result = JSONData;
	            	if(result){
	            		console.log("ok");
	            		alert("해당 이메일로 코드를 보냈습니다. 코드를 입력해 주세요!");
	            	}
	            }
			});
		}
	</script>
</head>

<body class="index-page sidebar-collapse">
<!-- sideMenu.jsp 추가 -->
<jsp:include page="/common/toolbar2.jsp"></jsp:include>
  	<div class="page-header header-filter clear-filter" data-parallax="true" style="background-image: url('/images/userSetting/ ${userSetting.image}')">
    <div class="container">
      <div class="row">
        <div class="col-md-8 ml-auto mr-auto">
          <div class="brand">
            <h2 class="title">Update User</h2>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- main start -->
  <div class="main main-raised">
    <div class="section section-basic">
      <div class="container">
      <div class="row">
		<div class="col-md-6 ml-auto mr-auto">
		<div class="profile">
	   
		<!-- form Start-->
		<form>
		<input type="hidden" name="userNo" value="${userNo }"  />
			
			<div class="description text-center">
				<div class="form-group bmd-form-group">
					<label for="userId" class="bmd-label-static">Id</label>
					<input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" placeholder="중복확인하세요"  readonly>
				</div>
			</div>
			
			<div class="description text-center">
				<div class="form-group bmd-form-group">
					<label for="password" class="bmd-label-static">Password</label>
					<input type="password" class="form-control" id="password" name="password" placeholder="변경비밀번호">
				</div>
			</div>
			  
			<div class="description text-center">
				<div class="form-group bmd-form-group">
					<label for="password2" class="bmd-label-static">Password Confirm</label>			
					<input type="password" class="form-control" id="password2" name="password2" placeholder="변경비밀번호 확인">
				</div>
			</div>
			  
			<div class="description text-center">
				<div class="form-group bmd-form-group">
					<label for="userName" class="bmd-label-static">Nickname</label>
					<input type="text" class="form-control" id="userName" name="userName" value="${user.userName}" placeholder="변경회원이름">
				</div>
			</div>
			
			<div class="description text-center">
				<div class="form-group bmd-form-group">
					<label for="userName" class="bmd-label-static">Birthday</label>
					<input type="text" class="form-control" id="birthday" name="birthday" value="${user.birthday}" placeholder="변경회원이름">
				</div>
			</div>
			  
			<div class="description text-center">
				<div class="form-group bmd-form-group">
					<label for="ssn" class="bmd-label-static">E-mail</label>
					<input type="text" class="form-control" id="email" name="email"  value="${user.email}" placeholder="변경주소">
					<button type="button" class="btn btn-default" id="authEmail">confirm</button>
				</div>
			</div>
			  
			<div class="description text-center">
				<div class="form-group bmd-form-group">
				<label for="ssn" class="bmd-label-static">E-mail confirm</label>
					<input type="text" class="form-control" id="emailCheck" name="emailCheck" placeholder="코드 입력">
				</div>
			</div>
			  
			<div class="description text-center">
				<div class="form-group bmd-form-group">
					<button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
					<a class="btn btn-danger btn" href="#" role="button">취 &nbsp;소</a>
				</div>
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