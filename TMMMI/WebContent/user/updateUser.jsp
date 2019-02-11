<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Tmmmi</title>
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
				swal({
					  text: "�н������ �ݵ�� �Է��ϼž� �մϴ�.!",
					  icon: "warning",
					  dangerMode: true,
					})
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				swal({
					  text: "�н������ Ȯ���� �ݵ�� �Է��ϼž� �մϴ�.!",
					  icon: "warning",
					  dangerMode: true,
					})
				return;
			}
			if(userName == null || userName.length <1){
				swal({
					  text: "�г�����  �ݵ�� �Է��ϼž� �մϴ�.!",
					  icon: "warning",
					  dangerMode: true,
					})
				return;
			}
			if(email == null || email.length <1){
				swal({
					  text: "�̸����� �ݵ�� �Է��ϼž� �մϴ�.!",
					  icon: "warning",
					  dangerMode: true,
					})
				return;
			}
			if(emailCheck == null || emailCheck.length <1){
				swal({
					  text: "������ȣ�� �ݵ�� �Է��ϼž� �մϴ�.!",
					  icon: "warning",
					  dangerMode: true,
					})
				return;
			}
			
			if( pw != pw_confirm ) {				
				swal({
					  text: "��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�!",
					  icon: "warning",
					  dangerMode: true,
					})
				return;
			}
			swal({
				title : "���� �Ϸ�" , 
				text: "ȸ�� ���� ������ �Ϸ��Ͽ����ϴ�. Tmmmi�� �̿��� ������!" , 
				icon : "success" , 
			}).then((value)=>{
				$("form").attr("method" , "POST").attr("action", "/user/updateUser").submit();
			})
		}
	</script>
	
	<!-- �̸��� ���� -->
	<script type="text/javascript">
		//============= "�̸��� ����"  Event ���� =============
		 $(function() {
			$( "button.btn.btn-default" ).on("click" , function() {
				swal({
					  title: "�̸��� ���� ��",
					  text: "��ø� ��ٷ� �ּ���!",
					  icon: "warning",
					  dangerMode: true,
					})
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
	            		swal({
		    				title : "�̸��� ���� �Ϸ�" , 
		    				text: "�̸��Ϸ� ������ȣ�� �����Ͽ����ϴ�." , 
		    				icon : "success" , 
		    			});
	            	}
	            }
			});
		}
	</script>
	
	<!-- �޷� -->
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
<!-- sideMenu.jsp �߰� -->
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
					<input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" placeholder="�ߺ�Ȯ���ϼ���"  readonly>
				</div>
			</div>
			
			<div class="description text-center">
				<div class="form-group bmd-form-group">
					<label for="password" class="bmd-label-static">Password</label>
					<input type="password" class="form-control" id="password" name="password" placeholder="�����й�ȣ">
				</div>
			</div>
			  
			<div class="description text-center">
				<div class="form-group bmd-form-group">
					<label for="password2" class="bmd-label-static">Password Confirm</label>			
					<input type="password" class="form-control" id="password2" name="password2" placeholder="�����й�ȣ Ȯ��">
				</div>
			</div>
			  
			<div class="description text-center">
				<div class="form-group bmd-form-group">
					<label for="userName" class="bmd-label-static">Nickname</label>
					<input type="text" class="form-control" id="userName" name="userName" value="${user.userName}" placeholder="����ȸ���̸�">
				</div>
			</div>
			
			<div class="description text-center">
				<div class="form-group bmd-form-group">
					<label for="userName" class="bmd-label-static">Birthday</label>
					<input type="text" class="form-control" id="birthday" name="birthday" value="${user.birthday}" placeholder="���� �Է�">
				</div>
			</div>
			  
			<div class="description text-center">
				<div class="form-group bmd-form-group">
					<label for="ssn" class="bmd-label-static">E-mail</label>
					<input type="text" class="form-control" id="email" name="email"  value="${user.email}" placeholder="�����ּ�">
					<button type="button" class="btn btn-default" id="authEmail">confirm</button>
				</div>
			</div>
			  
			<div class="description text-center">
				<div class="form-group bmd-form-group">
				<label for="ssn" class="bmd-label-static">E-mail confirm</label>
					<input type="text" autocomplete="off" class="form-control" id="emailCheck" name="emailCheck" placeholder="�ڵ� �Է�">
				</div>
			</div>
			  
			<div class="description text-center">
				<div class="form-group bmd-form-group">
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