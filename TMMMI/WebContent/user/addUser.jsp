<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ȸ�� ����</title>
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
	<!-- ��ư �̺�Ʈ -->
	<script type="text/javascript">
		//============= "����"  Event ���� =============
		 $(function() {
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		
		//============= "���"  Event ó�� ��  ���� =============
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
			
			$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}
		
		$(function(){
			$(document).on('click', 'button.btn.btn-primary', function(){
				fncAddUser();
			});
		})
	</script>
	
	<!-- ���̵� AJax üũ -->
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
	            			$($("#joinhelpBlock").last().after('<strong class="text-success" id="help">���� ������ ���̵��Դϴ�.</strong>'))
	            			$($(".col-sm-4").last()).after('<div class="col-sm-offset-4  col-sm-4 text-center" id="join">'
	            					+'<button type="button" class="btn btn-primary"  >��&nbsp;��</button>'
		            				+'<a class="btn btn-danger btn" href="#" role="button">��&nbsp;&nbsp;��</a></div>')
	            		}
	            	}else{
	            		if($('#join').length>0){
	            			$('#help').remove()
	            			$($("#joinhelpBlock").last().after('<strong class="text-danger" id="help">�ٸ����̵� �Է����ּ���.</strong>'))
	            			$('#join').remove()
	            		}
	            	}
	            }
	        });
		}
	</script>
	
	<!-- �޷� -->
	<script type="text/javascript">
		$(function(){
			$("input[name='birthday']").datepicker( {dateFormat: 'yy-mm-dd'});
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
				<input type="text" oninput="checkId()" class="form-control" id="userId" name="userId" placeholder="�ߺ�Ȯ���ϼ���"/>
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
			    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�̸�</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="userName" name="userName" placeholder="�г���">
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
			      <input type="email" class="form-control" id="email" name="email" placeholder="�̸���">
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="emailCheck" class="col-sm-offset-1 col-sm-3 control-label">�̸��� ����</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="emailCheck" name="emailCheck" placeholder="�̸��Ϸ� ���۵� �ڵ� �Է�">
			    </div>
			</div>
		</form>
	</div>
</body>
</html>