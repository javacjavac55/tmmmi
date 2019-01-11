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
	function fncAddTodo() {
		console.log(1)
		var toDoDetail=$("input[name='toDoDetail']").val();
		var toDoStartDate=$("input[name='toDoStartDate']").val();
		var toDoEndDate=$("input[name='toDoEndDate']").val();
	
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
	}
	//�� �� ���
	$(function() {	
		$( "button.btn.btn-default" ).on("click" , function() {
			 fncAddTodo();
			$.ajax(
				{
				url:"/todoRest/addToDo", 
				method: 'POST',
				data: JSON.stringify({
					toDoDetail: $('#toDoDetail').val(),
	           		toDoStartDate: $('#toDoStartDate').val(),
	           		toDoEndDate: $('#toDoEndDate').val()}),
				contentType: 'application/json',
		        dataType : 'json'
			})
		})
	})
	//�� �� ����
	
	
	//�� �� üũ
/* 	var ToDay = new Date()

	var y = new Date(ToDay.getFullYear(),ToDay.getMonth(),ToDay.getDate() - 34)
	
	y.getFullYear() + "-" + (y.getMonth() +1 < 10? "0" +  (y.getMonth() +1): y.getMonth() +1 ) + "-" +
	
	(y.getDate() < 10? "0" +  y.getDate(): y.getDate())
	 */
	 
// datepicker function
$(function(){
        $("#toDoStartDate").datepicker({ dateFormat: 'yy-mm-dd' });
        $("#toDoEndDate").datepicker({ dateFormat: 'yy-mm-dd' }).bind("change",function(){
            var minValue = $(this).val();
            minValue = $.datepicker.parseDate("yy-mm-dd", minValue);
            minValue.setDate(minValue.getDate()+1);
            $("#to").datepicker( "option", "minDate", minValue );
        })
    });

</script>
</head>

<body>
<h2 style="margin:5px">���� �� �� ����</h2>
<form class="form-inline" name="todoform">
  <div class="form-group">
    <label for="toDoDetail">�� �� ����</label>
    <input type="text" class="form-control" id="toDoDetail" name="toDoDetail" placeholder="�� ���� �Է��ϼ���...." >
  </div>
  <div class="form-group">
    <label for="toDoStartDate">���� ��¥</label>
    <input type="text" class="form-control" id="toDoStartDate" name="toDoStartDate" placeholder="���� ��¥" autocomplete=off>
  </div>
  <div class="form-group">
    <label for="toDoEndDate">���� ��¥</label>
    <input type="text" class="form-control" id="toDoEndDate" name="toDoEndDate" placeholder="���� ��¥" autocomplete=off>
  </div>
  <button type="submit" class="btn btn-default">�߰�</button>
</form>
<div class="bs-example" data-example-id="hoverable-table">
    <table class="table table-hover">
      <thead>
        <tr>
          <th>��ȣ</th>
          <th>�� ��</th>
          <th>���� ��¥</th>
          <th>���� ��¥</th>
        </tr>
      </thead>
      <tbody>
        <tr id="toDo">
          <th scope="row">1</th>
          <td>��ħ �� �Ա�</td>
          <td>2019�� 01�� 01��</td>
          <td>2019�� 01�� 03�� </td>
          <td><button type="button" class="btn btn-primary" aria-label="Left Align">
  						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
  					</button>
					<button type="button" class="btn btn-danger" aria-label="Left Align">
  						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
  					</button>	  
		  </td>
        </tr>
      </tbody>
    </table>
  </div> 
<!-- <div id="myDIV" class="header">
  <h2 style="margin:5px">���� �� �� ����</h2>
  <input type="text" id="toDoInput" placeholder="�� ���� �Է��ϼ���....">
  <span onclick="newElement()" class="addBtn">�� �� �߰�</span>
   <input id="start_tododate" type="text" value="">
   <hr>
  <input id="end_tododate" type="text" value="">
</div>
<ul id="myUL">
  <li>Hit the gym</li>
  <li class="checked">Pay bills</li>
  
</ul> -->



</body>
</html>