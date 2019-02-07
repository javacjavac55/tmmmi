<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
  <title>Tmmmi</title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--  Fonts and icons -->
  <!-- CSS Files -->
<link href="/css/template/material-kit.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/css/template/demo.css" rel="stylesheet" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
  <!-- Templete CSS -->
<link href="/css/template/material-kit.min.css?v=2.0.5" rel="stylesheet" />
<!--   Core JS Files   -->
<script src="/javascript/template/core/jquery.min.js" type="text/javascript"></script>
<script src="/javascript/template/core/popper.min.js" type="text/javascript"></script>
<script src="/javascript/template/core/bootstrap-material-design.min.js" type="text/javascript"></script>
<!--momentJS  -->
<script src="/javascript/moment/moment.js" type="text/javascript"></script>
<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
<script src="/javascript/template/material-kit.js?v=2.0.5" type="text/javascript"></script>
<!-- Datedropper SET-->
<link href="/css/datedropper/datedropper.css" rel="stylesheet"
	type="text/css" />
<script src="/javascript/datedropper/datedropper.js"></script>
<link href="/font/datedropper/datedropper.woff" rel="stylesheet" type="text/css" />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<!-- sweetAlert -->
<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script >
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/css/template/demo.css" rel="stylesheet" />
<!-- Style CSS-->
<style type="text/css">
button, h3 {
	font-family: "Nanum Gothic", sans-serif;
}
span {
	position: relative;
	display: block;
	cursor: pointer;
	color: black !important;
}

