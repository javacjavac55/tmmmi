<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���̾</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.js"></script>


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
<body>
	<div class="navbar  navbar-default">
		<div class="container">
			<a class="navbar-brand" href="/index.jsp">Tmmmi</a>
		</div>
	</div>

	<div style="width: 98%; margin-left: 10px;">
		<div class="container">
			<form name="detailForm">
				<input type="hidden" value="search" />


				<div class="page-header text-info">
					<h3>���̾ ���</h3>
				</div>

				<!-- table ���� �˻� Start /////////////////////////////////////-->
				<div class="row">

					<div class="col-md-6 text-left">
						<p class="text-primary">��ü ${resultPage.totalCount} �Ǽ�, ����
							${resultPage.currentPage} ������</p>
						<input type="hidden" id="currentPage" name="currentPage" value="" />
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
							<th align="left">ī�װ���ȣ</th>
							<th align="left">���̾ ����</th>
							<th align="left">�ۼ� ��¥</th>
						</tr>
					</thead>

					<tbody>

						<c:set var="i" value="0" />
						<c:forEach var="diary" items="${list}">
							<c:set var="i" value="${ i+1 }" />
							<tr class="getDetail">
								<td align="left"><input name="deleteDiary" type="checkbox"
									value="${diary.diaryNo}" /></td>
								<td align="left">${ i }</td>
								<td align="left">${diary.userCategoryNo}</td>
								<td align="left" data-param1="${diary.diaryNo}">${diary.diaryTitle}</td>
								<td align="left">${diary.diaryDate }</td>
							</tr>
						</c:forEach>

					</tbody>

					<tbody>
						<tr>
							<td align="left"><button type="button" name="delete"
									onclick="fncDeleteDiary();">����</button></td>
							<td></td>
							<td></td>
							<td></td>
							<td align="left"><button type="button" name="add"
									id="addDiary" onclick="fncAddDiary();">�۾���</button></td>
						</tr>
					</tbody>
				</table>

				<!--  table End /////////////////////////////////////-->
			</form>
		</div>
		<!--  ȭ�鱸�� div End /////////////////////////////////////-->
		<!-- PageNavigation Start... -->
		<jsp:include page="../common/pageNavigator.jsp" />
	</div>
</body>
</html>