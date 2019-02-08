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
	/*����  */
	$( function() {
    	$( '.listDiary' ).tooltip();
  	});
	
	$( function() {
	    $( '.imageDiary' ).tooltip();
	});
	/* ����Ʈ */
	function fncGetList(currentPage) {
		/* document.getElementById("currentPage").value = currentPage; */
		$("#currentPage").val(currentPage);
		/* document.detailForm.submit(); */
		$('[name="detailForm"]').attr("method", "POST").attr("action",
				"/diary/listDiary").submit();
	}

	/* ��ü ���� */
	function fncAllchk() {
		if ($("#allCheck").is(':checked')) {
			$("input[name=deleteDiary]").prop("checked", true);
		} else {
			$("input[name=deleteDiary]").prop("checked", false);
		}
	}

	/* ���� */
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
		 alert("������ ���̾ üũ�� �ּ���");
		 return; 
		document.userForm.delUserid.value = userid;       
		// üũ�� ����� ���̵� '-'�� ���� userid ��  document.userForm.delUserid �� value�� ����
		var agree=confirm("���� �Ͻðڽ��ϱ�?");
		   if (agree){
		 document.userForm.execute.value = "userDel";
		   document.userForm.submit();
		   } 
		} */
		var agree = confirm("���� �Ͻðڽ��ϱ�?");
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

		$(".getDetail").on("click", function() {
			var diaryNo = $(this).data('param1');
			self.location = "/diary/getDiary?diaryNo=" + diaryNo;
		});

		$('#search').on("click", function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
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

/*�ؽ�Ʈ  */
div#columns figure figcaption {
  font-size: .9rem;
	color: #444;
  line-height: 1.5;
}

/*���� ��Ȳ���� �ȸ��ϤӤ� */
div#columns small { 
  font-size: 1rem;
  float: right; 
  text-transform: uppercase;
  color: #aaa;
} 

/*���� ��Ȳ���� �ȸ���  */
div#columns small a { 
  color: #666; 
  text-decoration: none; 
  transition: .4s color;
}

/*�ϳ� �������� �� ������ �帮�� �ϴ°�  */
div#columns:hover figure:not(:hover) {
	opacity: 0.8;
}

/*���� ��Ȳ���� �ȸ���  */
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

							<!-- table ���� �˻� Start /////////////////////////////////////-->
							<div class="row">

								<div class="col-md-6 text-left">
									<p class="text-default">��ü ��:${resultPage.totalCount}</p>

								</div>
								<div class="col-md-6 text-right">
									<div class="col-sm-offset-4  col-sm-4 text-right"
							style="float: right;">
							<%-- <button type="button" name="imageList" class="btn btn-primary"
								id="imageList" data-param1="${search.currentPage}"> --%>										
										<a href='/diary/listDiary'><img src=/images/diaryImage/3213.PNG class="listDiary" style="width:30px; height:24px;" title="����Ʈ �������� ����"/></a>
										<a href='/diary/imageList?currentPage=${search.currentPage}'><img src=/images/diaryImage/321312.PNG class="imageDiary" style="width:30px; height:24px;" title="����� �������� ����"/></a>
									</div>

								</div>
								<div class="col-md-4"></div>

								<div class="col-md-6 text-right"></div>
							</div>
							<nav class="navbar navbar-default navbar-expand-lg">
							<div class="container" style="position:relative">
								<form name="detailForm" class="form-inline ml-auto">
								
									<div class="navbar-translate text-left" style="float: left; position:absolute; left:0;">
										<button type="button" name="add" class="btn btn-primary" id="addDiary" onclick="fncAddDiary();">�۾���</button>
									</div>
									
									<div class="collapse navbar-collapse">
						                <ul class="navbar-nav">
						                  <li class="nav-item active">                    
						                  </li>
						                  <li class="nav-item">                    
						                  </li>
						                </ul>
            
									</div>
									<div class="form-group bmd-form-group">
										<!-- <label class="sr-only" for="searchKeyword">�˻���</label> 
											 -->
										<input type="text" class="form-control" id="searchKeyword"
											name="searchKeyword" placeholder="����+����"
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
				<!-- table ���� �˻� Start /////////////////////////////////////-->

				<!-- �������� �� -->

				<!--  table Start /////////////////////////////////////-->
				<form name="deleteForm">
								<div id="columns">
									<c:forEach var="diary" items="${list}">
										<c:set var="i" value="${ i+1 }" />
										
			 								<figure style="cursor:pointer">
			 									<div style="width:285px;" class="getDetail" data-param1="${diary.diaryNo}"> 
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
								onclick="fncDeleteDiary();">����</button>
						</div>
						<div class="col-sm-offset-4  col-sm-4 text-right"
							style="float: right;">
							<button type="button" name="add" class="btn btn-primary"
								id="addDiary" onclick="fncAddDiary();">�۾���</button>
						</div>
					</div> -->
				</form>
				<%-- <jsp:include page="../common/pageNavigator.jsp" /> --%>
			</div>
		</div>
	</div>



	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
	<!-- PageNavigation Start... -->

	<jsp:include page="/common/footer.jsp"></jsp:include>

</body>
</html>