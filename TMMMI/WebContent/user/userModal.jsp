<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<!-- 버튼 이벤트 -->
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
				swal({
					  text: "닉네임은  반드시 입력하셔야 합니다.!",
					  icon: "warning",
					  dangerMode: true,
					})
				return;
			}
			
			if(inEmail == null || inEmail.length <1){
				swal({
					  text: "이메일은 반드시 입력하셔야 합니다.!",
					  icon: "warning",
					  dangerMode: true,
					})
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
	            dataType : 'text',
	            headers : {
	            	'Accept' : 'application/json',
					'Content-Type' : 'application/json'
	            },
	            success : function(Data){
	            	var result = Data;
	            	swal({
	    				title : "아이디는"+result+"*** 입니다." , 
	    				text: "아이디는 끝에 세자리 *처리 됩니다." , 
	    				icon : "success" , 
	    			}).then((value)=>{
	    				window.location = '/user/login.jsp';
	    			})
	            },
	            error : function(request, status, error ) {  
	            	console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
	            }
			});
		}
	</script>
</head>
<body>
<!-- 아이디 찾기 모달 -->
	<div class="modal fade" id="searchUserIdModal" role="" tabindex="-1">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="card card-plain">
					<div class="modal-header">
						<div class="card-header card-header-text card-header-primary">
							<button aria-hidden="true" class="close" data-dismiss="modal"
								type="button">
								<i class="material-icons">clear</i>
							</button>
							<h5 class="card-title">아이디 찾기</h5>
						</div>
					</div>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="description text-center">
							<div class="form-group bmd-form-group">
						 		<label for="userId" class="bmd-label-static">Nickname</label>
								<input type="text" class="form-control" id="userName" name="userName" placeholder="닉네임을 입력하세요."/>
						  	</div>
						</div>
					  
						<div class="description text-center">
							<div class="form-group bmd-form-group">
								<label for="password" class="bmd-label-static">E-mail</label>
							 	<input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요.">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" >아이디 찾기</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
</body>
</html>