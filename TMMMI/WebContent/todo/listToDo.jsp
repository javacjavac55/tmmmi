<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
<meta content="width=device-width, initial-scale=1" name="viewport">

<!-- ChartJS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<!-- Templete CSS -->
<link href="/css/template/material-kit.min.css?v=2.0.5" rel="stylesheet" />
<!--   Core JS Files   -->
<script src="/javascript/template/core/jquery.min.js"
	type="text/javascript"></script>
<script src="/javascript/template/core/popper.min.js"
	type="text/javascript"></script>
<script src="/javascript/template/core/bootstrap-material-design.min.js"
	type="text/javascript"></script>
<!--momentJS  -->
<script src="/javascript/moment/moment.js" type="text/javascript"></script>
<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
<script src="/javascript/template/material-kit.js?v=2.0.5"
	type="text/javascript"></script>
<!-- Datedropper SET-->
<link href="/css/datedropper/datedropper.css" rel="stylesheet"
	type="text/css" />
<script src="/javascript/datedropper/datedropper.js"></script>
<link href="/font/datedropper/datedropper.woff" rel="stylesheet"
	type="text/css" />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean"
	rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
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

.container {
	padding: 5%;
}

.hide {
	display: none;
}
</style>
<script>
	// ==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	// ///////////////////////////////// �� �� ��� üũ///////////////////////////////////////
	function fncAddTodoCheck() {
		console.log(2)
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
			$(".addform").attr("method", "POST").attr("action", "/todo/addToDo")
					.submit();
		})
	}
	// ////////////////////////////// �� �� ���//////////////////////////////////////
	$(function() {
		$("#addToDobtn:contains('���')").on("click", function() {
			fncAddTodoCheck();
		})
	});
	// ///////////////////////////////////// �� �� ���� ��ȯ��ư////////////////////////////////
	/* $(function() {
		$(".btn.btn-primary.updateViewbtn").on("click", function() {
			var todoNo = $(this).data("utodonov");
			var today = new Date();
			var start = new Date($(this).data("startdate"));
			var end = new Date($(this).data("enddate"));
			 var picker2 = tui.DatePicker.createRangePicker({
			    startpicker: {
			        input: '#addToDoStartDate' + todoNo,
			        container: '#startpicker-container' + todoNo
			    },
			    endpicker: {
			        date: today,
			        input: '#addToDoEndDate' + todoNo,
			        container: '#endpicker-container' + todoNo
			    }
			});
			picker2.setStartDate(start);
			picker2.setEndDate(end);
		})
	}); */
	// /////////////////////////////// �� �� ����/////////////////////////////////////
	/* $(function() {
		$(".btn.btn-primary.updateToDobtn").on(
				"click",
				function() {
					var todoNo = $(this).data("utodono");
					console.log(todoNo);
					$.ajax({
						url : "/todoRest/updateToDo",
						method : 'POST',
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						data : JSON.stringify({
							toDoNo : todoNo,
							toDoDetail : $("#toDoDetail" + todoNo).val(),
							toDoStartDate : $("#addToDoStartDate" + todoNo)
									.val(),
							toDoEndDate : $("#addToDoEndDate" + todoNo).val()
						}),
						dataType : 'json',
						success : $(function() {
							$("#todolist" + todoNo + " > div ").eq(0).text(
									$("#toDoDetail" + todoNo).val());
							$("#todolist" + todoNo + " > div ").eq(1).text(
									$("#addToDoStartDate" + todoNo).val());
							$("#todolist" + todoNo + " > div ").eq(2).text(
									$("#addToDoEndDate" + todoNo).val());
							$("#retodolist" + todoNo).hide();
							$("#todolist" + todoNo).show();
							// history.go(0);
						})
					})
				})
	}); */
	$(function() {
		$("#updateToDobtn:contains('����')").on(
				"click",
				function() {
					$("updateform").attr("method", "POST").attr("action",
							"/todo/updateToDo").submit();
				})
	});

	// ///////////////////////////////////�� �� ����/////////////////////////////////////////
	$(function() {
		$(".deletebtn").on("click", function() {
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
					history.go(0);
				})
			})
		})
	});
	// ///////////////////////////////////// �� �� �Ϸ�////////////////////////////////////////
	$(function() {
		$(".completebtn").click(function() {
			var ctodono = $(this).data("ctodono");
			var Now = new Date();
			var NowTime = Now.getFullYear();
			NowTime += '-' + Now.getMonth() + 1;
			NowTime += '-' + Now.getDate();
			console.log(ctodono);
			console.log(NowTime);
			$.ajax({
				url : "/todoRest/updateToDoComplete",
				method : 'POST',
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					toDoNo : ctodono,
					toDoCompleteDate : NowTime
				}),
				dataType : 'json',
				success : $(function() {
					history.go(0);
				})
			})
		})
	});
	// /////////////////////////////////�� �� �Ϸ� ���/////////////////////////////////////////
	$(function() {
		$(".btn.btn-danger.completeDelbtn").click(function() {
			var dctodono = $(this).data("dctodono");
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
					history.go(0);
				})
			})
		})
	});
	//effect
	$(function() {

		$(".list-group.list-group-flush").hover(function() {
			var todoNo = $(this).data("todono");
			console.log(todoNo);
			/* $(".no"+todoNo).attr('style', 'display:inline'); */
			$(".no"+ todoNo).show();
		}, function() {
			console.log("1234");
			var todoNo = $(this).data("todono");
			/* $(".no"+ todoNo).attr('style', 'display:none'); */
			$(".no"+ todoNo).hide(100);
		});
		/* 
		$("#todolist" + todoNo).hide();
		 */
	})
	// �� �� üũ
	/* 	var ToDay = new Date()

	var y = new Date(ToDay.getFullYear(),ToDay.getMonth(),ToDay.getDate() - 34)

	y.getFullYear() + "-" + (y.getMonth() +1 < 10? "0" +  (y.getMonth() +1): y.getMonth() +1 ) + "-" +

	(y.getDate() < 10? "0" +  y.getDate(): y.getDate())
	 */
