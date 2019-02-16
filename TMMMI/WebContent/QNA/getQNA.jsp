<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> getQNA </title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
	
	<!-- CSS Files -->
	<link href="/css/template/material-kit.css" rel="stylesheet" />
	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link href="/css/template/demo.css" rel="stylesheet" />
	
	<!--  Fonts and icons -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
	
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!-- styleSheet -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


	<script type="text/javascript">
	
		////////////////////////////////�����ϱ�
		$(function() {
			$( ".btn-primary:contains('�����ϱ�')" ).on("click" , function() {
				var qnaNo = $(this).data("param1");
				self.location = "/qna/updateQNA?qnaNo="+qnaNo;
			});
		});
		
		////////////////////////////////��Ϻ���
		$(function() {
			$( ".btn-default:contains('��Ϻ���')" ).on("click" , function() {	
				self.location = "/qna/getQNAList";
			});
		});
		
		////////////////////////////////�亯�ޱ�
		$(function() {
			$( ".btn-primary:contains('�亯�ޱ�')" ).on("click" , function() {
				var qnaNo = $(this).data("param1");
				self.location = "/qna/addQNAAnswer?qnaNo="+qnaNo;
			});
		});
		
		////////////////////////////////�亯�����ϱ�
		$(function() {
			$( ".btn-primary:contains('�亯�����ϱ�')" ).on("click" , function() {
				var qnaNo = $(this).data("param1");
				self.location = "/qna/updateQNAAnswer?qnaNo="+qnaNo;
			});
		});
		
		////////////////////////////////�繮���ϱ�
		$(function() {
			$( ".btn-primary:contains('�繮���ϱ�')" ).on("click" , function() {
				self.location = "/qna/addQNA";
			});
		});
		
	</script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		.row {
 			margin-bottom:10px
 		}
 		.giyong{
 			padding-left : 10px;
 		}
 		.index-page{
 			font-family: ���� ���; 
 			font-weight: 300;
 		}
	</style>
	
