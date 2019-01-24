<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTDHTML4.01Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
    <head>
        <meta
            content="width=device-width, initial-scale=1" name="viewport">
            <!-- jQuery CSS  -->
<link
    href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
<link
    crossorigin="anonymous" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" rel="stylesheet">
    <!-- ToastUI CSS -->
<link
    href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" rel="stylesheet" type="text/css">
    <!-- font CSS-->
<link
    href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
    <!-- template CSS -->
<link href="/css/template/material-kit.css" rel="stylesheet"/>
<link
href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" rel="stylesheet" type="text/css"/>
<!-- jQuery script  -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ToastUI script -->
<script src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.min.js" type="text/javascript"></script>
<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js" type="text/javascript"></script>
<!-- Bootstrap script -->
<script crossorigin="anonymous" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<!--   Core JS Files   -->
<script src="/javascript/template/core/jquery.min.js" type="text/javascript"></script>
<script src="/javascript/template/core/popper.min.js" type="text/javascript"></script>
<script src="/javascript/template/core/bootstrap-material-design.min.js" type="text/javascript"></script>
<script src="/javascript/template/plugins/moment.min.js"></script>
<script async defer src="https://buttons.github.io/buttons.js"></script>
<script src="/javascript/template/plugins/bootstrap-datetimepicker.js" type="text/javascript"></script>
<!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
<script src="/javascript/template/material-kit.js" type="text/javascript"></script>
<!-- sweetalert2 script -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8/dist/sweetalert2.min.js"></script>
<link
    href="https://cdn.jsdelivr.net/npm/sweetalert2@8/dist/sweetalert2.min.css" rel="stylesheet">
    <!-- Style CSS-->