</script>
</head>
<body>
	<!-- ��� ��� -->
	<div class="modal fade" id="todomodal" role="" tabindex="-1">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="card card-plain">
					<div class="modal-header">
						<div class="card-header card-header-text card-header-primary">
							<button aria-hidden="true" class="close" data-dismiss="modal"
								type="button">
								<i class="material-icons">clear</i>
							</button>
							<h4 class="card-title">Add ToDo</h4>
						</div>
					</div>
				</div>
				<div class="modal-body">
					<form class="addform" method="" action="" id="addToDo">
						<p class="description text-center">����ִ� ����� ��� ����� ��Ű�� ����̴�
							-�ڸ�������-</p>
						<div class="card-body">
							<div class="form-group bmd-form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="material-icons">create</i>
										</div>
									</div>
									<input type="text" class="form-control 1" id="addToDoDetail"
										name="toDoDetail" placeholder="�� ���� �Է����ּ���">
								</div>
							</div>
							<div class="form-group bmd-form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="material-icons">calendar_today</i>
										</div>
									</div>
									<input type="text" class="form-control 2" name="toDoStartDate"
										data-format="Y-m-d" data-large-mode="true" id="dd1">
									<script>
										$('#dd1').dateDropper();
									</script>
								</div>
							</div>
							<div class="form-group bmd-form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="material-icons">flag</i>
										</div>
									</div>
									<input type="text" class="form-control 3" name="toDoEndDate"
										data-format="Y-m-d" data-large-mode="true"
										data-init-set="false" id="dd2">
									<script>
										$('#dd2').dateDropper();
									</script>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" data-dismiss="modal"
						type="button">���</button>
					<button class="btn btn-primary" id="addToDobtn" type="submit">���</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- ��� ��� �� -->
	
	<!--���� ��� -->
	<div class="modal fade" id="updatetodomodal" role="" tabindex="-1">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="card card-plain">
					<div class="modal-header">
						<div class="card-header card-header-text card-header-primary">
							<button aria-hidden="true" class="close" data-dismiss="modal"
								type="button">
								<i class="material-icons">clear</i>
							</button>
							<h4 class="card-title">Update ToDo</h4>
						</div>
					</div>
				</div>
				<div class="modal-body">
					<form class="form" method="" action="" id="addToDo">
						<p class="description text-center">����ִ� ����� ��� ����� ��Ű�� ����̴�
							-�ڸ�������-</p>
						<div class="card-body">
							<div class="form-group bmd-form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="material-icons">create</i>
										</div>
									</div>
									<input type="text" class="form-control" id="updateToDoDetail"
										name="toDoDetail" value="${todo.toDoDetail}">
								</div>
							</div>
							<div class="form-group bmd-form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="material-icons">calendar_today</i>
										</div>
									</div>
									<input type="text" class="form-control" name="toDoStartDate"
										data-format="Y-m-d" data-large-mode="true"  data-init-set="false" id="dd3">
									<script>
										$('#dd3').dateDropper();
									</script>
								</div>
							</div>
							<div class="form-group bmd-form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="material-icons">flag</i>
										</div>
									</div>
									<input type="text" class="form-control" name="toDoEndDate"
										data-format="Y-m-d" data-large-mode="true"
										data-init-set="false" id="dd4">
									<script>
										$('#dd4').dateDropper();
									</script>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" data-dismiss="modal"
						type="button">���</button>
					<button class="btn btn-primary" id="updateToDobtn" type="submit">����</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- ���� ��� �� -->
	<!-- �� �� ����Ʈ -->
	<div class="container">
		<div class="form-group">
		</div>
		<div class="list">
				<div class="card">
		          <div class="card-header card-header-text card-header-primary">
		            <div class="card-text">
		            <div class="row">
		            	<div class="col-md-6">
		              <h3 class="card-title">Today's Promise
					<button class="btn btn-warning btn-fab btn-fab-mini btn-round"
						data-target="#todomodal" data-toggle="modal" style="align=right;">
						<i class="material-icons">add</i>
					</button>
					</h3>
					</div>
					<div class="col-md-1">
					<button type="button" class="btn btn-warning btn-fab btn-round">
						<i class="material-icons">chevron_left</i>
					</button>
					</div>
					<form class="currentdateform" action="">
					<div class="col-md-3">
					<h4 id="currentday" style="margin-left: 30px;" ><input type="hidden" id="dayinput"></h4>
					</div>
					</form>
					<div class="col-md-1">
					<button type="button" class="btn btn-warning btn-fab btn-round">
						<i class="material-icons">chevron_right</i>
					</button>
					</div>
					</div>
          		</div>
          		</div>
         	 <div class="card-body">
			<c:forEach items="${todolist}" var="todo">
					<ul class="list-group list-group-flush" data-todono="${todo.toDoNo}">
							<li class="list-group-item">
							<c:if test="${todo.toDoCompleteNo  eq 0}">
								<button aria-label="Left Align"
									class="btn btn-primary btn-fab btn-fab-mini completebtn"
									data-ctodono="${todo.toDoNo}"
									data-dctodono="${todo.toDoCompleteNo}" type="button">
									<i class="material-icons">check</i>
								</button>
							</c:if>
								<c:if test="${todo.toDoCompleteNo  ne 0}">
									<button aria-label="Left Align"
									class="btn btn-success btn-fab btn-fab-mini completeDelbtn"
									data-ctodono="${todo.toDoNo}"
									data-dctodono="${todo.toDoCompleteNo}" type="button">
									<i class="material-icons">check</i>
									</button>
								</c:if>
								<c:if test="${todo.toDoCompleteNo eq 0}">
										${todo.toDoDetail}
								</c:if>
								<c:if test="${todo.toDoCompleteNo  ne 0}">
										<strike>${todo.toDoDetail}</strike>
								</c:if>
							<div class="no${todo.toDoNo} hide" style="margin-left: 50px;">
							<input class="todoNo" type="hidden" value="${todo.toDoNo}">
								<button aria-label="Left Align"
									class="btn btn-primary btn-fab btn-fab-mini updateViewbtn"
									data-enddate="${todo.toDoEndDate}"
									data-startdate="${todo.toDoStartDate}"
									data-utodonov="${todo.toDoNo}" data-target="#updatetodomodal"
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
		</div>
		</div>
	</div>
