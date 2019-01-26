<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTDHTML4.01Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
    <head>
        <meta content="width=device-width, initial-scale=1" name="viewport">
            <!-- <!-- jQuery CSS  -->
<link href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet">

<link crossorigin="anonymous" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" rel="stylesheet">

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
    <!-- template CSS -->
<link href="/css/template/material-kit.min.css?v=2.0.5" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" rel="stylesheet" type="text/css"/>
<!-- jQuery script  -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
body{
	background-image: url( "/images/background/memo2.png" );
}
</style>
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
                                       $(function () {
                                           $("form")
                                               .attr("method", "POST")
                                               .attr("action", "/todo/addToDo")
                                               .submit();
                                       })
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
                                           /* var picker2 = tui.DatePicker.createRangePicker({
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
                                           picker2.setEndDate(end); */
                                           $("#todolist" + todoNo).hide();
                                           $("#retodolist" + todoNo).show(1000);
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
                                   // /////////////////////////////////할 일 완료 삭제/////////////////////////////////////////
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
                                   
                                   ///Datepicker
                                   
							        $(function () {
							            $('.datetimepicker').datetimepicker({
							            	icons: {
							            	time: "fa fa-clock-o",
							                date: "fa fa-calendar",
							                up: "fa fa-chevron-up",
							                down: "fa fa-chevron-down",
							                previous: 'fa fa-chevron-left',
							                next: 'fa fa-chevron-right',
							                today: 'fa fa-screenshot',
							                clear: 'fa fa-trash',
							                close: 'fa fa-remove'
							            	},
							            inline: true,
							            sideBySide: true,
							            format: 'L'
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
<div class="modal fade" id="todomodal" role="" tabindex="-1">
    <div class="modal-dialog modal-login" role="document">
        <div class="modal-content">
            <div class="card card-plain">
                <div class="modal-header">
                    <div class="card-header card-header-primary text-center">
                        <button aria-hidden="true" class="close" data-dismiss="modal" type="button">
                            <i class="material-icons">clear</i>
                        </button>
                        <h4 class="card-title">할 일 등록</h4>
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <form class="form-inline" id="addToDo">
                    <div class="form-group">
                        <label>할 일 내용</label>
                        <div class="tui-datetime-input col-md-3">
                            <input class="form-control" id="addToDoDetail" name="toDoDetail" placeholder="할 일을 입력해주세요" type="text"></div>
                        </div>
                        <label class="label-control">할 일 기간</label>
                        <div class="tui-has-focus col-md-3">
                            <input aria-label="Date" autocomplete="off" class="form-control datetimepicker" id="startpicker-input" name="toDoStartDate" placeholder="시작 날짜" readonly type="text">
                                <div id="startpicker-container" style="margin-left: -1px;"></div>
 						</div>
				     <div class="tui-has-focus col-md-3">
				         <input aria-label="Date" autocomplete="off" class="form-control datetimepicker" id="endpicker-input" name="toDoEndDate" placeholder="종료 날짜" readonly type="text">
				             <div id="endpicker-container" style="margin-left: -1px;"></div>
				            </div>
				        </form>
				    </div>
				    <div class="modal-footer">
				        <button class="btn btn-secondary" data-dismiss="modal" type="button">취소</button>
				        <button class="btn btn-primary" id="addToDobtn" type="submit">등록</button>
				    </div>
			</div>
		<!-- /.modal-content -->
		</div>
<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!-- 모달 끝 -->

<!--  달력UI -->
<!-- 할 일 리스트 -->
<div class="container">
<div><h2 style="margin:5px;text-align:center">나의 할 일 관리</h2></div>
    <div class="form-group">
    <label class="label-control">Datetime Picker</label>
    <input type="text" class="form-control datetimepicker" value=""/>
</div>
<div class="list">
<div class="row">
    <div class="col-md-3">
        <h3>
            <strong>오늘의 할 일</strong>
        </h3>
    </div>
    <div class="col-md-3">
    <button class="btn btn-primary btn-fab btn-fab-mini btn-round" data-target="#todomodal" data-toggle="modal">
	<i class="material-icons">edit</i>
	</button>
	</div>
</div>
<c:forEach items="${todolist}" var="todo">
<c:if test="${todo.toDoCompleteNo  eq 0}">
 <div class="row" id="todolist${todo.toDoNo}">
     <input class="todo col-md-3" type="hidden" value="${todo.toDoNo}">
         <div class="col-md-3">${todo.toDoDetail}</div>
         <div class="col-md-3">
             <button aria-label="Left Align" class="btn btn-primary btn-fab btn-fab-mini completebtn" data-ctodono="${todo.toDoNo}" data-dctodono="${todo.toDoCompleteNo}" type="button">
                 <i class="material-icons">check</i>
             </button>
             <button aria-label="Left Align" class="btn btn-primary btn-fab btn-fab-mini updateViewbtn" data-enddate="${todo.toDoEndDate}" data-startdate="${todo.toDoStartDate}" data-utodonov="${todo.toDoNo}" type="button">
                 <i class="material-icons">edit</i>
             </button>
             <button aria-label="Left Align" class="btn btn-primary btn-fab btn-fab-mini deletebtn" data-dtodono="${todo.toDoNo}" type="button">
                 <i class="material-icons">clear</i>
             </button>
         </div>
     </div>
             </c:if>
         </c:forEach>
         </div>
         </div>
     </body>
 </html>