<style type="text/css">
body,
h4 {
    font-family: "Nanum Gothic", sans-serif;
    font-size: medium;
}
button,
h2,
h3 {
    font-family: "Nanum Gothic", sans-serif;
}
</style>
<script>
                                   // ==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
                                   // ///////////////////////////////// �� �� ��� üũ///////////////////////////////////////
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
                                       $(function () {
                                           $("form")
                                               .attr("method", "POST")
                                               .attr("action", "/todo/addToDo")
                                               .submit();
                                       })
                                   }
                                   // ////////////////////////////// �� �� ���//////////////////////////////////////
                                   $(function () {
                                       $("#addToDobtn:contains('���')").on("click", function () {
                                           fncAddTodoCheck();
                                       })
                                   });
                                   // ///////////////////////////////////// �� �� ���� ��ȯ��ư////////////////////////////////
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
                                           $("#todolist" + todoNo).hide();
                                           $("#retodolist" + todoNo).show(1000);
                                       })
                                   });
                                   // /////////////////////////////// �� �� ����/////////////////////////////////////
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
                                                   console.log();
                                                   $("#todolist" + todoNo + " > div ").eq(0).text($("#toDoDetail" + todoNo).val());
                                                   $("#todolist" + todoNo + " > div ").eq(1).text($("#addToDoStartDate" + todoNo).val());
                                                   $("#todolist" + todoNo + " > div ").eq(2).text($("#addToDoEndDate" + todoNo).val());
                                                   $("#retodolist" + todoNo).hide();
                                                   $("#todolist" + todoNo).show();
                                                   // history.go(0);
                                               })
                                           })
                                       })
                                   });
                                   // ///////////////////////////////////�� �� ����/////////////////////////////////////////
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
                                   // ///////////////////////////////////// �� �� �Ϸ�////////////////////////////////////////
                                   $(function () {
                                       $(".btn.btn-warning.completebtn").click(function () {
                                           var ctodono = $(this).data("ctodono");
                                           var Now = new Date();
                                           var NowTime = Now.getFullYear();
                                           NowTime += '-' + Now.getMonth() + 1;
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
                                   // /////////////////////////////////�� �� �Ϸ� ����/////////////////////////////////////////
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
                                               language: 'ko',
                                               input: '#startpicker-input',
                                               container: '#startpicker-container'
                                           },
                                           endpicker: {
                                               language: 'ko',
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
<div class="modal fade" id="todomodal" role="" tabindex="-1">
    <div class="modal-dialog modal-login" role="document">
        <div class="modal-content">
            <div class="card card-plain">
                <div class="modal-header">
                    <div class="card-header card-header-primary text-center">
                        <button aria-hidden="true" class="close" data-dismiss="modal" type="button">
                            <i class="material-icons">clear</i>
                        </button>
                        <h4 class="card-title">�� �� ���</h4>
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <form class="form-inline" id="addToDo">
                    <div class="form-group">
                        <label>�� �� ����</label>
                        <div class="tui-datetime-input col-md-3">
                            <input class="form-control" id="addToDoDetail" name="toDoDetail" placeholder="�� ���� �Է����ּ���" type="text"></div>
                        </div>
                        <label class="label-control">�� �� �Ⱓ</label>
                        <div class="tui-has-focus col-md-3">
                            <input aria-label="Date" autocomplete="off" class="form-control datetimepicker" id="startpicker-input" name="toDoStartDate" placeholder="���� ��¥" readonly type="text">
                                <div id="startpicker-container" style="margin-left: -1px;"></div>
 						</div>
				     <div class="tui-has-focus col-md-3">
				         <input aria-label="Date" autocomplete="off" class="form-control datetimepicker" id="endpicker-input" name="toDoEndDate" placeholder="���� ��¥" readonly type="text">
				             <div id="endpicker-container" style="margin-left: -1px;"></div>
				            </div>
				        </form>
				    </div>
				    <div class="modal-footer">
				        <button class="btn btn-secondary" data-dismiss="modal" type="button">���</button>
				        <button class="btn btn-primary" id="addToDobtn" type="submit">���</button>
				    </div>
			</div>
		<!-- /.modal-content -->
		</div>
<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!-- ��� �� -->

<!--  �޷�UI -->
<!-- �� �� ����Ʈ -->
<div class="container"> <h2 style="margin:5px">���� �� �� ����</h2>
<div style="overflow:hidden;float: left;width:50%;">
    <div class="form-group" style="float: left">
        <div class="row">
            <div class="col-md-8">
                <div id="datetimepicker12"></div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            $('#datetimepicker12').datetimepicker({
                inline: true
            });
        });
    </script>
</div>
<button class="btn btn-primary btn-lg" data-target="#todomodal" data-toggle="modal">
    <h4>�� �� ���</h4>
</button>
<div class="row" >
    <div class="col-md-3">
        <h3>
            <strong>������ �� ��</strong>
        </h3>
    </div>
    <div class="col-md-3">
        <h3>
            <strong>�Ϸ�/����/����</strong>
        </h3>
    </div>
</div>
<c:forEach items="${todolist}" var="todo">
<c:if test="${todo.toDoCompleteNo  eq 0}">
 <div class="row" id="todolist${todo.toDoNo}">
     <input class="todo col-md-3" type="hidden" value="${todo.toDoNo}">
         <div class="col-md-3">${todo.toDoDetail}</div>
         <div class="col-md-3">
             <button aria-label="Left Align" class="btn btn-warning completebtn" data-ctodono="${todo.toDoNo}" data-dctodono="${todo.toDoCompleteNo}" type="button">
                 <i class="material-icons">check</i>
             </button>
             <button aria-label="Left Align" class="btn btn-primary updateViewbtn" data-enddate="${todo.toDoEndDate}" data-startdate="${todo.toDoStartDate}" data-utodonov="${todo.toDoNo}" type="button">
                 <i class="material-icons">edit</i>
             </button>
             <button aria-label="Left Align" class="btn btn-danger deletebtn" data-dtodono="${todo.toDoNo}" type="button">
                 <i class="material-icons">clear</i>
             </button>
         </div>
     </div>
     <%-- <div class="row" id="retodolist${todo.toDoNo}" style="display:none;">
         <div class="col-md-3">
             <input class="updateToDoDetail" id="toDoDetail${todo.toDoNo}" name="toDoDetail" type="text" value="${todo.toDoDetail}"></div>
             <div class="col-md-3 tui-datetime-input tui-has-focus">
                 <input aria-label="Date" autocomplete="off" class="updateToDo" id="addToDoStartDate${todo.toDoNo}" name="toDoStartDate" readonly type="text" value="${todo.toDoStartDate}">
                     <div id="startpicker-container${todo.toDoNo}" style="margin-left: -1px;"></div>
                 </div>
                 <div class="col-md-3 tui-datetime-input tui-has-focus">
                     <input aria-label="Date" autocomplete="off" class="updateToDoEnd" id="addToDoEndDate${todo.toDoNo}" name="toDoEndDate" readonly type="text" value="${todo.toDoEndDate}">
                         <div id="endpicker-container${todo.toDoNo}" style="margin-left: -1px;"></div>
                     </div>
                     <div class="col-md-3">
                         <button aria-label="Left Align" class="btn btn-primary updateToDobtn" data-utodono="${todo.toDoNo}" type="button">
                             <i class="material-icons">edit</i>
                         </button>
                     </div>
                 </div> --%>
             </c:if>
         </c:forEach>
     </body>
 </html>