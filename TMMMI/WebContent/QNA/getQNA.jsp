<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> getQNA </title>
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

		
		$( ".btn-pink:contains('�����ϱ�')" ).on("click" , function() {
			var qnaNo = $(this).data("param1");
			self.location = "/qna/updateQNA?qnaNo="+qnaNo;
		});
		
		$( ".btn-default:contains('��Ϻ���')" ).on("click" , function() {
			self.location = "/qna/getQNAList";
		});
		
		$( ".btn-default:contains('�亯�ޱ�')" ).on("click" , function() {
			var qnaNo = $(this).data("param1");
			self.location = "/qna/addQNAAnswer?qnaNo="+qnaNo;
		});
		
		$( ".btn-default:contains('�亯�����ϱ�')" ).on("click" , function() {
			var qnaNo = $(this).data("param1");
			self.location = "/qna/updateQNAAnswer?qnaNo="+qnaNo;
		});
		
		$( ".btn-pink:contains('�繮���ϱ�')" ).on("click" , function() {
			self.location = "/qna/addQNA";
		});
	});
	
	</script>
	
</head>
<body>
	<form name ="getQNA" >
		<div class="container" >
		
		<div class="page-header">
			<h2>1:1���ǳ���</h2>
		</div>
		
		<div class="row">
			<div class="col-md-1">
				<button type="button" class="btn btn-default;">ī�װ�</button>
			</div>
		    <div class="col-md-2">
				<div class=" dropdown" style="background-color:rgb(0,0,0,0);">
					<c:if test="${qna.QNACategory ==0}">
			 			<button type="button" class="btn btn-default;" style="background-color:rgb(0,0,0,0);" >ȸ������</button>
			 		</c:if>
			 		<c:if test="${qna.QNACategory ==1}">
			 			<button type="button" class="btn btn-default;" style="background-color:rgb(0,0,0,0);" >����</button>
			 		</c:if>
			 		<c:if test="${qna.QNACategory ==2}">
			 			<button type="button" class="btn btn-default;" style="background-color:rgb(0,0,0,0);" >������ ����</button>
			 		</c:if>
			 		<c:if test="${qna.QNACategory ==3}">
			 			<button type="button" class="btn btn-default;" style="background-color:rgb(0,0,0,0);" >���̾</button>
			 		</c:if>
			 		<c:if test="${qna.QNACategory ==4}">
			 			<button type="button" class="btn btn-default;" style="background-color:rgb(0,0,0,0);" >��ũ��</button>
			 		</c:if>
				</div>
			</div>
			<c:if test="${role == 1}">
				<div class="col-md-1">
					<button type="button" class="btn btn-default;">ȸ�����̵�</button>
				</div>
				<div class="col-md-2" >
					<button type="button" class="btn btn-default;" style="background-color:rgb(0,0,0,0);" >${writerUserId}</button>
				</div>
			</c:if>
			<c:if test="${role == 0}">
				<div class="col-md-1">
					<button type="button" class="btn btn-default;">ȸ�� ���̵�</button>
				</div>
				<div class="col-md-2" >
					<button type="button" class="btn btn-default;" style="background-color:rgb(0,0,0,0);" >${writerUserId}</button>
				</div>
			</c:if>
			<div class="col-md-1">
					<button type="button" class="btn btn-default;">�ۼ���¥</button>
				</div>
			<div class="col-md-2" >
				<button type="button" class="btn btn-default;" style="background-color:rgb(0,0,0,0);">${qna.QNADate}</button>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-1">
				<button type="button" class="btn btn-default;">�� ����</button>
			</div>
			<div class="col-md-5">
				 <button type="button" class="btn btn-default;" style="background-color:rgb(0,0,0,0);">${qna.QNATitle}</button>
			</div>
			<div class="col-md-1">
				<button type="button" class="btn btn-default;">�亯 ��Ȳ</button>
			</div>
			<div class="col-md-2">
				<div>
					<c:if test="${qna.QNAAnswerCheck == 0}">
						<button type="button" class="btn btn-default;" style="background-color:rgb(0,0,0,0);">�̿Ϸ�</button>
					</c:if><c:if test="${qna.QNAAnswerCheck == 1}">
						<button type="button" class="btn btn-default;" style="background-color:rgb(0,0,0,0);">�Ϸ�</button>
					</c:if>
				</div>
			</div>
		</div>
	
		<div class="row" >
			<div class="col-md-1">
				<button type="button"  class="btn btn-default;">����</button>
			</div>
			<div class="col-md-8">
				 <textarea class="form-control" rows="13" name="QNADetail" style="resize: none"  readonly="readonly">${qna.QNADetail}</textarea> 
			</div>
			<div class="col-md-3"></div>
		</div>
		
		<div class="row text-center ">
	  		<div class="col-md-1"></div>
	  		<div class="col-md-8">
	  		<c:if test="${role == 1}">
	  			<c:if test="${qna.QNAAnswerCheck == 0}">
	  				<button type="button" class="btn btn-pink"  data-param1="${qna.QNANo}">�����ϱ�</button>
	  				<button type="button" class="btn btn-default">��Ϻ���</button>
	  			</c:if>
	  		</c:if>
	  		<c:if test="${role == 0}">
	  			<c:if test="${qna.QNAAnswerCheck == 0}">
	  				<button type="button" class="btn btn-default" data-param1="${qna.QNANo}">�亯�ޱ�</button>
	  				<button type="button" class="btn btn-default">��Ϻ���</button>
	  			</c:if>
	  			<c:if test="${qna.QNAAnswerCheck == 1}">
	  				<button type="button" class="btn btn-default" data-param1="${qna.QNANo}">�亯�����ϱ�</button>
	  				<button type="button" class="btn btn-default">��Ϻ���</button>
	  			</c:if>
	  		</c:if>
	  		<div class="col-md-1"></div>
	  	</div>
		</div>
		
		<div class="row text-center ">
			<c:if test="${qna.QNAAnswerCheck == 1}">
				<div class="container">
				<div class="row" >
					<div class="col-md-1">
						<button type="button"  class="btn btn-default;">����</button>
					</div>
					<div class="col-md-8">
						 <textarea class="form-control" rows="13" name="QNAAnswerDetail" style="resize: none"  readonly="readonly">${qna.QNAAnswerDetail}</textarea> 
					</div>
					<div class="col-md-3"></div>
				</div>
				
				<br/>
				
				<div class="row text-center ">
			  		<button type="button" class="btn btn-pink col-md-10" >�亯�� ���� �繮�ǰ� �ʿ��Ͻ� ��� �ٽ� ���� ���ּ��� 
			  		</button>
			  	</div>
				 <c:if test="${role == 1}">
					 <div class="col-md-5"></div>
					<button type="button" class="btn btn-default ">��Ϻ���</button>
				</c:if>
				</div>
			</c:if>
		</div>
		</div>
	</form>
</body>
</html>