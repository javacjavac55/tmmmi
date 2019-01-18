<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원 가입</title>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- bootstrap -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<!-- styleSheet -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- 버튼 이벤트 -->
	<script type="text/javascript">
		//============= "가입"  Event 연결 ================
		$(function(){
			$(document).on('click', 'button.btn.btn-primary', function(){
				fncAddUser();
			});
		})
		//============= "취소"  Event 연결 =================
		$(function() {
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});
		
		//============="이메일 인증" Event 연결 ==============
		$(function() {
			$( "button.btn.btn-default" ).on("click" , function() {
				fncEmailAuth();
			});
		});
	</script>
	
	<!-- 회원 입력 정보 값 체크 -->
	<script type="text/javascript">
		
		function fncAddUser() {

			var userName=$("input[name='userName']").val();
			var birthday=$("input[name='birthday']").val();
			var email=$("input[name=email]").val();
			var authNum=$("input[name=authNum]").val();

			if(userName == null || userName.length <1){
				alert("닉네임은  반드시 입력하셔야 합니다.");
				return;
			}
			if(email == null || (email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1))){
				alert("이메일은 반드시 입력하셔야 합니다.");
				return;
			}
			if(authNum == null || authNum.length <5){
				alert("인증번호는 반드시 입력하셔야 합니다.");
				return;
			}
			
			$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}
	</script>
	
	<!-- 이메일 인증 -->
	<script type="text/javascript">
		function fncEmailAuth(){
			var inEmail=$("input[name=email]").val();
			$.ajax({
				url : "/userRest/emailAuth",
				method : "POST",
				data : JSON.stringify(inEmail),
				dataType : "json",
				headers : {
	            	"Accept" : "application/json",
					"Content-Type" : "application/json"
	            },
	            success : function(JSONData, status){
	            	var result = JSONData;
	            	if(result){alert("해당 이메일로 코드를 보냈습니다. 코드를 입력해 주세요!");}
	            }
			});
		}
	</script>
	
	<!-- 이메일 인증번호 체크 -->
	<script type="text/javascript">
		function emailCheckDuplication(){
			var inAuthNum =$("input[name=authNum]").val();
			console.log(inAuthNum)
			$.ajax({
				url : "/userRest/authNumCheckDuplication",
				method : "POST",
				data : JSON.stringify(inAuthNum),
				dataType : "JSON",
				headers : {
	            	"Accept" : "application/json",
					"Content-Type" : "application/json"
	            },
	            success : function(JSONData, status){
	            	var result = JSONData;
	            	if(true){
	            		if(result){
		            		$('#help3').remove()
		            		$($("#authNumHelpBlock").last().after('<strong class="text-success" id="help3">인증 완료되었습니다.</strong>'))
		            	}else{
		            		$('#help3').remove()
		            		$($("#authNumHelpBlock").last().after('<strong class="text-danger" id="help3">인증번호를 다시 입력해주세요.</strong>'))
		            	}
	            	}else{
	            		$('#help3').remove()
	            		$($("#authNumHelpBlock").last().after('<strong class="text-danger" id="help3">인증번호를 입력해주세요.</strong>'))
	            	}
	            }
			})
		}
	</script>
	
	<!-- 아이디 AJax 체크 -->
	<script type="text/javascript">
		function checkId(){
	    var inputed = $('#userId').val();
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
	            	console.log(result)
	            	if(inputed.length > 4 && inputed.length <12){
	            		if(result){
		            		$('#help').remove()
		            		$($("#joinhelpBlock").last().after('<strong class="text-success" id="help">가입 가능한 아이디입니다.</strong>'))
		            	}else{
		            		$('#help').remove()
		            		$($("#joinhelpBlock").last().after('<strong class="text-danger" id="help">다른 아이디를 입력해주세요.</strong>'))
		            	}
	            	}else{
	            		$('#help').remove()
	            		$($("#joinhelpBlock").last().after('<strong class="text-danger" id="help">아이디는 5~11개 입니다.</strong>'))
	            	}
	            }
	        });
		}
	</script>
	
	<!-- 이메일 Ajax 체크 -->
	<script type="text/javascript">
	function checkEmail(){
		var inputed = $('#email').val();
		$.ajax({
			url : "/userRest/emailCheckDuplication",
			method : "POST",
            data : JSON.stringify(inputed),
            dataType : "json",
            headers : {
            	"Accept" : "application/json",
				"Content-Type" : "application/json"
            },
            success : function(JSONData, status){
            	
            	var result = JSONData;
            	if( ! (inputed != "" && (inputed.indexOf('@') < 1 || inputed.indexOf('.') == -1))){
            		if(result){
	            		$('#help2').remove()
	            		$($("#emailHelpBlock").last().after('<strong class="text-success" id="help2">가입 가능한 이메일 입니다.</strong>'))
	            	}else{
	            		$('#help2').remove()
	            		$($("#emailHelpBlock").last().after('<strong class="text-danger" id="help2">다른 이메일을 입력해주세요.</strong>'))
	            	}
            	}else{
            		$('#help2').remove()
            		$($("#emailHelpBlock").last().after('<strong class="text-danger" id="help2">이메일을 입력해주세요.</strong>'))
            	}
            }
		});
	}
	</script>
	
	<!-- 달력 -->
	<script type="text/javascript">
		$(function(){
			$("input[name='birthday']").datepicker( {
				dateFormat: 'yy-mm-dd',
				changeMonth: true,
			    changeYear: true,
			    minDate: '-150y',
			    yearRange: 'c-100:c+10'
			});
		});
	</script>
</head>

<body>
	<!-- sideMenu.jsp 추가 -->
	<!-- 화면구성 -->
	<div class="container">
		<h1 class="bg-primary text-center">SNS 회 원 가 입</h1>
	
		<form class="form-horizontal">
			
			<div class="form-group">
			    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">닉네임</label>
			    <div class="col-sm-4">
			   		<input autocomplete="off" type="text" class="form-control" id="userName" name="userName" placeholder="닉네임">
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
			    	<input autocomplete="off" type="email" oninput="checkEmail()" class="form-control" id="email" name="email" placeholder="이메일">
			    	<span id="emailHelpBlock" class="help-block"></span>
			    </div>
			    <button type="button" class="btn btn-default" id="authEmail">인증하기</button>
			</div>
			
			<div class="form-group">
			    <label for="emailCheck" class="col-sm-offset-1 col-sm-3 control-label">인증번호</label>
			    <div class="col-sm-4">
			    	<input type="text" autocomplete="off"  oninput="emailCheckDuplication()" class="form-control" id="authNum" name="authNum" placeholder="이메일로 전송된 코드 입력">
			    	<span id="authNumHelpBlock" class="help-block"></span>
			    </div>
			</div>
			
			<div align="center">
				<button type="button" class="btn btn-primary"  >가입</button>
		        <a class="btn btn-danger btn" href="#" role="button">취소</a>
			</div>
		</form>
	</div>
</body>
</html>