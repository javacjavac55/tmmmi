<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Tmmmi</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--  Fonts and icons -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">

<!-- CSS Files -->
<link href="/css/template/material-kit.css" rel="stylesheet" />

<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/css/template/demo.css" rel="stylesheet" />

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
<script type="text/javascript">
	/* ����Ʈ */
	function fncGetList(currentPage) {
		/* document.getElementById("currentPage").value = currentPage; */
		$("#currentPage").val(currentPage)
		/* document.detailForm.submit(); */
		$("form").attr("method", "POST").attr("action", "/diary/listDiary")
				.submit();
	}

	/* ��ü ���� */
	function fncAllchk() {
		if ($("#allCheck").is(':checked')) {
			$("input[name=deleteDiary]").prop("checked", true);
		} else {
			$("input[name=deleteDiary]").prop("checked", false);
		}
	}

	/* ���� */
	function fncDeleteDiary() {
		/* var userid = "";
		var diaryChk = document.getElementsByName("diaryNo");
		var chked = false;
		var indexid = false;
		for(i=0; i < memberChk.length; i++){
		 if(diaryChk[i].checked){
		  if(indexid){
		    userid = userid + '-';
		  }
		  userid = userid + diaryChk[i].value;
		  indexid = true;
		 }
		}
		if(!indexid){
		 alert("������ ���̾ üũ�� �ּ���");
		 return; 
		document.userForm.delUserid.value = userid;       
		// üũ�� ����� ���̵� '-'�� ���� userid ��  document.userForm.delUserid �� value�� ����
		var agree=confirm("���� �Ͻðڽ��ϱ�?");
		   if (agree){
		 document.userForm.execute.value = "userDel";
		   document.userForm.submit();
		   } 
		} */
		var agree = confirm("���� �Ͻðڽ��ϱ�?");
		if (agree == true) {
			$('[name="deleteForm"]').attr("method", "POST").attr("action",
					"/diary/deleteDiary").submit();
		}
		if (agree == false) {
			return false;
		}
	}

	$(function() {
		$("#addDiary").on("click", function() {
			location.replace('/diary/addDiary');
		});

		$(".getDetail td:nth-child(4)").on("click", function() {
			var diaryNo = $(this).data('param1');
			console.log("�ƾƾ�");
			self.location = "/diary/getDiary?diaryNo=" + diaryNo;
		});
	});
</script>
</head>
<body class="index-page sidebar-collapse">
	<jsp:include page="/common/toolbar2.jsp"></jsp:include>
	<div class="page-header header-filter clear-filter" data-parallax="true" style="background-image: url('/images/userSetting/ ${userSetting.image}')">
		<div class="container">
			<div class="row">
				<div class="col-md-8 ml-auto mr-auto">
					<div class="brand">
						<h2 class="title">Diary</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="main main-raised">
		<div class="section section-basic">
			<div class="container">
				<div align="center">
					<!-- Wrapper -->
					<div id="wrapper">
						<!-- Main -->
						<div id="main">
								<form name="detailForm">
									<input type="hidden" value="search" />

									<div class="form-group" align="left">
										<label for="userCategoryNo"
											class="col-sm-offset-1 col-sm-1 control-label text-center"></label>
										<h3 class="title">My Diary</h3>
										<div class="col-sm-4"></div>
									</div>

									<!-- table ���� �˻� Start /////////////////////////////////////-->
									<div class="row">

										<div class="col-md-6 text-left">
											<p class="text-primary">��ü ${resultPage.totalCount} �Ǽ�,
												���� ${resultPage.currentPage} ������</p>
											<input type="hidden" id="currentPage" name="currentPage"
												value="" />
										</div>


									</div>
									<!-- table ���� �˻� Start /////////////////////////////////////-->

								</form>
								<!-- �������� �� -->

								<!--  table Start /////////////////////////////////////-->
								<form name="deleteForm">
									<table class="table table-hover table-striped">

										<thead>
											<tr>
												<th align="center"><input id="allCheck" name="allCheck"
													type="checkbox" onclick="fncAllchk();" />��ü����</th>
												<th align="left">No</th>
												<th align="left">ī�װ�</th>
												<th align="left">���̾ ����</th>
												<th align="left">�ۼ� ��¥</th>
											</tr>
										</thead>

										<tbody>

											<c:set var="i" value="0" />
											<c:forEach var="diary" items="${list}">
												<c:set var="i" value="${ i+1 }" />
												<tr class="getDetail">
													<td align="left"><input name="deleteDiary"
														type="checkbox" value="${diary.diaryNo}" /></td>
													<td align="left">${ i }</td>
													<td align="left">${diary.userCategoryNo}</td>
													<td align="left" data-param1="${diary.diaryNo}">${diary.diaryTitle}</td>
													<td align="left">${diary.diaryDate }</td>
												</tr>
											</c:forEach>

										</tbody>

									</table>
									<!--  table End /////////////////////////////////////-->
									<div class="form-group">
										<div class="col-sm-offset-4  col-sm-4 text-left"
											style="float: left;">
											<button type="button" name="delete" class="btn btn-primary"
												onclick="fncDeleteDiary();">����</button>
										</div>
										<div class="col-sm-offset-4  col-sm-4 text-right"
											style="float: right;">
											<button type="button" name="add" class="btn btn-primary"
												id="addDiary" onclick="fncAddDiary();">�۾���</button>
										</div>
									</div>
									
								</form>
							<jsp:include page="../common/pageNavigator.jsp" />
						</div>					
					</div>
				</div>
				
			</div>

		</div>

	</div>



	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
	<!-- PageNavigation Start... -->

	<jsp:include page="/common/footer.jsp"></jsp:include>

</body>
</html>