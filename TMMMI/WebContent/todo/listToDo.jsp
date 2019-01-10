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
	//�� �� ���
	
	
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
			alert("�� ���� ���� ��¥  �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if(toDoEndDate == null || toDoEndDate.length <1){
			alert("�� ���� ���� ��¥ Ȯ����  �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		$.ajax(
			var param = $("form[name=form1]").serialize();
			{
			url:"/todoRest/addToDo", 
			method: 'POST',
			dataType : "String"
		})
		//$("form").attr("method" , "POST").attr("action" , "/todoRest/addToDo").submit();	
	}
	
	$(function() {	
		$( "button.btn.btn-default" ).on("click" , function() {
			fncAddTodo();
		});
	});
	
	// �� �� ��� üũ
	

// datepicker function
$( function() {
    var dateFormat = "mm/dd/yy",
      from = $( "#toDoStartDate" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 1
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#toDoEndDate" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 1
      })
      .on( "change", function() {
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
  } )


/* $(document).ready(function(){
	  $(".btn btn-default").click(function(){
	    $("tr").append("<th>Appended item</th>");
	  });
	}); */
 
/* // Create a "close" button and append it to each list item
var myNodelist = document.getElementsByTagName("LI");
var i;
for (i = 0; i < myNodelist.length; i++) {
  var span = document.createElement("SPAN");
  var txt = document.createTextNode("\u00D7");
  span.className = "close";
  span.appendChild(txt);
  myNodelist[i].appendChild(span);
}

// Click on a close button to hide the current list item
var close = document.getElementsByClassName("close");
var i;
for (i = 0; i < close.length; i++) {
  close[i].onclick = function() {
    var div = this.parentElement;
    div.style.display = "none";
  }
}

// Add a "checked" symbol when clicking on a list item
var list = document.querySelector('ul');
list.addEventListener('click', function(ev) {
  if (ev.target.tagName === 'LI') {
    ev.target.classList.toggle('checked');
  }
}, false);

// Create a new list item when clicking on the "Add" button
function newElement() {
  var li = document.createElement $("td");
  var inputValue = document.getElementById("toDoInput").value;
  var t = document.createTextNode(inputValue);
  li.appendChild(t);
  if (inputValue === '') {
    alert("You must write something!");
  } else {
    document.getElementById("myUL").appendChild(li);
  }
  document.getElementById("myInput").value = "";

  var span = document.createElement("SPAN");
  var txt = document.createTextNode("\u00D7");
  span.className = "close";
  span.appendChild(txt);
  li.appendChild(span);

  for (i = 0; i < close.length; i++) {
    close[i].onclick = function() {
      var div = this.parentElement;
      div.style.display = "none";
    }
  }
} */
</script>
</head>

<body>
<h2 style="margin:5px">���� �� �� ����</h2>
<form class="form-inline">
  <div class="form-group">
    <label for="toDoDetail">�� �� ����</label>
    <input type="text" class="form-control" id="toDoDetail" name="toDoDetail" placeholder="�� ���� �Է��ϼ���....">
  </div>
  <div class="form-group">
    <label for="toDoStartDate">���� ��¥</label>
    <input type="text" class="form-control" id="toDoStartDate" name="toDoStartDate" placeholder="���� ��¥">
  </div>
  <div class="form-group">
    <label for="toDoEndDate">���� ��¥</label>
    <input type="text" class="form-control" id="toDoEndDate" name="toDoEndDate" placeholder="���� ��¥">
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
          <td>2019�� 01�� 03��</td>
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