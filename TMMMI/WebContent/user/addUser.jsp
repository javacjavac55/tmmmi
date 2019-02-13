<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<head>
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
	<!-- ��ư �̺�Ʈ -->
	<script type="text/javascript">
		//============= "����"  Event ���� ================
		$(function(){
			$(document).on('click', 'button.btn.btn-primary', function(){
				fncAddUser();
			});
		})
		//============= "���"  Event ���� =================
		$(function() {
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});
		
		//============="�̸��� ����" Event ���� ==============
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
	</script>
	
	<!-- ȸ�� �Է� ���� �� üũ -->
	<script type="text/javascript">
		
		function fncAddUser() {
			
			var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var userName=$("input[name='userName']").val();
			var birthday=$("input[name='birthday']").val();
			var email=$("input[name=email]").val();
			var authNum=$("input[name=authNum]").val();
			
			if(id == null || id.length <5){
				swal({
					  title: "���� ����",
					  text: "���̵�� �ݵ�� �Է��ϼž� �մϴ�.!",
					  icon: "warning",
					  dangerMode: true,
					})
				return;
			}
			if(pw == null || pw.length <1){
				swal({
					  title: "���� ����",
					  text: "�н������ �ݵ�� �Է��ϼž� �մϴ�.!",
					  icon: "warning",
					  dangerMode: true,
					})
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				swal({
					  title: "���� ����",
					  text: "�н������ Ȯ���� �ݵ�� �Է��ϼž� �մϴ�.!",
					  icon: "warning",
					  dangerMode: true,
					})
				return;
			}
			if(userName == null || userName.length <1){
				swal({
					  title: "���� ����",
					  text: "�г�����  �ݵ�� �Է��ϼž� �մϴ�.!",
					  icon: "warning",
					  dangerMode: true,
					})
				return;
			}
			if(email == null || (email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1))){
				swal({
					  title: "���� ����",
					  text: "�̸����� �ݵ�� �Է��ϼž� �մϴ�.!",
					  icon: "warning",
					  dangerMode: true,
					})
				return;
			}
			if(authNum == null || authNum.length <5){
				swal({
					  title: "���� ����",
					  text: "������ȣ�� �ݵ�� �Է��ϼž� �մϴ�.!",
					  icon: "warning",
					  dangerMode: true,
					})
				return;
			}
			
			if( pw != pw_confirm ) {
				swal({
					  title: "���� ����",
					  text: "��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�!",
					  icon: "warning",
					  dangerMode: true,
					})
				$("input:text[name='password2']").focus();
				return;
			}
			swal({
				title : "���� �Ϸ�" , 
				text: "ȸ�������� �Ϸ��Ͽ����ϴ�. Tmmmi�� �̿��� ������!" , 
				icon : "success" , 
			}).then((value)=>{
				$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
			})
		}
	</script>
	
	<!-- �̸��� ���� -->
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
	
	<!-- �̸��� ������ȣ üũ -->
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
		            		$($("#authNumHelpBlock").last().after('<strong class="text-success" id="help3">���� �Ϸ�Ǿ����ϴ�.</strong>'))
		            	}else{
		            		$('#help3').remove()
		            		$($("#authNumHelpBlock").last().after('<strong class="text-danger" id="help3">������ȣ�� �ٽ� �Է����ּ���.</strong>'))
		            	}
	            	}else{
	            		$('#help3').remove()
	            		$($("#authNumHelpBlock").last().after('<strong class="text-danger" id="help3">������ȣ�� �Է����ּ���.</strong>'))
	            	}
	            }
			})
		}
	</script>
	
	<!-- ���̵� AJax üũ -->
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
		            		$($("#joinhelpBlock").last().after('<strong class="text-danger" id="help">�ٸ� ���̵� �Է����ּ���.</strong>'))
		            	}else{
		            		$('#help').remove()
		            		$($("#joinhelpBlock").last().after('<strong class="text-success" id="help">���� ������ ���̵��Դϴ�.</strong>'))
		            	}
	            	}else{
	            		$('#help').remove()
	            		$($("#joinhelpBlock").last().after('<strong class="text-danger" id="help">���̵�� 5~11�� �Դϴ�.</strong>'))
	            	}
	            }
	        });
		}
	</script>
	
	<!-- �̸��� Ajax üũ -->
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
	            		$($("#emailHelpBlock").last().after('<strong class="text-success" id="help2">���� ������ �̸��� �Դϴ�.</strong>'))
	            	}else{
	            		$('#help2').remove()
	            		$($("#emailHelpBlock").last().after('<strong class="text-danger" id="help2">�ٸ� �̸����� �Է����ּ���.</strong>'))
	            	}
            	}else{
            		$('#help2').remove()
            		$($("#emailHelpBlock").last().after('<strong class="text-danger" id="help2">�̸����� �Է����ּ���.</strong>'))
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
<div class="page-header header-filter clear-filter" data-parallax="true" style="background-image: url('/images/userSetting/79574.ngsversion.1422286298641.adapt.1900.1.jpg')">
  <div class="container">
    <div class="row">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand">
          <h2 class="title">Join Page</h2>
          <h3 class="title">TMMMI�� �Բ� �Ϸ縦 �����غ�����.</h3>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- ȭ�鱸�� -->
<div class="main main-raised">
	<div class="section section-basic">
		<div class="container">
			<div class="row">
				<div class="col-md-6 ml-auto mr-auto">
					<div class="profile">
						<form>
							<div class="description text-center">
								<div class="form-group bmd-form-group">
									<label for="userId" class="bmd-label-static">Id</label>
									<input autocomplete="off" type="text" oninput="checkId()" class="form-control" id="userId" name="userId" placeholder="���̵�"/>
							  		<span id="joinhelpBlock" class="help-block"></span>
								</div>
							</div>
						  
							<div class="description text-center">
								<div class="form-group bmd-form-group">
									<label for="password" class="bmd-label-static">Password</label>
									<input type="password" class="form-control" id="password" name="password" placeholder="��й�ȣ">
								</div>
							</div>
							  
							<div class="description text-center">
								<div class="form-group bmd-form-group">
									<label for="password2" class="bmd-label-static">Password Confirm</label>
									<input type="password" class="form-control" id="password2" name="password2" placeholder="��й�ȣ Ȯ��">
								</div>
							</div>
							
							<div class="description text-center">
								<div class="form-group bmd-form-group">
							    	<label for="userName" class="bmd-label-static">Nickname</label>
							   		<input autocomplete="off" type="text" class="form-control" id="userName" name="userName" placeholder="�г���">
							    </div>
							</div>
							
							<div class="description text-center">
								<div class="form-group bmd-form-group">
							    	<label for="birthday" class="bmd-label-static">Birthday</label>
							    	<input type="text" class="form-control" id="birthday" name="birthday" placeholder="�������" readonly>
							    </div>
							</div>
							
							<div class="description text-center">
								<div class="form-group bmd-form-group">
							    <label for="email" class="bmd-label-static">E-mail</label>
							    	<input autocomplete="off" type="email" oninput="checkEmail()" class="form-control" id="email" name="email" placeholder="�̸���">
							    	<span id="emailHelpBlock" class="help-block"></span>
							    </div>
							    <button type="button" class="btn btn-default" id="authEmail">confirm</button>
							</div>
							
							<div class="description text-center">
								<div class="form-group bmd-form-group">
							    <label for="emailCheck" class="bmd-label-static">E-mail Confirm</label>
							    	<input type="text" autocomplete="off"  oninput="emailCheckDuplication()" class="form-control" id="authNum" name="authNum" placeholder="�̸��Ϸ� ���۵� �ڵ� �Է�">
							    	<span id="authNumHelpBlock" class="help-block"></span>
							    </div>
							</div>
							
							<div align="center">
								<button type="button" class="btn btn-primary"  >����</button>
						        <a class="btn btn-danger btn" href="#" role="button">���</a>
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