span:hover:before {
	background: #000000;
	width: 100%;
	transition: width 0.5s cubic-bezier(0.22, 0.61, 0.36, 1);
}
.hide {
	display: none;
}
.todaylist{
border-style: solid;
border-width: thin 10px;
border-right: 12px dotted;
border-radius: 0.2rem;
}
.tomorrowlist{
border-style: solid;
border-width: thin 10px;
border-left: 12px dotted;
border-radius: 0.2rem;
}
</style>
<script>
	$(function() {
		// ///////////////////////////////// �� �� ��� üũ///////////////////////////////////////
		function fncAddTodoCheck() {
		var toDoDetail = $(".form-control.1").val();
		var toDoStartDate = $(".form-control.2").val();
		var toDoEndDate = $(".form-control.3").val();
		if (toDoDetail == null || toDoDetail.length < 1) {
			alert("�� ���� ������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if (toDoStartDate == null || toDoStartDate.length < 1) {
			alert("�� ���� ���� ��¥�� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if (toDoEndDate == null || toDoEndDate.length < 1) {
			alert("�� ���� ���� ��¥��  �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		$(function() {
			$(".addform").attr("method", "POST")
					.attr("action", "/todo/addToDo").submit();
			})
		}
		/////////////////////////////// �� �� ���//////////////////////////////////////
		$(document).on('click',"#addToDobtn:contains('���')", function() {
			fncAddTodoCheck()
			});
		
		/////////////////////////////////�� �� ���� ����������//////////////////////////////////////
		$(document).on('click',".updateViewbtn", function() {
			var no = $(this).data("utodono");
			var detail = $(this).data("detail");
			var start = $(this).data("startdate");
			var end = $(this).data("enddate");
			$("#updateToDoNo").val(no);
			$('#updateToDoDetail').val(detail);
			$('#dd3').val(start);
			$('#dd4').val(end);
			});
		///////////////////////////////�� �� ����/////////////////////////////////////////
		$(document).on('click',"#updateToDobtn:contains('����')", function() {
			var toDoDetail = $(".form-control.4").val();
			var toDoStartDate = $(".form-control.5").val();
			var toDoEndDate = $(".form-control.6").val();
			if (toDoDetail == null || toDoDetail.length < 1) {
				alert("�� ���� ������ �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if (toDoStartDate == null || toDoStartDate.length < 1) {
				alert("�� ���� ���� ��¥�� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if (toDoEndDate == null || toDoEndDate.length < 1) {
				alert("�� ���� ���� ��¥��  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			$(".updateform").attr("method", "POST").attr("action","/todo/updateToDo").submit();
		});
		////////////////////////////////////�� �� ����/////////////////////////////////////////
		$(document).on('click',".deletebtn", function() {
			var deleteToDoNo = $(this).data("dtodono");
			console.log(deleteToDoNo);
			$.ajax({
				url : "/todoRest/deleteToDo",
				method : 'POST',
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					toDoNo : deleteToDoNo
				}),
				dataType : 'json',
				success : $(function() {
				Swal.fire({
								  title: '�� ���� �����Ͻðڽ��ϱ�?',
								  text: "ȸ������ ����� �� ���� �Ϸᰡ ��� �����˴ϴ�",
								  type: 'warning',
								  showCancelButton: true,
								  confirmButtonColor: '#3085d6',
								  cancelButtonColor: '#d33',
								  confirmButtonText: '�� �����ҷ���!',
								  cancelButtonText: '�ƴϿ� ���ε���!',
					}).then((result)=>{
						if (result.value) {
						    Swal.fire(
						      '�����Ǿ����ϴ�',
						      '�Ϸ�� �� �ϵ� ��� �����Ǿ����ϴ�',
						      'info')}
						      console.log(deleteToDoNo);
								$('.list-group.list-group-flush.'+deleteToDoNo).remove();
						})
						
					})
				})
			});
		/////////////////////////////////////// �� �� �Ϸ�(����)////////////////////////////////////////
		$(document).on('click',".btn.btn-primary.btn-fab.btn-fab-mini.completebtn", function() {
			var ctodono = $(this).data("ctodono");
			var cpdate = $(this).data("cpdate");
			console.log(ctodono);
			console.log(cpdate);
			$.ajax({
				url : "/todoRest/updateToDoComplete",
				method : 'POST',
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					toDoNo : ctodono,
					toDoCompleteDate : cpdate
				}),
				dataType : 'json',
				success : function(data) {
					console.log(data);
					$('.ctodoDetail'+ctodono).html($('.ctodoDetail'+ctodono).text().strike());
					$('.completebtn.'+ctodono).attr('class','btn btn-success btn-fab btn-fab-mini completeDelbtn '+data);
					$('.ctodoDetail'+ctodono).attr('class','dtodoDetail'+ctodono);
				}
			})
		})
		///////////////////////////////////�� �� �Ϸ� ���/////////////////////////////////////////
		$(document).on('click',".btn.btn-success.btn-fab.btn-fab-mini.completeDelbtn", function() {
			var dctodono = $(this).data("dctodono");
			var ctodono = $(this).data("ctodono");
			console.log(dctodono);
			$.ajax({
				url : "/todoRest/deleteToDoComplete",
				method : 'POST',
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					toDoCompleteNo : dctodono
				}),
				dataType : 'json',
				success : $(function() {
					 $('.dtodoDetail'+ctodono).html($('.dtodoDetail'+ctodono).html().replace(/<(\/strike|strike)([^>]*)>/gi,"")); 
					$('.completeDelbtn.'+dctodono).attr('class','btn btn-primary btn-fab btn-fab-mini completebtn '+ctodono);
				})
			})
		})
		//////////////////////////////////////////////////effect////////////////////////////////////////////////////
		/* $(document).on('mouseenter',".list-group.list-group-flush", function() {
			var todoNo = $(this).data("todono");
			$(".no" + todoNo).show();	
		});
		$(document).on('mouseleave',".list-group.list-group-flush",function() {
			var todoNo = $(this).data("todono");
			$(".no" + todoNo).hide();
		}); */
		//////////////////////////////////////////////��¥ �̵�//////////////////////////////////////////////////////
		$(document).on('click',"#search", function() {
			$(".currentdateform").attr("method", "POST").attr("action","/todo/getToDoList").submit();
		})
	});///onready
</script>
<style type="text/css">
</style>
</head>

<body class="index-page sidebar-collapse">
	<!-- ���&���� ��� -->
   <jsp:include page="/todo/addToDo.jsp"></jsp:include>
