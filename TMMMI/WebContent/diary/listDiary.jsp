<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Tmmmi</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--  Fonts and icons -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">

<!-- CSS Files -->
<link href="/css/template/material-kit.css" rel="stylesheet" />

<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/css/template/demo.css" rel="stylesheet" />

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">
	/* 리스트 */
	function fncGetList(currentPage) {
		/* document.getElementById("currentPage").value = currentPage; */
		$("#currentPage").val(currentPage)
		/* document.detailForm.submit(); */
		$("form").attr("method", "POST").attr("action", "/diary/listDiary")
				.submit();
	}

	/* 전체 선택 */
	function fncAllchk() {
		if ($("#allCheck").is(':checked')) {
			$("input[name=deleteDiary]").prop("checked", true);
		} else {
			$("input[name=deleteDiary]").prop("checked", false);
		}
	}

	/* 삭제 */
	function fncDeleteDiary() {
		/* var userid = "";
		var diaryChk = document.getElementsByName("diaryNo");
		var chked = false;
		var indexid = false;
		for(i=0; i < memberChk.length; i++){
		 if(diaryChk[i].checked){
		  if(indexid){
		    userid = userid + '-';
		  }
		  userid = userid + diaryChk[i].value;
		  indexid = true;
		 }
		}
		if(!indexid){
		 alert("삭제할 다이어리 체크해 주세요");
		 return; 
		document.userForm.delUserid.value = userid;       
		// 체크된 사용자 아이디를 '-'로 묶은 userid 를  document.userForm.delUserid 의 value로 저장
		var agree=confirm("삭제 하시겠습니까?");
		   if (agree){
		 document.userForm.execute.value = "userDel";
		   document.userForm.submit();
		   } 
		} */
		var agree = confirm("삭제 하시겠습니까?");
		if (agree == true) {
			$('[name="deleteForm"]').attr("method", "POST").attr("action",
					"/diary/deleteDiary").submit();
		}
		if (agree == false) {
			return false;
		}
	}

	$(function() {
		$("#addDiary").on("click", function() {
			location.replace('/diary/addDiary');
		});

		$(".getDetail td:nth-child(4)").on("click", function() {
			var diaryNo = $(this).data('param1');
			console.log("아아아");
			self.location = "/diary/getDiary?diaryNo=" + diaryNo;
		});
	});
</script>
</head>
<body class="index-page sidebar-collapse">
	<jsp:include page="/common/toolbar2.jsp"></jsp:include>
	<div class="page-header header-filter clear-filter purple-filter"
		data-parallax="true">
		<div class="container">
			<div class="row">
				<div class="col-md-8 ml-auto mr-auto">
					<div class="brand">
						<h2 class="title">Diary</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="main main-raised">
		<div class="section section-basic">
			<div class="container">
				<div align="center">
					<!-- Wrapper -->
					<div id="wrapper">
						<!-- Main -->
						<div id="main">


							<div class="container">
								<form name="detailForm">
									<input type="hidden" value="search" />

									<div class="form-group" align="left">
										<label for="userCategoryNo"
											class="col-sm-offset-1 col-sm-1 control-label text-center"></label>
										<h3>내가 쓴 다이어리</h3>
										<div class="col-sm-4"></div>
									</div>

									<!-- table 위쪽 검색 Start /////////////////////////////////////-->
									<div class="row">

										<div class="col-md-6 text-left">
											<p class="text-primary">전체 ${resultPage.totalCount} 건수,
												현재 ${resultPage.currentPage} 페이지</p>
											<input type="hidden" id="currentPage" name="currentPage"
												value="" />
										</div>


									</div>
									<!-- table 위쪽 검색 Start /////////////////////////////////////-->

								</form>
								<!-- 디테일폼 끝 -->

								<!--  table Start /////////////////////////////////////-->
								<form name="deleteForm">
									<table class="table table-hover table-striped">

										<thead>
											<tr>
												<th align="center"><input id="allCheck" name="allCheck"
													type="checkbox" onclick="fncAllchk();" />전체선택</th>
												<th align="left">No</th>
												<th align="left">카테고리번호</th>
												<th align="left">다이어리 제목</th>
												<th align="left">작성 날짜</th>
											</tr>
										</thead>

										<tbody>

											<c:set var="i" value="0" />
											<c:forEach var="diary" items="${list}">
												<c:set var="i" value="${ i+1 }" />
												<tr class="getDetail">
													<td align="left"><input name="deleteDiary"
														type="checkbox" value="${diary.diaryNo}" /></td>
													<td align="left">${ i }</td>
													<td align="left">${diary.userCategoryNo}</td>
													<td align="left" data-param1="${diary.diaryNo}">${diary.diaryTitle}</td>
													<td align="left">${diary.diaryDate }</td>
												</tr>
											</c:forEach>

										</tbody>

									</table>
									<!--  table End /////////////////////////////////////-->
									<div class="form-group">
										<div class="col-sm-offset-4  col-sm-4 text-left"
											style="float: left;">
											<button type="button" name="delete" class="btn btn-primary"
												onclick="fncDeleteDiary();">삭제</button>
										</div>
										<div class="col-sm-offset-4  col-sm-4 text-right"
											style="float: right;">
											<button type="button" name="add" class="btn btn-primary"
												id="addDiary" onclick="fncAddDiary();">글쓰기</button>
										</div>
									</div>
								</form>
							</div>
						</div>
						
					<jsp:include page="../common/pageNavigator.jsp" />
					</div>
				</div>
				
			</div>

		</div>

	</div>



	<!--  화면구성 div End /////////////////////////////////////-->
	<!-- PageNavigation Start... -->

	<jsp:include page="/common/footer.jsp"></jsp:include>

</body>
</html>