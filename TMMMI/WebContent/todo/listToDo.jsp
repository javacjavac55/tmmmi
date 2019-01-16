<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTDHTML4.01Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
    <head>
        <meta content="width=device-width, initial-scale=1" name="viewport">
        <link href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css">
        <script type="text/javascript" src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script>
        <script>
            // ==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
            /////////////////////////////////// �� �� ��� üũ///////////////////////////////////////
            function fncAddTodoCheck() {
                console.log(2)
                var toDoDetail = $(".form-control").val();
                var toDoStartDate = $(".form-control").val();
                var toDoEndDate = $(".form-control").val();
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
                $("form")
                    .attr("method", "POST")
                    .attr("action", "/todo/addToDo")
                    .submit();
            }
            //////////////////////////////// �� �� ���//////////////////////////////////////
            $(function () {
                $("#addToDobtn:contains('���')").on("click", function () {
                    fncAddTodoCheck();
                })
            });
            
/////////////////////////////////////// �� �� ���� ��ȯ��ư////////////////////////////////
            $(function () {
                $(".btn.btn-primary.updateViewbtn").on("click", function () {
                    var todoNo = $(this).data("utodonov");
                    var today = new Date();
                    var picker2 = tui.DatePicker.createRangePicker({
                        startpicker: {
                            input: '#addToDoStartDate'+todoNo,
                            container: '#startpicker-container'+todoNo
                        },
                        endpicker: {
                            date: today,
                            input: '#addToDoEndDate'+todoNo,
                            container: '#endpicker-container'+todoNo
                        }
                    });
                    $("#todolist" + todoNo).toggleClass("hide");
                    $("#retodolist" + todoNo).toggleClass("show");
                })
            });
            
            ///////////////////////////////// �� �� ����/////////////////////////////////////
            $(function () {
                $(".btn.btn-primary.updateToDobtn").on("click", function () {
                    var todoNo = $(this).data("utodono");
                    console.log(todoNo);
                    $.ajax({
                        url: "/todoRest/updateToDo",
                        method: 'POST',
                        headers: {
                            "Accept": "application/json",
                            "Content-Type": "application/json"
                        },
                        data: JSON.stringify(
                            {
                                toDoNo: todoNo,
                                toDoDetail: $("#toDoDetail" + todoNo).val(),
                                toDoStartDate: $("#addToDoStartDate" + todoNo).val(),
                                toDoEndDate: $("#addToDoEndDate" + todoNo).val()
                            }
                        ),
                        dataType: 'json',
                        success: $(function () {
                        	history.go(0);
                        })
                    })
                })
            });
            
            /////////////////////////////////////�� �� ����/////////////////////////////////////////
            $(function () {
                $(".btn.btn-danger.deletebtn").on("click", function () {
                    var deleteToDoNo = $(this).data("dtodono");
                    console.log(deleteToDoNo);
                    $.ajax({
                        url: "/todoRest/deleteToDo",
                        method: 'POST',
                        headers: {
                            "Accept": "application/json",
                            "Content-Type": "application/json"
                        },
                        data: JSON.stringify(
                            {
                            	toDoNo: deleteToDoNo
                            }
                        ),
                        dataType: 'json',
                        success: $(function () {
                            history.go(0);
                        })
                    })
                })
            });
            
            /////////////////////////////////////// �� �� �Ϸ�////////////////////////////////////////
			$(function () {
				var ctodono = $(this).data("ctodono");
                $("checkbox"+ctodono).on("click", function () {
                    var ToDay = new Date()
                	var y = new Date(ToDay.getFullYear(),ToDay.getMonth(),ToDay.getDate() - 34)
                	y.getFullYear() + "-" + (y.getMonth() +1 < 10? "0" +  (y.getMonth() +1): y.getMonth() +1 ) + "-" +(y.getDate() < 10? "0" +  y.getDate(): y.getDate())
                    console.log(ctodono);
                    console.log(y);
                    $.ajax({
                        url: "/todoRest/updateToDoComplete",
                        method: 'POST',
                        headers: {
                            "Accept": "application/json",
                            "Content-Type": "application/json"
                        },
                        data: JSON.stringify(
                            {
                            	toDoNo: ctodono,
                            	toDoCompleteDate : y
                            }
                        ),
                        dataType: 'json',
                        success: $(function () {
                            history.go(0);
                        })
                    })
                })
            });
			//////////////////////////////////////Toast UI Datepicker///////////////////////////////
            $(function () {
            var today = new Date();
            var picker = tui.DatePicker.createRangePicker({
                startpicker: {
                    input: '#startpicker-input',
                    container: '#startpicker-container'
                },
                endpicker: {
                    date: today,
                    input: '#endpicker-input',
                    container: '#endpicker-container'
                }
            });
            });
            // �� �� üũ
            /* 	var ToDay = new Date()

	var y = new Date(ToDay.getFullYear(),ToDay.getMonth(),ToDay.getDate() - 34)
	
	y.getFullYear() + "-" + (y.getMonth() +1 < 10? "0" +  (y.getMonth() +1): y.getMonth() +1 ) + "-" +
	
	(y.getDate() < 10? "0" +  y.getDate(): y.getDate())
	 */
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
                                <input class="form-control" id="addToDoDetail" name="toDoDetail" placeholder="�� ���� �Է����ּ���" type="text">
                            </div>
                             <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
						        <input id="startpicker-input" type="text" aria-label="Date" name="toDoStartDate" placeholder="���� ��¥" autocomplete="off">
						        <span class="tui-ico-date"></span>
						        <div id="startpicker-container" style="margin-left: -1px;"></div>
						    </div>
						    <span>to</span>
						    <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
						        <input id="endpicker-input" type="text" aria-label="Date" id="addToDoEndDate" name="toDoEndDate" placeholder="���� ��¥" autocomplete="off">
						        <span class="tui-ico-date"></span>
						        <div id="endpicker-container" style="margin-left: -1px;"></div>
						    </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-danger" data-dismiss="modal" type="button">���</button>
                        <button class="btn btn-default" id="addToDobtn" type="submit">���</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        <!-- ��� �� -->
        <!-- �� �� ����Ʈ -->
            <div class="container"> <h2 style="margin:5px">���� �� �� ����</h2>
            <button class="btn btn-primary btn-lg" data-target="#todomodal" data-toggle="modal">�� �� ���</button>
            <div class="row">
                <div class="col-md-3">
                    <strong>������ �� ��</strong>
                </div>
                <div class="col-md-3">
                    <strong>���� ��¥</strong>
                </div>
                <div class="col-md-3">
                    <strong>���� ��¥</strong>
                </div>
                <div class="col-md-3">
                    <strong>����/����</strong>
                </div>
            </div>
            <c:forEach items="${todolist}" var="todo">
                <div class="row" id="todolist${todo.toDoNo}">
                    <input class="todo col-md-3" type="hidden" value="${todo.toDoNo}">
                    <div class="col-md-3">${todo.toDoDetail}</div>
                    <div class="col-md-3">${todo.toDoStartDate}</div>
                    <div class="col-md-3">${todo.toDoEndDate}</div>
                    <div class="col-md-3">
                    	<label>
            			<input class="checkbox${todo.toDoNo}" type="checkbox" data-ctodono="${todo.toDoNo}">
            			</label>
                        <button aria-label="Left Align" class="btn btn-primary updateViewbtn" data-utodonov="${todo.toDoNo}" type="button">
                            <span aria-hidden="true" class="glyphicon glyphicon-pencil"></span>
                        </button>
                        <button aria-label="Left Align" class="btn btn-danger deletebtn" data-dtodono="${todo.toDoNo}" type="button">
                            <span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
                        </button>
                    </div>
                </div>
                <div class="row hide" id="retodolist${todo.toDoNo}">
                    <div class="col-md-3"><input class="updateToDoDetail" id="toDoDetail${todo.toDoNo}" name="toDoDetail" type="text" value="${todo.toDoDetail}">
                    </div>
                    <div class="tui-datepicker-input tui-datetime-input tui-has-focus col-md-3">
						        <input type="text" aria-label="Date" class="updateToDo"  id="addToDoStartDate${todo.toDoNo}" name="toDoStartDate" value="${todo.toDoStartDate}" autocomplete="off">
						        <span class="tui-ico-date"></span>
						        <div id="startpicker-container${todo.toDoNo}" style="margin-left: -1px;"></div>
						    </div>
						    <div class="tui-datepicker-input tui-datetime-input tui-has-focus col-md-3">
						        <input type="text" aria-label="Date" class="updateToDoEnd" id="addToDoEndDate${todo.toDoNo}" name="toDoEndDate" value="${todo.toDoEndDate}" autocomplete="off">
						        <span class="tui-ico-date"></span>
						        <div id="endpicker-container${todo.toDoNo}" style="margin-left: -1px;"></div>
						    </div>
                    <%-- <div class="col-md-3"><input autocomplete="off" class="updateToDo" id="toDoStartDate${todo.toDoNo}" name="toDoStartDate" type="text" value="${todo.toDoStartDate}"></div>
                    <div class="col-md-3"><input autocomplete="off" class="updateToDo" id="toDoEndDate${todo.toDoNo}" name="toDoEndDate" type="text" value="${todo.toDoEndDate}"></div> --%>
                    <div class="col-md-3">
                        <button aria-label="Left Align" class="btn btn-primary updateToDobtn" data-utodono="${todo.toDoNo}" type="button">
                            <span aria-hidden="true" class="glyphicon glyphicon-pencil"></span>
                        </button>
                    </div>
                </div>
            </c:forEach>
        </div>
        <!-- �� �� ����Ʈ ��  -->
    </body>
</html>