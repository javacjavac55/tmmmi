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

/* Ŭ���� ��� */
		 	#btmmmi {
				position: absolute  !important;
			    height: 220px;
			    right:90px;
			    color: #fff;
			    cursor: pointer;
			}	
			/*Ŭ���� ��� */
		 	#atmmmi {
				position: absolute;
			    height: 360px;
			    right:-170px;
			    color: #fff;
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
		$(function() {
			swal({
				title : "��ϿϷ� " , 
				text: "�ڽŰ��� ����� ��� ��Ű�ñ� �ٶ��ϴ�!" , 
				icon : "success" , 
			}).then((value) => {
				$(".addform").attr("method", "POST").attr("action", "/todo/addToDo").submit();
			});
		})
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
			$('#dd4').datepicker( "option", "minDate", start );
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
			$(function() {
				swal({
					title : "�����Ϸ� " , 
					text: "������ �Ϸ�Ǿ����ϴ�." , 
					icon : "success" , 
				}).then((value) => {
					$(".updateform").attr("method", "POST").attr("action","/todo/updateToDo").submit();
				});
			})
		});
		////////////////////////////////////�� �� ����/////////////////////////////////////////
		$(document).on('click',".deletebtn", function() {
			var deleteToDoNo = $(this).data("dtodono");
			console.log(deleteToDoNo);
			swal({title: "�� ���� �����Ͻðڽ��ϱ�?",
					  text: "�� �� �Ϸ� ��ϵ� �����Ǹ� �ٽ� �ǵ��� �� �����ϴ�.",
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
									title : "�����Ϸ� " , 
									text: "�Ϸ�� ���ϵ� ��� �����Ǿ����ϴ�." , 
									icon : "success" , 
								}).then((value) => {
									$('.tl'+deleteToDoNo).remove();
								});
							})
						})//end of ajax
					}
				}, function (dismiss) { })
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
				}
			})
		})
		//////////////////////////////////////////////��¥ �̵�//////////////////////////////////////////////////////
		$(document).on('click',"#search", function() {
			$(".currentdateform").attr("method", "POST").attr("action","/todo/getToDoList").submit();
		})
		$( function() {
			var dateFormat = "yy-mm-dd"
			from = $("#dd1").datepicker(
		        {
		        	 firstDay: 1,
		             dateFormat: "yy-mm-dd",
		             defaultDate: targetdate,
		             monthNames: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
		             monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
		             dayNames: ['��', '��', 'ȭ', '��', '��', '��', '��'],
		             dayNamesShort: ['��', '��', 'ȭ', '��', '��', '��', '��'],
		             dayNamesMin: ['��', '��', 'ȭ', '��', '��', '��', '��'],
		             showMonthAfterYear: true,
		             yearSuffix: '��',
		             changeYear: true,
		             changeMonth: true
		        }).on( "change", function() {
		            to.datepicker( "option", "minDate", getDate( this ) );
		        }),
		        to = $("#dd2").datepicker(
		        {
		        	 firstDay: 1,
		             dateFormat: "yy-mm-dd",
		             monthNames: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
		             monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
		             dayNames: ['��', '��', 'ȭ', '��', '��', '��', '��'],
		             dayNamesShort: ['��', '��', 'ȭ', '��', '��', '��', '��'],
		             dayNamesMin: ['��', '��', 'ȭ', '��', '��', '��', '��'],
		             showMonthAfterYear: true,
		             yearSuffix: '��',
		             changeYear: true,
		             changeMonth: true,
		        }).on( "change", function() {
		            from.datepicker( "option", "maxDate", getDate( this ) );
		        });
			function getDate( element ) {
			      var date;
			      try {
			        date = $.datepicker.parseDate( dateFormat, element.value );
			      } catch( error ) {
			        date = null;
			      }
			      return date;
			    }
		})
		$( function() {
			$("#dd4").datepicker({
			        	 firstDay: 1,
			             dateFormat: "yy-mm-dd",
			             monthNames: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
			             monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
			             dayNames: ['��', '��', 'ȭ', '��', '��', '��', '��'],
			             dayNamesShort: ['��', '��', 'ȭ', '��', '��', '��', '��'],
			             dayNamesMin: ['��', '��', 'ȭ', '��', '��', '��', '��'],
			             showMonthAfterYear: true,
			             yearSuffix: '��',
			             changeYear: true,
			             changeMonth: true
			        });
		})
	});///onready
	
