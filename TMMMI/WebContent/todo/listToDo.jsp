<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
	<title>TMMMI</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  
<!-- JQuery & Datepicker-->
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/datepicker/datepicker.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>
<!-- material-kit -->
<link href="/css/template/material-kit.css" rel="stylesheet" />
<link href="/css/template/material-kit.min.css?v=2.0.5" rel="stylesheet" />

<script src="/javascript/template/core/bootstrap-material-design.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- SweetAlert -->
<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script >

<link href="/css/template/demo.css" rel="stylesheet" /> 

<style type="text/css">
button, h3 {
	font-family: "Nanum Gothic", sans-serif;
}
.hide {
	display: none;
}
.list-group-flush{
border : none;
transition: 0.3s;
}
.list-group-flush:hover{
border : none;
box-shadow: 5px 5px 20px purple;
}
</style>
<script>
	var targetdate;
	// ///////////////////////////////// 할 일 등록 체크///////////////////////////////////////
	function fncAddTodoCheck() {
		var toDoDetail = $(".form-control.1").val();
		var toDoStartDate = $(".form-control.2").val();
		var toDoEndDate = $(".form-control.3").val();
		if (toDoDetail == null || toDoDetail.length < 1) {
			alert("할 일의 내용은 반드시 입력하셔야 합니다.");
			return;
		}
		if (toDoStartDate == null || toDoStartDate.length < 1) {
			alert("할 일의 시작 날짜는 반드시 입력하셔야 합니다.");
			return;
		}
		if (toDoEndDate == null || toDoEndDate.length < 1) {
			alert("할 일의 종료 날짜는  반드시 입력하셔야 합니다.");
			return;
		}
		$(function() {
			swal({
				title : "등록완료 " , 
				text: "자신과의 약속을 모두 지키시길 바랍니다!" , 
				icon : "success" , 
			}).then((value) => {
				$(".addform").attr("method", "POST").attr("action", "/todo/addToDo").submit();
			});
		})
	}
	$(function() {
		targetdate = '${targetDate}';
		$('#dd5').val(targetdate);
		
		/////////////////////////////// 할 일 등록//////////////////////////////////////
		$(document).on('click',"#addToDobtn:contains('등록')", function() {
			fncAddTodoCheck()
			});
		
		/////////////////////////////////할 일 수정 데이터전송//////////////////////////////////////
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
		///////////////////////////////할 일 수정/////////////////////////////////////////
		$(document).on('click',"#updateToDobtn:contains('수정')", function() {
			var toDoDetail = $(".form-control.4").val();
			var toDoStartDate = $(".form-control.5").val();
			var toDoEndDate = $(".form-control.6").val();
			if (toDoDetail == null || toDoDetail.length < 1) {
				alert("할 일의 내용은 반드시 입력하셔야 합니다.");
				return;
			}
			if (toDoStartDate == null || toDoStartDate.length < 1) {
				alert("할 일의 시작 날짜는 반드시 입력하셔야 합니다.");
				return;
			}
			if (toDoEndDate == null || toDoEndDate.length < 1) {
				alert("할 일의 종료 날짜는  반드시 입력하셔야 합니다.");
				return;
			}
			$(function() {
				swal({
					title : "수정완료 " , 
					text: "수정이 완료되었습니다." , 
					icon : "success" , 
				}).then((value) => {
					$(".updateform").attr("method", "POST").attr("action","/todo/updateToDo").submit();
				});
			})
		});
		////////////////////////////////////할 일 삭제/////////////////////////////////////////
		$(document).on('click',".deletebtn", function() {
			var deleteToDoNo = $(this).data("dtodono");
			console.log(deleteToDoNo);
			swal({title: "할 일을 삭제하시겠습니까?",
					  text: "할 일 완료 목록도 삭제되며 다시 되돌릴 수 없습니다.",
					  icon: "warning",
					 buttons: true,
					 value: true,
				}).then((result)=>{
					if (result === true) {
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
								swal({
									title : "삭제완료 " , 
									text: "완료된 할일도 모두 삭제되었습니다." , 
									icon : "success" , 
								}).then((value) => {
									$('.tl'+deleteToDoNo).remove();
								});
							})
						})//end of ajax
					}
				}, function (dismiss) { })
		});
		/////////////////////////////////////// 할 일 완료(현재)////////////////////////////////////////
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
					
				}
			})
		})
		///////////////////////////////////할 일 완료 삭제/////////////////////////////////////////
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
				}
			})
		})
		//////////////////////////////////////////////날짜 이동//////////////////////////////////////////////////////
		$(document).on('click',"#search", function() {
			$(".currentdateform").attr("method", "POST").attr("action","/todo/getToDoList").submit();
		})
	});///onready
</script>
</head>
<body>
<body class="index-page sidebar-collapse">
	<!-- 등록&수정 모달 -->
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
	<!-- 할 일 리스트 -->
	<div class="container">
		<div class="list">
			<form class="currentdateform" action="">
				<div class="form-group" style="margin-left:80%;">
				<div class="row">
						<div class="col-md-6">
						<input type="text" id="datepicker" class="form-control" name="targetDate" value="${targetDate}" autocomplete="off" style="font-size:large;"/>
						<script>
									var targetdate = '${targetDate}';
								    $("#datepicker").datepicker(
								        {
								        	 firstDay: 1,
								             dateFormat: "yy-mm-dd",
								             defaultDate: targetdate,
								             monthNames: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
								             monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
								             dayNames: ['일', '월', '화', '수', '목', '금', '토'],
								             dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
								             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
								             showMonthAfterYear: true,
								             changeYear: true,
								             changeMonth: true
								        }
								    );
								</script>
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
					<h3 class="col-md-5 offset-0.5">나의 할 일
						<button class="btn btn-warning btn-fab btn-fab-mini btn-round"
							data-target="#todomodal" data-toggle="modal" style="" >
							<i class="material-icons">add</i>
						</button>
					</h3>
				</div>
				<div class="col-md-6">
				<h3 class="col-md-5 offset-0.5">완료된 할 일</h3>
				</div>
			</div>
			<div class="row">
			<!-- 나의 할 일 -->
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
				<!-- 완료된 할 일 리스트 -->
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
 <jsp:include page="/common/footer.jsp"></jsp:include> 
</body>
</html>