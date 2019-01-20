<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ȸ�� ����</title>
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
				alert("���̵�� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
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
			if(email == null || (email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1))){
				alert("�̸����� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(authNum == null || authNum.length <5){
				alert("������ȣ�� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if( pw != pw_confirm ) {				
				alert("��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
				$("input:text[name='password2']").focus();
				return;
			}
			
			$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
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
	            	if(result){alert("�ش� �̸��Ϸ� �ڵ带 ���½��ϴ�. �ڵ带 �Է��� �ּ���!");}
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
		            		$($("#joinhelpBlock").last().after('<strong class="text-success" id="help">���� ������ ���̵��Դϴ�.</strong>'))
		            	}else{
		            		$('#help').remove()
		            		$($("#joinhelpBlock").last().after('<strong class="text-danger" id="help">�ٸ� ���̵� �Է����ּ���.</strong>'))
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

<body>
	<!-- sideMenu.jsp �߰� -->
	<!-- ȭ�鱸�� -->
	<div class="container">
		<h1 class="bg-primary text-center">ȸ �� �� ��</h1>
	
		<form class="form-horizontal">
			<div class="form-group">
				<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��</label>
				<div class="col-sm-4">
					<input autocomplete="off" type="text" oninput="checkId()" class="form-control" id="userId" name="userId" placeholder="�ߺ�Ȯ���ϼ���"/>
			  		<span id="joinhelpBlock" class="help-block"></span>
				</div>
			</div>
		  
			<div class="form-group">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="password" name="password" placeholder="��й�ȣ">
				</div>
			</div>
			  
			<div class="form-group">
				<label for="password2" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ Ȯ��</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="password2" name="password2" placeholder="��й�ȣ Ȯ��">
				</div>
			</div>
			
			<div class="form-group">
			    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�г���</label>
			    <div class="col-sm-4">
			   		<input autocomplete="off" type="text" class="form-control" id="userName" name="userName" placeholder="�г���">
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="birthday" class="col-sm-offset-1 col-sm-3 control-label">�������</label>
			    <div class="col-sm-4">
			    	<input type="text" class="form-control" id="birthday" name="birthday" placeholder="�������" readonly>
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="email" class="col-sm-offset-1 col-sm-3 control-label">�̸���</label>
			    <div class="col-sm-4">
			    	<input autocomplete="off" type="email" oninput="checkEmail()" class="form-control" id="email" name="email" placeholder="�̸���">
			    	<span id="emailHelpBlock" class="help-block"></span>
			    </div>
			    <button type="button" class="btn btn-default" id="authEmail">�����ϱ�</button>
			</div>
			
			<div class="form-group">
			    <label for="emailCheck" class="col-sm-offset-1 col-sm-3 control-label">������ȣ</label>
			    <div class="col-sm-4">
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
</body>
</html>