<jsp:include page="/common/toolbar2.jsp"></jsp:include>
  <div class="page-header header-filter clear-filter" data-parallax="true" style="background-image: url('/images/userSetting/ ${userSetting.image}')">
    <div class="container">
      <div class="row">
        <div class="col-md-8 ml-auto mr-auto">
          <div class="brand">
            <h2 class="title">ToDo List</h2>
            <h3 class="title">Take care of yourself</h3>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="main main-raised">
    <div class="section section-basic">
	<!-- �� �� ����Ʈ -->
	<div class="container">
		<div class="list">
			<form class="currentdateform" action="">
				<div class="form-group" style="margin-left:80%;">
				<div class="row">
						<div class="col-md-6">
						<input type="text" class="form-control" name="toDoStartDate"
							value="${displaydate}" data-format="Y-m-d" id="dd5" data-large-only="true" style="background-color:#ffffff;font-size: large;">
							</div>
							<div class="col-md-2">
						<button
							class="btn btn-warning btn-fab btn-fab-mini btn-round search"
							id="search" type="submit">
							<i class="material-icons">search</i>
						</button>
						</div>
						<script>
							$('#dd5').dateDropper();
						</script>
					</div>
					</div>
				</form>
				
			<div class="row">
				<div class="col-md-6">
					<h3 >������ �� ��
						<button class="btn btn-warning btn-fab btn-fab-mini btn-round"
							data-target="#todomodal" data-toggle="modal" style="">
							<i class="material-icons">add</i>
						</button>
					</h3>
				</div>
				<div class="col-md-6">
				<h3>������ �� ��</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 todaylist" style="min-height:700px;">
					<c:forEach items="${todolist}" var="todo">
						<ul class="list-group list-group-flush  ${todo.toDoNo}"
							data-todono="${todo.toDoNo}">
							<li class="list-group-item">
							<c:if test="${todo.toDoCompleteNo  eq 0}">
									<button aria-label="Left Align"
										class="btn btn-primary btn-fab btn-fab-mini completebtn ${todo.toDoNo}"
										data-ctodono="${todo.toDoNo}" 
										data-dctodono="${todo.toDoCompleteNo}"
										data-cpdate="${targetDate}"
										type="button">
										<i class="material-icons">check</i>
									</button>
								</c:if> 
								<c:if test="${todo.toDoCompleteNo  ne 0}">
									<button aria-label="Left Align"
										class="btn btn-success btn-fab btn-fab-mini completeDelbtn ${todo.toDoCompleteNo}"
										data-ctodono="${todo.toDoNo}"
										data-dctodono="${todo.toDoCompleteNo}" type="button">
										<i class="material-icons">check</i>
									</button>
								</c:if> 
								 <c:if test="${todo.toDoCompleteNo eq 0}">
										<div class="ctodoDetail${todo.toDoNo}">${todo.toDoDetail}</div>
								</c:if>
								<c:if test="${todo.toDoCompleteNo  ne 0}">
									<div class="dtodoDetail${todo.toDoNo}"><strike>${todo.toDoDetail}</strike></div>
								</c:if>
								<div class="no${todo.toDoNo}" style="margin-left: 50px;">
									<input class="todoNo" type="hidden" value="${todo.toDoNo}">
									<button aria-label="Left Align"
										class="btn btn-primary btn-fab btn-fab-mini updateViewbtn"
										data-detail="${todo.toDoDetail}"
										data-enddate="${todo.toDoEndDate}"
										data-startdate="${todo.toDoStartDate}"
										data-utodono="${todo.toDoNo}" data-target="#updatetodomodal"
										data-toggle="modal" type="button">
										<i class="material-icons">edit</i>
									</button>
									<button aria-label="Left Align"
										class="btn btn-primary btn-fab btn-fab-mini deletebtn"
										data-dtodono="${todo.toDoNo}" type="button">
										<i class="material-icons">clear</i>
									</button>
								</div>
							</li>
						</ul>
					</c:forEach>
				</div>
				<div class="col-md-6 tomorrowlist">
					<c:forEach items="${nextlist}" var="todo">
						<ul class="list-group list-group-flush  ${todo.toDoNo}"
							data-todono="${todo.toDoNo}">
							<li class="list-group-item">
							<c:if test="${todo.toDoCompleteNo  eq 0}">
									<button aria-label="Left Align"
										class="btn btn-primary btn-fab btn-fab-mini completebtn ${todo.toDoNo}"
										data-ctodono="${todo.toDoNo}" 
										data-dctodono="${todo.toDoCompleteNo}"
										data-cpdate="${targetDate}"
										type="button">
										<i class="material-icons">check</i>
									</button>
								</c:if> 
								<c:if test="${todo.toDoCompleteNo  ne 0}">
									<button aria-label="Left Align"
										class="btn btn-success btn-fab btn-fab-mini completeDelbtn ${todo.toDoCompleteNo}"
										data-ctodono="${todo.toDoNo}"
										data-dctodono="${todo.toDoCompleteNo}" type="button">
										<i class="material-icons">check</i>
									</button>
									</c:if> 
								<div class="ctodoDetail${todo.toDoNo}">${todo.toDoDetail}</div>
							</li>
						</ul>
					</c:forEach>
				</div>
				</div>
				</div>
			</div>
		</div>
	</div>
  <jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>