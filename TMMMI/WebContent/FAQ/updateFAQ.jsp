
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> updateFAQ </title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- template -->
	<link rel="stylesheet" href="/css/template/main.css">
	
	<!-- sweetAlert -->
	<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js " > </script > 
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		.row {
 			margin-bottom:10px
 		}
 		.swal-title {
		  margin: 0px;
		  font-size: 16px;
		  margin-bottom: 28px;
		}
		.swal-button {
		  padding: 1px 16px;
		  background-color: #f4f6c6;
		  font-size: 12px;
		  border: 3px solid #f4f6c6;
		}

	</style>
	<script type="text/javascript">
		$(function() {	
			
			$("button:contains('�����ϱ�')" ).on("click" , function() {
				var name=$("input[name='FAQTitle']").val();
				var detail = $("textarea[name='FAQDetail']").val();
					
				if(name == null || name.length<1){
					swal("������ �ݵ�� �Է��Ͽ��� �մϴ�!", "�� �Է����ּ���");
					return;
				}
				 if(detail == null || detail.length<1){
					 swal("������ �ݵ�� �Է��Ͽ��� �մϴ�!", "�� �Է����ּ���");
					return;
				}
				 swal("�����Ϸ� �Ͻðڽ��ϱ�?", {
					 buttons: true,
					 value: true,
					}).then((result)=>{
						if (result === true) {
							fncUpdateFAQ();
					      }
					}, function (dismiss) { });
			});

			
			 $( ".btn-default" ).on("click" , function() {
					history.go(-1);
			});
		});
		
		function fncUpdateFAQ() {
			swal({
				title : "�ۼ��Ϸ� " , 
				text: "����Ʈ �������� �̵��մϴ�! " , 
				icon : "success" , 
			}).then((value) => {
				$("form").attr("method" , "POST").attr("action" ,"/faq/updateFAQ?faqNo="+faqNo).submit();
			});
		}
	</script>
	
</head>
<body>
	<form name = "addFAQ">
		<div class="container">
		
		<div class="page-header">
			<h2>FAQ �����ϱ�</h2>
		</div>
		
		<div class="row">
			<div class="col-md-1">
				<button type="button" class="btn btn-default;">ī�װ�</button>
			</div>
		    <div class="col-md-5">
				<select name ="FAQCategory" class="form-control">
				  <option value="0" >ȸ�� ����</option>
				  <option value="1" >���� ����</option>
				  <option value="2" >������ ����</option>
				  <option value="3" >���̾/��ũ��</option>
				  <option value="4" >��Ÿ</option>
				</select>
			</div>
		<div class="col-md-1">
			<button type="button" class="btn btn-default;">�ۼ���¥</button>
		</div>
		<div class="col-md-5" >
			<button type="button" class="btn btn-default;" style="background-color:rgb(0,0,0,0);" name="FAQDate" >${faq.FAQDate}</button>
		</div>
		</div>
		
		<div class="row">
			<div class="col-md-1">
				<button type="button" class="btn btn-default;">�� ����</button>
			</div>
			<div class="col-md-8">
				 <input type="text" class="form-control" name="FAQTitle" value="${faq.FAQTitle}">
			</div>
		</div>
	
		<div class="row" >
			<div class="col-md-1">
				<button type="button"  class="btn btn-default;">����</button>
			</div>
			<div class="col-md-8">
				 <textarea class="form-control" rows="13" name="FAQDetail"  style="resize: none; " >${faq.FAQDetail}</textarea> 
			</div>
			<div class="col-md-3"></div>
		</div>
		
		<div class="row text-center ">
	  		<div class="col-md-1"></div>
	  		<div class="col-md-8">
	  		<button type="button" class="btn btn-pink"  data-param1="${faq.FAQNo}">�����ϱ�</button>
	  		<button type="button" class="btn btn-default">���</button>
	  		</div>
	  		<div class="col-md-1"></div>
	  	</div>
		</div>

	</form>
</body>
</html>