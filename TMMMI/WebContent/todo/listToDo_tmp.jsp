<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
  <title>TMMMI</title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--  Fonts and icons -->
  <!-- CSS Files -->
<!-- <link href="/css/template/material-kit.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"> -->
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>  -->
  <!-- Templete CSS -->
<!-- <link href="/css/template/material-kit.min.css?v=2.0.5" rel="stylesheet" /> -->
<!--   Core JS Files   -->
<!-- <script src="/javascript/template/core/popper.min.js" type="text/javascript"></script>
<script src="/javascript/template/core/bootstrap-material-design.min.js" type="text/javascript"></script> -->
<!--momentJS  -->
<!-- <script src="/javascript/moment/moment.js" type="text/javascript"></script> -->
<!-- Place this tag in your head or just before your close body tag. -->
<!-- <script async defer src="https://buttons.github.io/buttons.js"></script> -->
<!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
<!-- <script src="/javascript/template/material-kit.js?v=2.0.5" type="text/javascript"></script> -->
<!--     Fonts and icons     -->
<!-- <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" /> -->
<!-- sweetAlert -->
<!-- <script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script >
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script> -->
<!-- CSS Just for demo purpose, don't include it in your project -->
<!-- <link href="/css/template/demo.css" rel="stylesheet" /> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/datepicker/datepicker.css">
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
.todolist{
border-style: solid;
border-width: thin 10px;
border-right: 12px dotted;
border-radius: 0.2rem;
}
.completelist{
border-style: solid;
border-width: thin 10px;
border-left: 12px dotted;
border-radius: 0.2rem;
}
</style>
<script>
	var targetdate;
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
			$(".addform").attr("method", "POST").attr("action", "/todo/addToDo").submit();
			
		}
	
	$(function() {
		targetdate = '${targetDate}';
		$('#dd5').val(targetdate);
		
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
									 position: 'top-end',
									  type: 'success',
									  title: '�� ���� �����Ǿ����ϴ�.',
									  showConfirmButton: false,
									  timer: 1500
					})/* .then((result)=>{
						if (result.value) {
						    Swal.fire(
						      '�����Ǿ����ϴ�',
						      '�Ϸ�� �� �ϵ� ��� �����Ǿ����ϴ�',
						      'info',
						      
						    )} 
						})*/
					})
				})
			});
		/////////////////////////////////////// �� �� �Ϸ�(����)////////////////////////////////////////
		$(document).on('click',".completebtn", function() {
			targetdate = '${targetDate}';
			var ctodono = $(this).data("ctodono");
			console.log(ctodono);
			console.log(targetdate);
			$.ajax({
				url : "/todoRest/updateToDoComplete",
				method : 'POST',
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					toDoNo : ctodono,
					toDoCompleteDate : targetdate
				}),
				dataType : 'json',
				success : function(data) {
					console.log(data);
					$('.completelist').append('<ul class="list-group list-group-flush cl'+data.toDoNo+'">'+'<li class="list-group-item completeitem">'+'<button aria-label="Left Align" class="btn btn-success btn-fab btn-fab-mini completeDelbtn '+data.toDoNo+'"'
							+' data-ctodono="'+data.toDoNo+'"'
							+' data-completetodono="'+data.toDoCompleteNo+'"'
							+' data-dctododate="'+targetdate+'" type="button">' +'<i class="material-icons">check</i>'
							+'</button>'+'<div class="dtodoDetail'+data.toDoNo+'"><strike>'+data.toDoDetail+'</strike></div>' +'</li>' +'</ul>');
					$('.tl'+ctodono).remove();
					/* $('.completebtn.'+ctodono).attr('class','btn btn-success btn-fab btn-fab-mini completeDelbtn '+data);
					$('.ctodoDetail'+ctodono).attr('class','dtodoDetail'+ctodono); */
				}
			})
		})
		///////////////////////////////////�� �� �Ϸ� ����/////////////////////////////////////////
		$(document).on('click',".completeDelbtn", function() {
			targetdate = '${targetDate}';
			console.log(targetdate);
			var ctodono = $(this).data("ctodono");
			var completetodono = $(this).data("completetodono");
			console.log(completetodono);
			$.ajax({
				url : "/todoRest/deleteToDoComplete",
				method : 'POST',
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					toDoNo : ctodono,
					toDoCompleteNo : completetodono
				}),
				dataType : 'json',
				success : function(data) {
						console.log(data)
						console.log("1234");
						$('.todolist').append('<ul class="list-group list-group-flush tl'+data.toDoNo+'">'
															+'<li class="list-group-item todoitem">'
															+'<button aria-label="Left Align" class="btn btn-primary btn-fab btn-fab-mini completebtn '+data.toDoNo+'"'
															+'data-ctodono="'+data.toDoNo+'"'
															+'data-cpdate="'+targetdate+'"'
															+' type="button">'
															+'<i class="material-icons">check</i>'
															+'</button>'
															+'<div class="ctodoDetail'+data.toDoNo+'">'+data.toDoDetail+'</div>'
															+'<div class="no'+data.toDoNo+'" style="margin-left: 50px;">'
															+'<input class="todoNo" type="hidden" value="'+data.toDoNo+'">'
															+'<button aria-label="Left Align"'
															+'data-ctodono="'+data.toDoNo+'"'
															+'class="btn btn-primary btn-fab btn-fab-mini updateViewbtn"'
															+'data-detail="'+data.toDoDetail+'"'
															+'data-enddate="'+data.toDoEndDate+'"'
															+'data-startdate="'+data.toDoStartDate+'"'
															+'data-utodono="'+data.toDoNo+'"'
															+'data-target="#updatetodomodal"'
															+'data-toggle="modal" type="button">'
															+'<i class="material-icons">edit</i>'
															+'</button>'
															+'<button aria-label="Left Align" class="btn btn-primary btn-fab btn-fab-mini deletebtn" data-dtodono="'+data.toDoNo+'" type="button">'
															+'<i class="material-icons">clear</i>'
															+'</button>'
															+'</div>'
															+'</li>'
															+'</ul>');
						$('.cl'+data.toDoNo).remove();
					 /* $('.dtodoDetail'+data.toDoNo).html($('.dtodoDetail'+data.toDoNo).html().replace(/<(\/strike|strike)([^>]*)>/gi,""));  */
					/* $('.completeDelbtn.'+dctodono).attr('class','btn btn-primary btn-fab btn-fab-mini completebtn '+ctodono); */
				}
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
<script>
						var targetDay = '${targetDate}'.split("-");
					    $(function(){
					    	$("#datepicker").datepicker(
							    );
					        $(document).on('click', '#datepicker', function(){
					        }); 
					        $(document).on('click', '.ui-icon.ui-icon-circle-triangle-w', function(){
					        });
					        $(document).on('click', '.ui-icon.ui-icon-circle-triangle-e', function(){
					        });
					    })
						</script>
<style type="text/css">
</style>
</head>

<body class="index-page sidebar-collapse">
	<!-- ���&���� ��� -->
   <%-- <jsp:include page="/todo/addToDo.jsp"></jsp:include> --%>
<%-- <jsp:include page="/common/toolbar2.jsp"></jsp:include> --%>
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
						<input type="text" class="hasDatepicker" name="targetDate" value="${targetDate}" id="datepicker" style="font-size: large;"/>
							</div>
							<div class="col-md-2">
						<button
							class="btn btn-warning btn-fab btn-fab-mini btn-round search"
							id="search" type="submit">
							<i class="material-icons">search</i>
						</button>
						</div>
					</div>
					</div>
				</form>
				
			<div class="row">
				<div class="col-md-6">
					<h3 >���� �� ��
						<button class="btn btn-warning btn-fab btn-fab-mini btn-round"
							data-target="#todomodal" data-toggle="modal" style="">
							<i class="material-icons">add</i>
						</button>
					</h3>
				</div>
				<div class="col-md-6">
				<h3>�Ϸ�� �� ��</h3>
				</div>
			</div>
			<div class="row">
			<!-- ���� �� �� -->
				<div class="col-md-6 todolist" style="min-height:700px;">
					<c:forEach items="${todolist}" var="todo">
					<c:if test="${todo.toDoCompleteNo  eq 0}">
						<ul class="list-group list-group-flush tl${todo.toDoNo}">
							<li class="list-group-item todoitem">
									<button aria-label="Left Align"
										class="btn btn-primary btn-fab btn-fab-mini completebtn ${todo.toDoNo}"
										data-ctodono="${todo.toDoNo}" 
										data-dctodono="${todo.toDoCompleteNo}"
										type="button">
										<i class="material-icons">check</i>
									</button>
										<div class="ctodoDetail${todo.toDoNo}">${todo.toDoDetail}</div>
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
						</c:if>
					</c:forEach>
				</div>
				<!-- �Ϸ�� �� �� ����Ʈ -->
				<div class="col-md-6 completelist">
					<c:forEach items="${todolist}" var="todo">
					<c:if test="${todo.toDoCompleteNo  ne 0}">
						<ul class="list-group list-group-flush cl${todo.toDoNo}">
							<li class="list-group-item completeitem">
								<button aria-label="Left Align"
									class="btn btn-success btn-fab btn-fab-mini completeDelbtn ${todo.toDoCompleteNo}"
									data-ctodono="${todo.toDoNo}"
									data-completetodono="${todo.toDoCompleteNo}"
									data-dctododate="${targetDate}" type="button">
									<i class="material-icons">check</i>
								</button>
								<div class="dtodoDetail${todo.toDoNo}"><strike>${todo.toDoDetail}</strike></div>
							</li>
						</ul>
						</c:if>
					</c:forEach>
				</div>
				</div>
				</div>
			</div>
		</div>
	</div>
  <%-- <jsp:include page="/common/footer.jsp"></jsp:include> --%>
</body>
</html>