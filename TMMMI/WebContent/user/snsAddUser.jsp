<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- sweetalert -->
	<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script >
	
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
			var email=$('#email').val();
			var authNum=$("input[name='authNum']").val();

			if(userName == null || userName.length <1){
				swal({
					  text: "닉네임은 반드시 입력하셔야 합니다.!",
					  icon: "warning",
					  dangerMode: true,
					})
				return;
			}
			if(birthday == null || birthday.length <1){
				swal({
					  text: "생일은 반드시 입력하셔야 합니다.!",
					  icon: "warning",
					  dangerMode: true,
					})
				return;
			}
			if(email == null || (email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1))){
				swal({
					  text: "이메일은 반드시 입력하셔야 합니다.!",
					  icon: "warning",
					  dangerMode: true,
					})
				return;
			}
			if(authNum == null || authNum.length <5){
				swal({
					  text: "인증번호는 반드시 입력하셔야 합니다.!",
					  icon: "warning",
					  dangerMode: true,
					})
					 
				return;
			}
			
			$("form").attr("method" , "POST").attr("action" , "/user/addSNSUser").submit();
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

<body class="index-page sidebar-collapse">
<!-- sideMenu.jsp 추가 -->
<jsp:include page="/common/toolbar2.jsp"></jsp:include>
 	<div class="page-header header-filter clear-filter" data-parallax="true" style="background-image: url('/images/userSetting/201803230806542197_6_20180323080704381.jpg')">
    <div class="container">
      <div class="row">
        <div class="col-md-8 ml-auto mr-auto">
          <div class="brand">
            <h2 class="title">Join Page</h2>
          </div>
        </div>
      </div>
    </div>
  </div>
<!-- 화면구성 -->
<div class="main main-raised">
	<div class="section section-basic">
		<div class="container">
			<div class="row">
				<div class="col-md-6 ml-auto mr-auto">
					<div class="profile">
						<form>
							<div class="description text-center">
								<div class="form-group bmd-form-group">
									<input type="hidden" id="userNo" name="userNo" value="${userNo }" >
							   	 	<label for="userName" class="bmd-label-static">Nickname</label>
							   		<input autocomplete="off" type="text" class="form-control" id="userName" name="userName" placeholder="닉네임">
							    </div>
							</div>
							
							<div class="description text-center">
								<div class="form-group bmd-form-group">
							    	<label for="birthday" class="bmd-label-static">Birthday</label>
							    	<input type="text" class="form-control" id="birthday" name="birthday" placeholder="생년월일" readonly>
							    </div>
							</div>
							
							<div class="description text-center">
								<div class="form-group bmd-form-group">
							    	<label for="email" class="bmd-label-static">E-mail</label>
							    	<input autocomplete="off" type="email" oninput="checkEmail()" class="form-control" id="email" name="email" placeholder="이메일">
							    	<span id="emailHelpBlock" class="help-block"></span>
							    </div>
							    <button type="button" class="btn btn-default" id="authEmail">인증하기</button>
							</div>
							
							<div class="description text-center">
								<div class="form-group bmd-form-group">
							    	<label for="emailCheck" class="bmd-label-static">E-mail Confirm</label>
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
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>