////////////////////////////////Ŭ�������
	$(document).ready(function() {	    	
    	// ���� css���� �÷��� ��� ��ġ(top)���� ������ �����Ѵ�.
    	//var floatPosition = parseInt($("#floatdiv").css('top')); 
    	// 250px �̷������� �������Ƿ� ���⼭ ���ڸ� �����´�. parseInt( �� );
    	//������ ��䷸�� �ߴµ� ��ġ�� �ű�鼭 top�� �ʹ� ª������ ��
    	
    	//�⺻������
    	$("#atmmmi").hide();
     
    	$(window).scroll(function() {
    		// ���� ��ũ�� ��ġ�� �����´�.
    		var scrollTop = $(window).scrollTop();
    		var newPosition = scrollTop +/*  floatPosition +*/ 92+"px";

    		$('#btmmmi').stop().animate({
    			"top" : newPosition
    		}, 500);
    	}).scroll();    
    });

	////////////////////////////////�߰��� ���
	function fncWeather() {	
		
		if($("#atmmmi").is(":visible")){
			$("#atmmmi").hide();
		}else{
			$("#atmmmi").show();
		}
		
    	$(window).scroll(function() {
    		// ���� ��ũ�� ��ġ�� �����´�.
    		var scrollTop = $(window).scrollTop();
    		var newPosition = scrollTop +/*  floatPosition +*/ 60+"px";

	    	$("#atmmmi").stop().animate({
    			"top" : newPosition
    		}, 500);
    	}).scroll();
    }




	
	////////////////////////////////top ��ư
    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 300) {
                $('#arrow').fadeIn();
            } else {
                $('#arrow').fadeOut();
            }
        });
        
        $("#arrow").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
    });
</script>
</head>
<body>
<body class="index-page sidebar-collapse">
	<!-- ���&���� ��� -->
   <jsp:include page="/todo/addToDo.jsp"></jsp:include> 
 <jsp:include page="/common/topMenu.jsp"></jsp:include> 
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
      
      <!-- ���� ��� -->
      <img name="btmmmi" id="btmmmi" src="/images/weather/btmmmi4.png" onclick="fncWeather()" data-toggle="tooltip" data-placement="left" title="������ ����" ></img>
      <iframe id="atmmmi" src="/widget/getWeather.jsp" style="border-color: rgb(0,0,0,0);"></iframe>
   
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
								             dayNames: ['��', '��', 'ȭ', '��', '��', '��', '��'],
								             dayNamesShort: ['��', '��', 'ȭ', '��', '��', '��', '��'],
								             dayNamesMin: ['��', '��', 'ȭ', '��', '��', '��', '��'],
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
					<h3 class="col-md-5 offset-0.5">���� �� ��
						<button class="btn btn-warning btn-fab btn-fab-mini btn-round"
							data-target="#todomodal" data-toggle="modal" style="" >
							<i class="material-icons">add</i>
						</button>
					</h3>
				</div>
				<div class="col-md-6">
				<h3 class="col-md-5 offset-0.5">�Ϸ�� �� ��</h3>
				</div>
			</div>
			<div class="row">
			<!-- ���� �� �� -->
				<div class="col-md-6 todolist" style="min-height:600px;">
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
				<p style=" font-size: small; font-style: italic;color: gray;text-align: right;">* ����� �޴����� �Ϸ� ������ ���� �׷����� Ȯ���� �� �ֽ��ϴ�.</p>
				</div>
				<img  id="arrow" src="/images/common/topIcon.png" width="2.5%" style="cursor:pointer;"/>
			</div>
		</div>
	</div>
 <jsp:include page="/common/footer.jsp"></jsp:include> 
</body>
</html>