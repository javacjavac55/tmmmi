<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> addQNAAnswer </title>
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

	<script type="text/javascript">
	
	$(function() {
		$( ".btn-pink:contains('�亯�ޱ�')" ).on("click" , function() {
			alert("��¥ �޲���?")
			/* var userNo=16; */
			fncAddQNAAnswer();
		});
		
		$( ".btn-default:contains('���')" ).on("click" , function() {
			history.go(-1);
		});
	});
	
	$(function() {

	    getTimeStamp();

	});



	function getTimeStamp() {

	    var d = new Date();



	    var date = leadingZeros(d.getFullYear(), 4) + '-' +

	        leadingZeros(d.getMonth() + 1, 2) + '-' +

	        leadingZeros(d.getDate(), 2) + ' ';



	    var time = leadingZeros(d.getHours(), 2) + ':' +

	        leadingZeros(d.getMinutes(), 2) + ':' +

	        leadingZeros(d.getSeconds(), 2);



	    $('#date').val(date);

	    $('#time').val(time);

	}



	function leadingZeros(n, digits) {

	    var zero = '';

	    n = n.toString();



	    if (n.length < digits) {

	        for (i = 0; i < digits - n.length; i++)

	            zero += '0';

	    }

	    return zero + n;

	}



	function fncAddQNAAnswer() {
		
		var detail = $("textarea[name='QNAAnswerDetail']").val();
		
		 if(detail == null || detail.length<1){
			alert("������ �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		
		$("form").attr("method" , "POST").attr("action", "/qna/addQNAAnswer").submit();
	}

	</script>
	
</head>
<body>
	<form name ="addQNAAnswer">
		<input type="hidden" name="QNANo" value="${qna.QNANo}" />
		<div class="container">
		
		<div class="page-header">
			<h2>1:1 �亯�ϱ�</h2>
		</div>
		
		<div class="row">
			<div class="col-md-1">
				<button type="button" class="btn btn-default;">�ۼ���¥</button>
			</div>
			<div class="col-md-8">
				 <input type="text" id="date">
			</div>
		</div>
	
		<div class="row" >
			<div class="col-md-1">
				<button type="button"  class="btn btn-default;">����</button>
			</div>
			<div class="col-md-8">
				 <textarea class="form-control" rows="13" name="QNAAnswerDetail" style="resize: none" >${qna.QNAAnswerDetail }</textarea> 
			</div>
			<div class="col-md-3"></div>
		</div>
		
		<div class="row text-center ">
	  		<div class="col-md-1"></div>
	  		<div class="col-md-8">
	  		<button type="button" class="btn btn-pink">�亯�ޱ�</button>
	  		<button type="button" class="btn btn-default">���</button>
	  		</div>
	  		<div class="col-md-1"></div>
	  	</div>
		</div>

	</form>
</body>
</html>