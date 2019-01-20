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
        <link href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" rel="stylesheet" type="text/css">
        <script src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.min.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8/dist/sweetalert2.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@8/dist/sweetalert2.min.css">
        <script>
            // ==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
            // ///////////////////////////////// 할 일 등록 체크///////////////////////////////////////
            function fncAddTodoCheck() {
                console.log(2)
                var toDoDetail = $(".form-control").val();
                var toDoStartDate = $(".form-control").val();
                var toDoEndDate = $(".form-control").val();
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
                $("form")
                    .attr("method", "POST")
                    .attr("action", "/todo/addToDo")
                    .submit();
            }
            // ////////////////////////////// 할 일 등록//////////////////////////////////////
            $(function () {
                $("#addToDobtn:contains('등록')").on("click", function () {
                    fncAddTodoCheck();
                })
            });
            // ///////////////////////////////////// 할 일 수정 변환버튼////////////////////////////////
            $(function () {
                $(".btn.btn-primary.updateViewbtn").on("click", function () {
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
                    $("#todolist" + todoNo).toggleClass("hide");
                    $("#retodolist" + todoNo).toggleClass("show");
                })
            });
            // /////////////////////////////// 할 일 수정/////////////////////////////////////
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
            // ///////////////////////////////////할 일 삭제/////////////////////////////////////////
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
                            {toDoNo: deleteToDoNo}
                        ),
                        dataType: 'json',
                        success: $(function () {
                            history.go(0);
                        })
                    })
                })
            });
            // ///////////////////////////////////// 할 일 완료////////////////////////////////////////
            $(function () {
                $(".btn.btn-warning.completebtn").click(function () {
                	var ctodono = $(this).data("ctodono");
                    var Now = new Date();
                    var NowTime = Now.getFullYear();
                    NowTime += '-' + Now.getMonth() + 1 ;
                    NowTime += '-' + Now.getDate();
                    console.log(ctodono);
                    console.log(NowTime);
                    $.ajax({
                        url: "/todoRest/updateToDoComplete",
                        method: 'POST',
                        headers: {
                            "Accept": "application/json",
                            "Content-Type": "application/json"
                        },
                        data: JSON.stringify(
                            {toDoNo: ctodono, toDoCompleteDate: NowTime}
                        ),
                        dataType: 'json',
                        success: $(function () {
                            history.go(0);
                        })
                        })
                    })
                });
            
            ///////////////////////////////////할 일 완료 삭제/////////////////////////////////////////
             $(function () {
            	 $(".btn.btn-danger.completeDelbtn").click(function () {
            		 var dctodono = $(this).data("dctodono");
                    $.ajax({
                        url: "/todoRest/deleteToDoComplete",
                        method: 'POST',
                        headers: {
                            "Accept": "application/json",
                            "Content-Type": "application/json"
                        },
                        data: JSON.stringify(
                            {toDoCompleteNo: dctodono}
                        ),
                        dataType: 'json',
                        success: $(function () {
                            history.go(0);
                        })
                    })
                })
            });
            // ////////////////////////////////////Toast UI Datepicker///////////////////////////////
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
            // 할 일 체크
            /* 	var ToDay = new Date()

	var y = new Date(ToDay.getFullYear(),ToDay.getMonth(),ToDay.getDate() - 34)
	
	y.getFullYear() + "-" + (y.getMonth() +1 < 10? "0" +  (y.getMonth() +1): y.getMonth() +1 ) + "-" +
	
	(y.getDate() < 10? "0" +  y.getDate(): y.getDate())
	 */
        </script>
    </head>
    <body>
        <!-- 모달 -->
        <div class="modal fade" id="todomodal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">할 일 등록</div>
                    <div class="modal-body">
                        <form class="form-inline" id="addToDo">
                            <div class="form-group">
                                <label for="toDoDetail">할 일 내용</label>
                                <input class="form-control" id="addToDoDetail" name="toDoDetail" placeholder="할 일을 입력해주세요" type="text">
                            </div>
                            <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                                <input aria-label="Date" autocomplete="off" id="startpicker-input" name="toDoStartDate" placeholder="시작 날짜" type="text" readonly>
                                <span class="tui-ico-date"></span>
                                <div id="startpicker-container" style="margin-left: -1px;"></div>
                            </div>
                            <span>to</span>
                            <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                                <input aria-label="Date" autocomplete="off" id="endpicker-input" name="toDoEndDate" placeholder="종료 날짜" type="text" readonly>
                                <span class="tui-ico-date"></span>
                                <div id="endpicker-container" style="margin-left: -1px;"></div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-danger" data-dismiss="modal" type="button">취소</button>
                        <button class="btn btn-default" id="addToDobtn" type="submit">등록</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        <!-- 모달 끝 -->
        <!-- 할 일 리스트 -->
            <div class="container"> <h2 style="margin:5px">나의 할 일 관리</h2>
            <button class="btn btn-primary btn-lg" data-target="#todomodal" data-toggle="modal">할 일 등록</button>
            <div class="row">
                <div class="col-md-3">
                    <h3><strong>오늘의 할 일</strong></h3>
                </div>
                <div class="col-md-3">
                    <h3><strong>시작 날짜</strong></h3>
                </div>
                <div class="col-md-3">
                   <h3> <strong>종료 날짜</strong></h3>
                </div>
                <div class="col-md-3">
                    <h3><strong>완료/수정/삭제</strong></h3>
                </div>
            </div>
            <c:forEach items="${todolist}" var="todo">
            	<c:if test="${todo.toDoCompleteNo  eq 0}">
                <div class="row" id="todolist${todo.toDoNo}">
                    <input class="todo col-md-3" type="hidden" value="${todo.toDoNo}">
                    <div class="col-md-3">${todo.toDoDetail}</div>
                    <div class="col-md-3">${todo.toDoStartDate}</div>
                    <div class="col-md-3">${todo.toDoEndDate}</div>
                    <div class="col-md-3">
                        <button aria-label="Left Align" class="btn btn-warning completebtn" data-ctodono="${todo.toDoNo}" data-dctodono="${todo.toDoCompleteNo}" type="button">
                            <span aria-hidden="true" class="glyphicon glyphicon-ok"></span>
                       </button>
                        <button aria-label="Left Align" class="btn btn-primary updateViewbtn" data-enddate="${todo.toDoEndDate}" data-startdate="${todo.toDoStartDate}" data-utodonov="${todo.toDoNo}" type="button">
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
                    <div class="col-md-3 tui-datepicker-input tui-datetime-input tui-has-focus">
                        <input aria-label="Date" autocomplete="off" class="updateToDo" id="addToDoStartDate${todo.toDoNo}" name="toDoStartDate" type="text" value="${todo.toDoStartDate}" readonly>
                        <span class="tui-ico-date"></span>
                        <div id="startpicker-container${todo.toDoNo}" style="margin-left: -1px;"></div>
                    </div>
                    <div class="col-md-3 tui-datepicker-input tui-datetime-input tui-has-focus">
                        <input aria-label="Date" autocomplete="off" class="updateToDoEnd" id="addToDoEndDate${todo.toDoNo}" name="toDoEndDate" type="text" value="${todo.toDoEndDate}" readonly>
                        <span class="tui-ico-date"></span>
                        <div id="endpicker-container${todo.toDoNo}" style="margin-left: -1px;"></div>
                    </div>
                    <div class="col-md-3">
                        <button aria-label="Left Align" class="btn btn-primary updateToDobtn" data-utodono="${todo.toDoNo}" type="button">
                            <span aria-hidden="true" class="glyphicon glyphicon-pencil"></span>
                        </button>
                    </div>
                </div>
                </c:if>
            </c:forEach>
            <div class="row">
                <div class="col-md-3">
                    <h3><strong>완료된 할 일</strong></h3>
                </div>
                <div class="col-md-6">
                    <h3><strong>완료 날짜</strong></h3>
                </div>
                <div class="col-md-3">
                    <h3><strong>삭제</strong></h3>
                </div>
            </div>
            <c:forEach items="${todolist}" var="todo">
            <c:if test="${todo.toDoCompleteNo ne 0}">
                <div class="row" id="completetodolist">
                    <input class="todo col-md-3" type="hidden" value="${todo.toDoCompleteNo}">
                    <div class="col-md-3">${todo.toDoDetail}</div>
                    <div class="col-md-6">${todo.toDoCompleteDate}</div>
                    <div class="col-md-3">
                        <button aria-label="Left Align" class="btn btn-danger completeDelbtn" data-dctodono="${todo.toDoCompleteNo}" type="button">
                            <span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
                       </button>
                    </div>
                </div>
                </c:if>
            </c:forEach>
        </div>
        <!-- 할 일 리스트 끝  -->
    </body>
</html>