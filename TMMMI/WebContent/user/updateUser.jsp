<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>회원 정보 수정</title>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
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
<body>
	<!-- sideMenu.jsp 추가 -->
	<!-- 화면구성 -->
	<div class="container">
		<div class="page-header text-center">
		<h3 class=" text-info">회원정보수정</h3>
		<h5 class="text-muted">내 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
		</div>
	   
		<!-- form Start-->
		<form class="form-horizontal">
		<input type="hidden" name="userNo" value="${userNo }"  />
			<div class="form-group">
				<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아 이 디</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" placeholder="중복확인하세요"  readonly>
					<span id="helpBlock" class="help-block">
					<strong class="text-danger">아이디는 수정불가</strong>
				</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="password" name="password" placeholder="변경비밀번호">
				</div>
			</div>
			  
			<div class="form-group">
				<label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="password2" name="password2" placeholder="변경비밀번호 확인">
				</div>
			</div>
			  
			<div class="form-group">
				<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">닉네임</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="userName" name="userName" value="${user.userName}" placeholder="변경회원이름">
				</div>
			</div>
			
			<div class="form-group">
				<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">생년월일</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="birthday" name="birthday" value="${user.birthday}" placeholder="변경회원이름">
				</div>
			</div>
			  
			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">이메일</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="email" name="email"  value="${user.email}" placeholder="변경주소">
				</div>
				<button type="button" class="btn btn-default" id="authEmail">인증하기</button>
			</div>
			  
			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">이메일 검증</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="emailCheck" name="emailCheck" placeholder="변경이메일">
				</div>
			</div>
			  
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
					<a class="btn btn-danger btn" href="#" role="button">취 &nbsp;소</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>