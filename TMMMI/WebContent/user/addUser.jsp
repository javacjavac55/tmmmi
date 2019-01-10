<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원 가입</title>
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
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- 버튼 이벤트 -->
	<script type="text/javascript">
		//============= "가입"  Event 연결 =============
		 $(function() {
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
		
		function fncAddUser() {
			
			var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var userName=$("input[name='userName']").val();
			var birthday=$("input[name='birthday']").val();
			var email=$("input[name=email]").val();
			var emailCheck=$("input[name=emailCheck]").val();
			
			if(id == null || id.length <6){
				alert("아이디는 반드시 입력하셔야 합니다.");
				return;
			}
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
			
			$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}
		
		$(function(){
			$(document).on('click', 'button.btn.btn-primary', function(){
				fncAddUser();
			});
		})
	</script>
	
	<!-- 아이디 AJax 체크 -->
	<script type="text/javascript">
		function checkId(){
	    var inputed = $('#userId').val();
	    //console.log(inputed);
	    $.ajax({
	            url : "/userRest/checkDuplication",
	            method : "POST",
	            data : JSON.stringify(inputed),
	            dataType : "json",
	            headers : {
	            	"Accept" : "application/json",
					"Content-Type" : "application/json"
	            },
	            success : function(JSONData, status){
	            	//console.log(status);
	            	var result = JSONData;
	            	//console.log(result)
	            	
	            	if(result){
	            		console.log(result)
	            		if($('#join').length==0 && inputed.length>5){
	            			$('#help').remove()
	            			$($("#joinhelpBlock").last().after('<strong class="text-success" id="help">가입 가능한 아이디입니다.</strong>'))
	            			$($(".col-sm-4").last()).after('<div class="col-sm-offset-4  col-sm-4 text-center" id="join">'
	            					+'<button type="button" class="btn btn-primary"  >가&nbsp;입</button>'
		            				+'<a class="btn btn-danger btn" href="#" role="button">취&nbsp;&nbsp;소</a></div>')
	            		}
	            	}else{
	            		if($('#join').length>0){
	            			$('#help').remove()
	            			$($("#joinhelpBlock").last().after('<strong class="text-danger" id="help">다른아이디를 입력해주세요.</strong>'))
	            			$('#join').remove()
	            		}
	            	}
	            }
	        });
		}
	</script>
	
	<!-- 달력 -->
	<script type="text/javascript">
		$(function(){
			$("input[name='birthday']").datepicker( {dateFormat: 'yy-mm-dd'});
		});
	</script>
</head>
<body>
	<!-- sideMenu.jsp 추가 -->
	<!-- 화면구성 -->
	<div class="container">
		<h1 class="bg-primary text-center">회 원 가 입</h1>
	
		<form class="form-horizontal">
			<div class="form-group">
			  <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아 이 디</label>
			  <div class="col-sm-4">
				<input type="text" oninput="checkId()" class="form-control" id="userId" name="userId" placeholder="중복확인하세요"/>
				<span id="joinhelpBlock" class="help-block"></span>
			  </div>
			</div>
		  
			<div class="form-group">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
				<div class="col-sm-4">
				  <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
				</div>
			</div>
			  
			<div class="form-group">
				<label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
				<div class="col-sm-4">
				  <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인">
				</div>
			</div>
			
			<div class="form-group">
			    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="userName" name="userName" placeholder="닉네임">
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="birthday" class="col-sm-offset-1 col-sm-3 control-label">생년월일</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="birthday" name="birthday" placeholder="생년월일" readonly>
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="email" class="col-sm-offset-1 col-sm-3 control-label">이메일</label>
			    <div class="col-sm-4">
			      <input type="email" class="form-control" id="email" name="email" placeholder="이메일">
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="emailCheck" class="col-sm-offset-1 col-sm-3 control-label">이메일 검증</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="emailCheck" name="emailCheck" placeholder="이메일로 전송된 코드 입력">
			    </div>
			</div>
		</form>
	</div>
</body>
</html>