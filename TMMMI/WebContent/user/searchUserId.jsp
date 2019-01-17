<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>���̵� ã��</title>
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
		$(function(){
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncSearchUserId();
			});
		})
	</script>
	
	<script type="text/javascript">
		function fncSearchUserId(){
			
			var inUserName=$("input[name='userName']").val();
			var inEmail=$("input[name=email]").val();
			
			if(inUserName == null || inUserName.length <1){
				alert("�г�����  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if(inEmail == null || inEmail.length <1){
				alert("�̸����� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
		    $.ajax({
	            url : "/userRest/searchUserId",
	            method : "POST",
	            data : JSON.stringify(
	            	{
	            		'userName' : inUserName,
	            		'email' : inEmail
	            	}					
	            ),
	            dataType: 'text',
	            headers : {
	            	'Accept' : 'application/json',
					'Content-Type' : 'application/json'
	            },
	            success : function(Data){
	            	var result = Data;
            		alert('���̵��'+result+'*** �Դϴ�.');
            		window.location = '/user/login.jsp';
	            },
	            error : function(request, status, error ) {   // ������ �߻����� �� ȣ��ȴ�. 

	            	console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);

	            }
			});
		}
	</script>

</head>
<body>
	<!-- sideMenu.jsp �߰� -->
	<!-- ȭ�鱸�� -->
	<div class="container">
		<h1 class="bg-primary text-center">���̵� ã��</h1>
	
		<form class="form-horizontal">
			<div class="form-group">
			  <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��</label>
			  <div class="col-sm-4">
				<input type="text" class="form-control" id="userName" name="userName" placeholder="�г����� �Է��ϼ���."/>
			  </div>
			</div>
		  
			<div class="form-group">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��</label>
				<div class="col-sm-4">
				  <input type="text" class="form-control" id="email" name="email" placeholder="�̸����� �Է��ϼ���.">
				</div>
			</div>
			
			<div align="center">
				<button type="button" class="btn btn-primary" >���̵� ã��</button>
			</div>
		</form>
	</div>
</body>
</html>