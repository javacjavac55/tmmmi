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
	
	<!-- ��ư �̺�Ʈ -->
	<script type="text/javascript">
		//============= "����"  Event ���� =============
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncUpdateUser();
			});
		});	
		
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
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
				alert("�н������  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("�н����� Ȯ����  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(userName == null || userName.length <1){
				alert("�г�����  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(email == null || email.length <1){
				alert("�̸����� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(emailCheck == null || emailCheck.length <1){
				alert("�̸��� ������ �Ϸ� �ؾ��մϴ�.");
				return;
			}
			
			if( pw != pw_confirm ) {				
				alert("��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
				$("input:text[name='password2']").focus();
				return;
			}
				
			$("form").attr("method" , "POST").attr("action", "/user/updateUser").submit();
		}
	</script>
	
	<!-- �̸��� ���� -->
	<script type="text/javascript">
		//============= "�̸��� ����"  Event ���� =============
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
	            		alert("�ش� �̸��Ϸ� �ڵ带 ���½��ϴ�. �ڵ带 �Է��� �ּ���!");
	            	}
	            }
			});
		}
	</script>
</head>

<body class="index-page sidebar-collapse">
<jsp:include page="/common/toolbar2.jsp"></jsp:include>
  <div class="page-header header-filter clear-filter" data-parallax="true" style="background-image: url(' ${ ! empty userSetting.image ? " ${userSetting.image}" : " /images/template/image_6845277191476929532543.jpg" }')">
    <div class="container">
      <div class="row">
        <div class="col-md-8 ml-auto mr-auto">
          <div class="brand">
            <h2 class="title">Update User Setting</h2>
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
		 <div class="page-header text-center">
		<h3 class=" text-info">ȸ����������</h3>
		<h5 class="text-muted">�� ������ <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.</h5>
		</div>
	   
		<!-- form Start-->
		<form class="form-horizontal">
		<input type="hidden" name="userNo" value="${userNo }"  />
			<div class="form-group">
				<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" placeholder="�ߺ�Ȯ���ϼ���"  readonly>
					<span id="helpBlock" class="help-block">
					<strong class="text-danger">���̵�� �����Ұ�</strong>
				</span>
				</div>
			</div>
			
			<div class="form-group">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="password" name="password" placeholder="�����й�ȣ">
				</div>
			</div>
			  
			<div class="form-group">
				<label for="password2" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ Ȯ��</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="password2" name="password2" placeholder="�����й�ȣ Ȯ��">
				</div>
			</div>
			  
			<div class="form-group">
				<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�г���</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="userName" name="userName" value="${user.userName}" placeholder="����ȸ���̸�">
				</div>
			</div>
			
			<div class="form-group">
				<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�������</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="birthday" name="birthday" value="${user.birthday}" placeholder="����ȸ���̸�">
				</div>
			</div>
			  
			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�̸���</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="email" name="email"  value="${user.email}" placeholder="�����ּ�">
				</div>
				<button type="button" class="btn btn-default" id="authEmail">�����ϱ�</button>
			</div>
			  
			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�̸��� ����</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="emailCheck" name="emailCheck" placeholder="�����̸���">
				</div>
			</div>
			  
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
					<a class="btn btn-danger btn" href="#" role="button">�� &nbsp;��</a>
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