</head>
<body class="index-page sidebar-collapse">
	<form name ="getQNA" >
	<jsp:include page="/common/toolbar2.jsp"></jsp:include>
	  <div class="page-header header-filter clear-filter" style="background-image: url('/images/userSetting/ ${userSetting.image}')">
	    <div class="container">
	      <div class="row">
	        <div class="col-md-8 ml-auto mr-auto">
	          <div class="brand">
	          	<h2 class="title" style="font-family: ���� ���;">1:1 �亯 Ȯ��</h2>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div> 
	  
	  <div class="main main-raised">
	   <div class="section section-basic">
	     <div class="container">
	      
		<div class="col-md-10 ml-auto mr-auto">
			<div class="form-group row">
				<div class="col-md-6">
			    	<label style="color:#9c27b0!important">ī�װ�</label>
					<c:if test="${qna.QNACategory ==0}">
				 	  <input type="text" class="form-control giyong"  value="ȸ������" readonly  style="background-color:rgb(0,0,0,0);">
					</c:if>
					<c:if test="${qna.QNACategory ==1}">
				 	  <input type="text" class="form-control giyong"  value="���� ����" readonly  style="background-color:rgb(0,0,0,0);">
					</c:if>
					<c:if test="${qna.QNACategory ==2}">
				 	  <input type="text" class="form-control giyong"  value="������ ����" readonly  style="background-color:rgb(0,0,0,0);">
					</c:if>
					<c:if test="${qna.QNACategory ==3}">
				 	  <input type="text" class="form-control giyong"  value="���̾/����" readonly  style="background-color:rgb(0,0,0,0);">
					</c:if>
					<c:if test="${qna.QNACategory ==4}">
				 	  <input type="text" class="form-control giyong"  value="��Ÿ" readonly  style="background-color:rgb(0,0,0,0);">
					</c:if>
			    </div>
				<div class="form-group col-md-6" >
				    <label style="color:#9c27b0!important;">�ۼ� ��¥</label>
				    <input type="text" class="form-control giyong" name="QNADate" value="${qna.QNADate}" readonly  style="background-color:rgb(0,0,0,0);">
				</div>
		 	</div>
		 	
		 	<div class="form-group row">
		 		<c:if test="${role == 0}">
					<div class="col-md-4">
				    	<label style="color:#9c27b0!important;">ȸ�� ���̵�</label>
					    <input type="text" class="form-control giyong" value="${writerUserId}" readonly  style="background-color:rgb(0,0,0,0);">
				    </div>
					<div class="form-group col-md-4">
					    <label style="color:#9c27b0!important;">ȸ�� �г���</label>
					    <input type="text" class="form-control giyong" value="${writerUserName }" readonly  style="background-color:rgb(0,0,0,0);">
					</div>
					<div class="form-group col-md-4">
					    <label style="color:#9c27b0!important;">�亯 ��Ȳ</label>
					    <c:if test="${qna.QNAAnswerCheck == 0}">
					    	<input type="text" class="form-control giyong" value="�̿Ϸ�" readonly  style="background-color:rgb(0,0,0,0);">
					    </c:if>
					    <c:if test="${qna.QNAAnswerCheck == 1}">
					    	<input type="text" class="form-control giyong" value="�Ϸ�" readonly  style="background-color:rgb(0,0,0,0);">
					    </c:if>
					</div>
				</c:if>
		 		<c:if test="${role == 1}">
					<div class="col-md-6">
				    	<label style="color:#9c27b0!important;">ȸ�� ���̵�</label>
					    <input type="text" class="form-control giyong" value="${writerUserId}" readonly  style="background-color:rgb(0,0,0,0);">
				    </div>
					<div class="form-group col-md-6">
					    <label style="color:#9c27b0!important;">�亯 ��Ȳ</label>
					    <c:if test="${qna.QNAAnswerCheck == 0}">
					    	<input type="text" class="form-control giyong" value="�̿Ϸ�" readonly  style="background-color:rgb(0,0,0,0);">
					    </c:if>
					    <c:if test="${qna.QNAAnswerCheck == 1}">
					    	<input type="text" class="form-control giyong" value="�Ϸ�" readonly  style="background-color:rgb(0,0,0,0);">
					    </c:if>
					</div>
				</c:if>
		 	</div>
		 	
		 	<div class="form-group">
				<label style="color:#9c27b0!important;">���� ����</label>
				<input type="text" class="form-control giyong"  name="QNATitle" value="${qna.QNATitle}" readonly  style="background-color:rgb(0,0,0,0); ">
			</div>
			
			<div class="form-group ">
			    <label style="color:#9c27b0!important;">���� ����</label>
			    <div style="min-height:300px; border:1px solid; color:#d2d2d2">
			    	<div style="color:black; margin: 2%;">
			    		${qna.QNADetail}
			    	</div>
			    </div>
			</div>
			
			<div class="form-group"  align="center">
				<c:if test="${role == 0}">
					<c:if test="${qna.QNAAnswerCheck == 0}">
						<button type="button" class="btn btn-primary btn-round btn-sm"  data-param1="${qna.QNANo}">�亯�ޱ�</button>
		  				<button type="button" class="btn btn-default btn-round btn-sm">��Ϻ���</button>
		  			</c:if>
		  			<c:if test="${qna.QNAAnswerCheck == 1}">
		  				<button type="button" class="btn btn-primary btn-round btn-sm"  data-param1="${qna.QNANo}">�亯�����ϱ�</button>
		  				<button type="button" class="btn btn-default btn-round btn-sm">��Ϻ���</button>
					</c:if>				
				</c:if>
				<c:if test="${role == 1}">
					<c:if test="${qna.QNAAnswerCheck == 0}">
						<button type="button" class="btn btn-primary btn-round btn-sm"  data-param1="${qna.QNANo}">�����ϱ�</button>
		  				<button type="button" class="btn btn-default btn-round btn-sm">��Ϻ���</button>
					</c:if>
				</c:if>
			</div>
		</div>
		
		<div class="col-md-10 ml-auto mr-auto">
		
			<c:if test="${qna.QNAAnswerCheck == 1}">
				<div class="form-group ">
				    <label style="color:#9c27b0!important;">�亯 ����</label>
				    <div style="min-height:300px; border:1px solid; color:#d2d2d2">
				    	<div style="color:black; margin: 2%;">
				    		${qna.QNAAnswerDetail}
				    	</div>
				    </div>
				</div>
				
				<div style="border:1px solid; color:#df86ee;" class="col-md-12" >
				    	<div style="color:black; text-align:center; font-size: 14px; height: 38px;">
				    		�亯�� ���� �繮�ǰ� �ʿ��Ͻ� ��� �ٽ� ���� ���ּ���
				    		<button type="button" class="btn btn-primary btn-round btn-sm">�繮���ϱ�</button>
				    	</div>
				 </div>
				
				<br>
				
				<c:if test="${role == 1}" >
					<div align="center">
						<button type="button" class="btn btn-default btn-round btn-sm" >��Ϻ���</button>
					</div>
				</c:if>
			</c:if>
		</div>
		
	<br/><br/><br/><br/>
		
		</div>
      </div>
    </div>
  </form>
</body>
</html>
<jsp:include page="/common/footer.jsp"></jsp:include>