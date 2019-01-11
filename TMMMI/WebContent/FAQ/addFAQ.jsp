
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> addFAQ </title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		.row {
 			margin-bottom:10px
 		}

	</style>
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	</script>
	
</head>
<body>
	<form name = "addFAQ">
		<div class="container">
		
		<div class="page-header">
			<h2>FAQ �ۼ��ϱ�</h2>
		</div>
		
		<div class="row">
			<div class="col-md-1">
				<button type="button" class="btn btn-default;">ī�װ�</button>
			</div>
		    <div class="col-md-5">
				<div class=" dropdown" style="background-color:rgb(0,0,0,0);">
			 		<button class="btn dropdown-toggle;" type="button" data-toggle="dropdown" style="background-color:rgb(0,0,0,0);">ȸ�� ����
			 		<span class="caret"></span></button>
		  			<ul class="dropdown-menu">
				    <li>ȸ�� ����</li>
				    <li>���� ����</li>
				    <li>������ ����</li>
				    <li>���̾/��ũ��</li>
				    <li>��Ÿ</li>
			  		</ul>
				</div>
			</div>
		<div class="col-md-1">
			<button type="button" class="btn btn-default;">�ۼ���¥</button>
		</div>
		<div class="col-md-5" >
			<button type="button" class="btn btn-default;" style="background-color:rgb(0,0,0,0);">2019-01-11</button>
		</div>
		</div>
		
		<div class="row">
			<div class="col-md-1">
				<button type="button" class="btn btn-default;">�� ����</button>
			</div>
			<div class="col-md-8">
				 <input type="text" class="form-control" id="FAQTitle" name="FAQTitle" placeholder=" ">
			</div>
		</div>
	
		<div class="row" >
			<div class="col-md-1">
				<button type="button"  class="btn btn-default;">����</button>
			</div>
			<div class="col-md-8">
				 <textarea class="form-control" rows="13" name="content" id="content" style="resize: none;"></textarea> 
			</div>
			<div class="col-md-3"></div>
		</div>
		
		<div class="row text-center ">
	  		<div class="col-md-1"></div>
	  		<div class="col-md-8">
	  		<button type="button" class="btn btn-pink">�ۼ��ϱ�</button>
	  		<button type="button" class="btn btn-default">���</button>
	  		</div>
	  		<div class="col-md-1"></div>
	  	</div>
		</div>

	</form>
</body>
</html>