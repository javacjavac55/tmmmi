<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">

</script>
</head>
<body>
<!-- ��� ��� -->
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
						<p class="description text-center">����ִ� ����� ��� ����� ��Ű�� ����̴�
							-�ڸ�������-</p>
						<div class="card-body">
							<div class="form-group bmd-form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="material-icons">create</i>
										</div>
									</div>
									<input type="text" class="form-control 1" id="addToDoDetail"
										name="toDoDetail" placeholder="�� ���� �Է����ּ���">
								</div>
							</div>
							<div class="form-group bmd-form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="material-icons">calendar_today</i>
										</div>
									</div>
									<input type="text" class="form-control 2" value="" name="toDoStartDate" id="dd1" placeholder="���� ��¥�� �Է����ּ���" autocomplete="off">
								</div>
							</div>
							<div class="form-group bmd-form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="material-icons">flag</i>
										</div>
									</div>
									<input type="text" class="form-control 3" name="toDoEndDate" id="dd2" placeholder="���� ��¥�� �Է����ּ���" autocomplete="off">
									<script>
									</script>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" data-dismiss="modal"
						type="button">���</button>
					<button class="btn btn-primary" id="addToDobtn" type="submit">���</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- ��� ��� �� -->
	<!--���� ��� -->
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
						<p class="description text-center">����ִ� ����� ��� ����� ��Ű�� ����̴�
								-�ڸ�������-</p>
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
									<input type="text" class="form-control 5" name="toDoStartDate" id="dd3" value="" placeholder="���� ��¥�� �Է����ּ���" autocomplete="off">
									<script>
									$("#dd3").datepicker(
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
									<input type="text" class="form-control 6" name="toDoEndDate" id="dd4" value="" placeholder="���� ��¥�� �Է����ּ���" autocomplete="off">
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" data-dismiss="modal"
						type="button">���</button>
					<button class="btn btn-primary" id="updateToDobtn" type="submit">����</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- ���� ��� �� -->
</body>
</html>