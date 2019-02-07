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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">


<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/css/template/demo.css" rel="stylesheet" />

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script type="text/javascript">
	/* 리스트 */
	function fncGetList(currentPage) {
		/* document.getElementById("currentPage").value = currentPage; */
		$("#currentPage").val(currentPage);
		/* document.detailForm.submit(); */
		$('[name="detailForm"]').attr("method", "POST").attr("action",
				"/diary/listDiary").submit();
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

		$("#getDiary").on("click", function() {
			var diaryNo = $(this).data('param1');
			console.log("아아아");
			self.location = "/diary/getDiary?diaryNo=" + diaryNo;
		});

		$('#search').on("click", function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
			fncGetList(1);
		});

	});
</script>
<style>
	@font-face{font-family:'Calluna';
 src:url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/callunasansregular-webfont.woff') format('woff');
}
body {
	background: url(//subtlepatterns.com/patterns/scribble_light.png);
  font-family: Calluna, Arial, sans-serif;
  min-height: 1000px;
}
#columns {
	column-width: 320px;
	column-gap: 15px;
  width: 90%;
	max-width: 1100px;
	margin: 50px auto;
}

div#columns figure {
	background: #fefefe;
	border: 2px solid #fcfcfc;
	border-radius: 15px;
	box-shadow: 0 1px 2px rgba(34, 25, 25, 0.4);
	margin: 0 2px 15px;
	padding: 15px;
	padding-bottom: 10px;
	transition: opacity .4s ease-in-out;
  display: inline-block;
  column-break-inside: avoid;
}

div#columns figure img {
	width: 100%; height: auto;
	border-bottom: 1px solid #ccc;
	padding-bottom: 15px;
	margin-bottom: 5px;
}

/*텍스트  */
div#columns figure figcaption {
  font-size: .9rem;
	color: #444;
  line-height: 1.5;
}

/*현재 상황에서 안먹하ㅣㅁ */
div#columns small { 
  font-size: 1rem;
  float: right; 
  text-transform: uppercase;
  color: #aaa;
} 

/*현재 상황에서 안먹힘  */
div#columns small a { 
  color: #666; 
  text-decoration: none; 
  transition: .4s color;
}

/*하나 선택했을 때 나머지 흐리게 하는거  */
div#columns:hover figure:not(:hover) {
	opacity: 0.8;
}

/*현재 상황에서 안먹힘  */
@media screen and (max-width: 750px) { 
  #columns { column-gap: 0px; }
  #columns figure { width: 100%; }
}

img {
	width: 300px;
}
</style>
</head>
<body class="index-page sidebar-collapse">
	<jsp:include page="/common/toolbar2.jsp"></jsp:include>
	<div class="page-header header-filter clear-filter"
		data-parallax="true"
		style="background-image: url('/images/userSetting/ ${userSetting.image}')">
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


							<div class="form-group" align="left">
								<label for="userCategoryNo"
									class="col-sm-offset-1 col-sm-1 control-label text-center"></label>
								<h3 class="title">My Diary</h3>
								<div class="col-sm-4"></div>
							</div>

							<!-- table 위쪽 검색 Start /////////////////////////////////////-->
							<div class="row">

								<div class="col-md-6 text-left">
									<p class="text-primary">전체 ${resultPage.totalCount} 건수, 현재
										${resultPage.currentPage} 페이지</p>

								</div>

								<div class="col-md-4"></div>

								<div class="col-md-6 text-right"></div>
							</div>
							<nav class="navbar navbar-expand-lg bg-primary">
							<div class="container">
								<form name="detailForm" class="form-inline ml-auto">
									<div class="form-group has-white bmd-form-group">


										<!-- <label class="sr-only" for="searchKeyword">검색어</label> 
											 -->
										<input type="text" class="form-control" id="searchKeyword"
											name="searchKeyword" placeholder="제목+내용"
											value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
										<input type="hidden" id="currentPage" name="currentPage"
											value="" />

									</div>
									<button type="button"
										class="btn btn-white btn-raised btn-fab btn-round" id="search">
										<i class="material-icons">search</i>
									</button>


								</form>
							</div>
							</nav>
						</div>
					</div>

				</div>
				<!-- table 위쪽 검색 Start /////////////////////////////////////-->

				<!-- 디테일폼 끝 -->

				<!--  table Start /////////////////////////////////////-->
				<form name="deleteForm">
								<div id="columns">
									<c:forEach var="diary" items="${list}">
										<c:set var="i" value="${ i+1 }" />
										
			 								<figure id=getDiary data-param1="${diary.diaryNo}" style="cursor:pointer">
			 									<div style="width:285px;"> 
													${diary.diaryDetail}
												</div>
													<figcaption>
														[${diary.userCategoryName }]${diary.diaryTitle}
													</figcaption>
											 </figure>
										

									</c:forEach>
								</div>			

						<!--  table End /////////////////////////////////////-->
						<!-- <div class="form-group">
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
					</div> -->
				</form>
				<%-- <jsp:include page="../common/pageNavigator.jsp" /> --%>
			</div>
		</div>
	</div>



	<!--  화면구성 div End /////////////////////////////////////-->
	<!-- PageNavigation Start... -->

	<jsp:include page="/common/footer.jsp"></jsp:include>

</body>
</html>