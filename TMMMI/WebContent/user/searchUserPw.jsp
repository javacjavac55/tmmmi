<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>�� ���� ����</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link href="/css/template/material-kit.css" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/css/template/demo.css" rel="stylesheet" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- sweetalert -->
<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script >	
	
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
			
			var inUserId=$("input[name='userId']").val();
			var inEmail=$("input[name=email]").val();
			
			if(inUserId == null || inUserId.length <1){
				swal({
					  text: "�г�����  �ݵ�� �Է��ϼž� �մϴ�.!",
					  icon: "warning",
					  dangerMode: true,
					})
				return;
			}
			
			if(inEmail == null || inEmail.length <1){
				swal({
					  text: "�̸����� �ݵ�� �Է��ϼž� �մϴ�.!",
					  icon: "warning",
					  dangerMode: true,
					})
				return;
			}
			
		    $.ajax({
	            url : "/userRest/searchUserPw",
	            method : "POST",
	            data : JSON.stringify(
	            	{
	            		'userId' : inUserId,
	            		'email' : inEmail
	            	}					
	            ),
	            dataType : 'text',
	            headers : {
	            	'Accept' : 'application/json',
					'Content-Type' : 'application/json'
	            },
	            success : function(Data){
	            	var result = Data;
	            	
	            	if(result == 1){
	            		console.log(result);
	            		swal({
		    				title : "��й�ȣ ����" , 
		    				text: "�ӽ� ��й�ȣ�� �̸��Ϸ� ���۵Ǿ����ϴ�. �������������� �����ϼ���!" , 
		    				icon : "success" , 
		    			}).then((value)=>{
		    				window.location = '/user/login.jsp';
		    			})	
	            	}else{
	            		swal({
	  					  text: "�ٽ� �Է����ּ���!",
	  					  icon: "warning",
	  					  dangerMode: true,
	  					})
	            	}
	            },
	            error : function(request, status, error ) {  
	            	console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
	            }
			});
		}
	</script>

</head>

<body class="index-page sidebar-collapse">
	<div class="page-header header-filter clear-filter" data-parallax="true" style="background-image: url('/images/userSetting/moon-1527501_960_720.jpg')">
		<div class="container">
			<div class="row">
				<div class="col-md-8 ml-auto mr-auto">
					<div class="brand">
						<h2 class="title">Search UserId</h2>
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
							<form class="form-horizontal">
								<div class="description text-center">
									<div class="form-group bmd-form-group">
								 		<label for="userId" class="bmd-label-static">Id</label>
										<input type="text" class="form-control" id="userId" name="userId" placeholder="���̵� �Է��ϼ���."/>
								  	</div>
								</div>
							  
								<div class="description text-center">
									<div class="form-group bmd-form-group">
										<label for="password" class="bmd-label-static">E-mail</label>
									 	<input type="text" class="form-control" id="email" name="email" placeholder="�̸����� �Է��ϼ���.">
									</div>
								</div>
								
								<div align="center">
									<button type="button" class="btn btn-primary" >��й�ȣ ã��</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br><br>
	<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>