<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
  <script>
//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)

	// �� �� ��� üũ
	function fncAddTodoCheck() {
		console.log(2)
		var toDoDetail = $(".form-control").val();
		var toDoStartDate = $(".form-control").val();
		var toDoEndDate = $(".form-control").val();
	
		if(toDoDetail == null || toDoDetail.length <1){
			alert("�� ���� ������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if(toDoStartDate == null || toDoStartDate.length <1){
			alert("�� ���� ���� ��¥�� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if(toDoEndDate == null || toDoEndDate.length <1){
			alert("�� ���� ���� ��¥��  �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		$("form").attr("method", "POST").attr("action","/todo/addToDo").submit();
	}
	
	//�� �� ���
	$(function() {	
		$( "#addToDobtn:contains('���')" ).on("click" , function() {
			fncAddTodoCheck();
		})
	});
	
	//�� �� ����
	 $(function() {
		
		$( ".btn.btn-primary.updateToDobtn" ).on("click" , function() {
			 var todoNo = $(this).data("param");
			 console.log(todoNo);
			$.ajax(
				{
				url:"/todoRest/updateToDo", 
				method: 'POST',
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data: JSON.stringify({
					toDoNo : todoNo,
					toDoDetail : $("#toDoDetail"+todoNo).val(),
	           		toDoStartDate: $("#toDoStartDate"+todoNo).val(),
	           		toDoEndDate: $("#toDoEndDate"+todoNo).val()
	           	}),
		        dataType : 'json',
		        success : $(function() {
		        					$("#todolist"+todoNo).toggleClass("hide");
									$("#retodolist"+todoNo).toggleClass("show");
									history.go(0)
		        })
			})
		})
	}) ;
	
	// �� �� ����
	$(function() {
		
		$( ".btn.btn-primary.updateToDobtn" ).on("click" , function() {
			 var todoNo = $(this).data("param");
			 console.log(todoNo);
			$.ajax(
				{
				url:"/todoRest/updateToDo", 
				method: 'POST',
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data: JSON.stringify({
					toDoNo : todoNo,
					toDoDetail : $("#toDoDetail"+todoNo).val(),
	           		toDoStartDate: $("#toDoStartDate"+todoNo).val(),
	           		toDoEndDate: $("#toDoEndDate"+todoNo).val()
	           	}),
		        dataType : 'json',
		        success : $(function() {
		        					$("#todolist"+todoNo).toggleClass("hide");
									$("#retodolist"+todoNo).toggleClass("show");
									history.go(0)
		        })
			})
		})
	}) ;
	// �� �� ���� ��ȯ��ư
	 $(function() {
			$(".btn.btn-primary.updateViewbtn").on("click", function() {
				var todoNo = $(this).data("param");
				$("#todolist"+todoNo).toggleClass("hide");
				$("#retodolist"+todoNo).toggleClass("show");
			})
	 });
	//�� �� üũ
/* 	var ToDay = new Date()

	var y = new Date(ToDay.getFullYear(),ToDay.getMonth(),ToDay.getDate() - 34)
	
	y.getFullYear() + "-" + (y.getMonth() +1 < 10? "0" +  (y.getMonth() +1): y.getMonth() +1 ) + "-" +
	
	(y.getDate() < 10? "0" +  y.getDate(): y.getDate())
	 */
	 
// datepicker ���
$(function(){
	
        $(".toDoStartDate, .updateToDo").datepicker({ dateFormat: 'yy-mm-dd' });
        $(".toDoEndDate, .updateToDo").datepicker({ dateFormat: 'yy-mm-dd' }).bind("change",function(){
            var minValue = $(this).val();
            minValue = $.datepicker.parseDate("yy-mm-dd", minValue);
            /* minValue.setDate(minValue.getDate()+1); */
            $("#toDoEndDate").datepicker( "option", "minDate", minValue );
        });
       
});
</script>
</head>

<body>
<!-- ��� -->
<div class="modal fade" id="todomodal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">�� �� ���</div>
      <div class="modal-body">
       <form class="form-inline" id="addToDo">
		  <div class="form-group">
		    <label for="toDoDetail">�� �� ����</label>
		    <input type="text" class="form-control" id="addToDoDetail" name="toDoDetail" placeholder="�� ���� �Է����ּ���" >
		  </div>
		  <div class="form-group">
		    <label for="toDoStartDate">���� ��¥</label>
		    <input type="text" class="form-control toDoStartDate" id="addToDoStartDate" name="toDoStartDate" placeholder="���� ��¥" autocomplete=off>
		  </div>
		  <div class="form-group">
		    <label for="toDoEndDate">���� ��¥</label>
		    <input type="text" class="form-control toDoEndDate" id="addToDoEndDate" name="toDoEndDate" placeholder="���� ��¥" autocomplete=off>
		  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">���</button>
        <button type="submit" class="btn btn-default" id="addToDobtn">���</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- ��� �� -->	
<!-- �� �� ����Ʈ -->
<div class="container">
<h2 style="margin:5px">���� �� �� ����</h2>
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#todomodal">�� �� ���</button>
    <div class="row">
        <div class="col-md-3"><strong>������ �� ��</strong></div>
        <div class="col-md-3"><strong>���� ��¥</strong></div>
        <div class="col-md-3"><strong>���� ��¥</strong></div>
        <div class="col-md-3"><strong>����/����</strong></div>
    </div>
    <c:forEach var="todo" items="${todolist}">
    <div class="row" id= "todolist${todo.toDoNo}">
    	<input type="hidden" class="todo col-md-3" value="${todo.toDoNo}">
        <div class="col-md-3">${todo.toDoDetail}</div>
        <div class="col-md-3">${todo.toDoStartDate}</div>
       <div class="col-md-3">${todo.toDoEndDate}</div>
        <div class="col-md-3"><button type="button" class="btn btn-primary updateViewbtn" aria-label="Left Align" data-param ="${todo.toDoNo}">
  													<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
  													</button>
													<button type="button" class="btn btn-danger" aria-label="Left Align">
  													<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
  													</button> 
  		</div>
    </div>
    <div class="row hide" id= "retodolist ${todo.toDoNo}">
    <div class="col-md-3"><input type="text" class="updateToDoDetail" name="toDoDetail"  id="toDoDetail${todo.toDoNo}" value="${todo.toDoDetail}"> </div>
    <div class="col-md-3"><input type="text" class="updateToDo" name="toDoStartDate"  id="toDoStartDate${todo.toDoNo}" value="${todo.toDoStartDate}" autocomplete=off ></div>
    <div class="col-md-3"><input type="text" class="updateToDo" name="toDoEndDate" id="toDoEndDate${todo.toDoNo}" value="${todo.toDoEndDate}" autocomplete=off ></div>
    <div class="col-md-3"><button type="button" class="btn btn-primary updateToDobtn" aria-label="Left Align" data-param ="${todo.toDoNo}">
  													<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
  													</button>
													<button type="button" class="btn btn-danger" aria-label="Left Align">
  													<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
  													</button> 
  		</div>
  	</div>
    </c:forEach>
</div>
<!-- �� �� ����Ʈ ��  -->
</body>
</html>