</body>
<script type="text/javascript">
		$(function() {
			var currentday = moment().format("YYYY�� MM�� DD��");
			var y;
			var ymd;
			$("#currentday").text(currentday);
			var currentday = moment();
			$("i:contains('chevron_right')").on("click", function () {
				currentday = currentday.add(1, 'days')
				 y = currentday.format("YYYY�� MM�� DD��");
				ymd = currentday.format("YYYY-MM-DD");
				 console.log(ymd);
				 $('#dayinput').val(ymd);
				 $(".currentdateform").attr("method", "POST").attr("action", "/todo/getToDoList")
					.submit();
				 $("#currentday").text(y);
			 })
			 $("i:contains('chevron_left')").on("click", function () {
				 currentday = currentday.add(-1, 'days')
				 y = currentday.format("YYYY�� MM�� DD��");
				 ymd = currentday.format("YYYY-MM-DD");
				 console.log(y);
				 $("#currentday").text(y);
			 })
			/*  $(".btn.btn-warning.btn-fab.btn-round").on("click",function(){
			 $.ajax({
                 url: "/todoRest/getToDoList",
                 method: 'POST',
                 headers: {
                     "Accept": "application/json",
                     "Content-Type": "application/json"
                 },
                 data: ymd,
                 dataType: 'json',
                 success: function (result) {
                 console.log(result);
                	  $( "ul" ).empty();
                	  $.each(result, function (i) {
                		  console.log(result[i].toDoDetail);
                		  $('.card-body').append('<ul>'),
                		  $('<ul>').append('<li>'+result[i].toDoDetail+'</li></ul>');
                	  })
                 }
             })
			 }) */
		 })
	</script>
</html>