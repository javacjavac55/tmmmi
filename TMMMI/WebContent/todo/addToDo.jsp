<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 등록 모달 -->
	<div class="modal fade" id="todomodal" role="" tabindex="-1">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="card card-plain">
					<div class="modal-header">
						<div class="card-header card-header-text card-header-primary">
							<button aria-hidden="true" class="close" data-dismiss="modal"
								type="button">
								<i class="material-icons">clear</i>
							</button>
							<h4 class="card-title">Add ToDo</h4>
						</div>
					</div>
				</div>
				<div class="modal-body">
					<form class="addform" action="" id="addToDo">
						<p class="description text-center">용기있는 사람은 모두 약속을 지키는 사람이다
							-코르네이유-</p>
						<div class="card-body">
							<div class="form-group bmd-form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="material-icons">create</i>
										</div>
									</div>
									<input type="text" class="form-control 1" id="addToDoDetail"
										name="toDoDetail" placeholder="할 일을 입력해주세요">
								</div>
							</div>
							<div class="form-group bmd-form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="material-icons">calendar_today</i>
										</div>
									</div>
									<input type="text" class="form-control 2" name="toDoStartDate" id="dd1" autocomplete="off">
									<script>
								    $("#dd1").datepicker(
								        {
								        	 firstDay: 1,
								             dateFormat: "yy-mm-dd",
								             defaultDate: "2019-03-01",
								             monthNames: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
								             monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
								             dayNames: ['일', '월', '화', '수', '목', '금', '토'],
								             dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
								             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
								             showMonthAfterYear: true,
								             yearSuffix: '년',
								             changeYear: true,
								             changeMonth: true
								        }
								    );
								</script>
								</div>
							</div>
							<div class="form-group bmd-form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="material-icons">flag</i>
										</div>
									</div>
									<input type="text" class="form-control 3" name="toDoEndDate" id="dd2" autocomplete="off">
									<script>
									$("#dd2").datepicker(
									        {
									        	 firstDay: 1,
									             dateFormat: "yy-mm-dd",
									             defaultDate: "2019-03-01",
									             monthNames: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
									             monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
									             dayNames: ['일', '월', '화', '수', '목', '금', '토'],
									             dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
									             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
									             showMonthAfterYear: true,
									             yearSuffix: '년',
									             changeYear: true,
									             changeMonth: true
									        }
									    );
									</script>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" data-dismiss="modal"
						type="button">취소</button>
					<button class="btn btn-primary" id="addToDobtn" type="submit">등록</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- 등록 모달 끝 -->
	<!--수정 모달 -->
	<div class="modal fade" id="updatetodomodal" role="" tabindex="-1">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="card card-plain">
					<div class="modal-header">
						<div class="card-header card-header-text card-header-primary">
							<button aria-hidden="true" class="close" data-dismiss="modal"
								type="button">
								<i class="material-icons">clear</i>
							</button>
							<h4 class="card-title">Update ToDo</h4>
						</div>
					</div>
				</div>
				<div class="modal-body">
					<form class="updateform" method="" action="">
						<div class="card-body">
							<div class="form-group bmd-form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="material-icons">create</i>
										</div>
									</div>
									<input type="hidden" class="form-control" name="toDoNo" id="updateToDoNo">
									<input type="text" class="form-control 4" id="updateToDoDetail"
										name="toDoDetail" value="">
								</div>
							</div>
							<div class="form-group bmd-form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="material-icons">calendar_today</i>
										</div>
									</div>
									<input type="text" class="form-control 5" name="toDoStartDate" id="dd3" value="" autocomplete="off">
									<script>
									$("#dd3").datepicker(
									        {
									        	 firstDay: 1,
									             dateFormat: "yy-mm-dd",
									             defaultDate: "2019-03-01",
									             monthNames: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
									             monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
									             dayNames: ['일', '월', '화', '수', '목', '금', '토'],
									             dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
									             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
									             showMonthAfterYear: true,
									             yearSuffix: '년',
									             changeYear: true,
									             changeMonth: true
									        }
									    );
									</script>
								</div>
							</div>
							<div class="form-group bmd-form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="material-icons">flag</i>
										</div>
									</div>
									<input type="text" class="form-control 6" name="toDoEndDate" id="dd4" value="" autocomplete="off">
									<script>
									$("#dd4").datepicker(
									        {
									        	 firstDay: 1,
									             dateFormat: "yy-mm-dd",
									             defaultDate: "2019-03-01",
									             monthNames: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
									             monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
									             dayNames: ['일', '월', '화', '수', '목', '금', '토'],
									             dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
									             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
									             showMonthAfterYear: true,
									             yearSuffix: '년',
									             changeYear: true,
									             changeMonth: true
									        }
									    );
									</script>
								</div>
								<p class="description text-center">용기있는 사람은 모두 약속을 지키는 사람이다
							-코르네이유-</p>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" data-dismiss="modal"
						type="button">취소</button>
					<button class="btn btn-primary" id="updateToDobtn" type="submit">수정</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- 수정 모달 끝 -->
</body>
</html>