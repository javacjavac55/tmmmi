<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--툴팁  -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script >

<script type="text/javascript">
	/* 툴팁 */
	$( function() {
    	$( '.listScrap' ).tooltip();
  	});
	
	$( function() {
	    $( '.imageScrap' ).tooltip();
	});
	
	/* 리스트 */
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage);
		$('[name="detailForm"]').attr("method", "POST").attr("action",
				"/scrap/getScrapList").submit();
	}

	/* 전체 선택 */
	function fncAllchk() {
		if ($("#allCheck").is(':checked')) {
			$("input[name=deleteScrap]").prop("checked", true);
		} else {
			$("input[name=deleteScrap]").prop("checked", false);
		}
	}

	/* 삭제 */
	function fncDeleteScrap() {
		swal({
			title: "삭제 확인",
			text: "삭제 하시겠습니까?",
			icon: "warning",
			buttons: true,
			dangerMode: true,
		}).then((willDelete) => {
			if (willDelete) {
				$('[name="deleteForm"]').attr("method", "POST").attr("action", "/scrap/deleteScrap").submit()
			} else {           
			    
			}
		});
	}

	$(function() {
		$(".getDetail td:nth-child(4)").on("click", function() {
			var scrapNo = $(this).data('param2');
			$.ajax({
				url : "/scrapRest/getScrap?scrapNo=" + scrapNo,
				method : "GET",
				dataType: "text",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status) {
					var data = JSON.parse(JSONData);
					$('#exampleModalLongTitle').text(data.scrapTitle);
					
					if (data.scrapType==0){	
						console.log('0');
						$('.modal-body').html('<iframe frameborder="0" src=""></iframe>');
						var iframe = $('iframe');
						var context = iframe[0].contentDocument.write(data.scrapDetail);
					    iframe[0].contentWindow.document.close();
						
					} else {
						console.log('data.sectionNo: ','/scrap/scrap'+data.sectionNo+'.jsp');
						var iframe = $('iframe').attr('src','/scrap/scrap'+data.sectionNo+'.jsp?scrapNo=' + scrapNo);
					}
					
					$('.content-modal-btn').click();
				}, 
				error: function(error) {
					console.log(error)
				}
			});
		});

		$('#search').on("click", function() {
			fncGetList(1);
		});
		
		$("#imageList").on("click", function(){
			var currentPage =$(this).data('param1');
			location.replace('/scrap/imageList?currentPage='+currentPage);
		})

	});
</script>
<style>
	.modal-dialog.modal-fullsize {
	  width: 900px !important;
	  height: 100%;
	  margin: 3% 10%;
	  padding: 0;
	}
	
	.modal-content.modal-fullsize {
	  height: 87%;
	  width: 1500px !important;
	  border-radius: 0; 
	}
	
	.modal-body iframe {
		width: 100%;
	    height: 43em;
	    border: none;
	}
	
	.container {
		padding: 0 !important;
	}
</style>
</head>
<body class="index-page sidebar-collapse">
	<jsp:include page="/common/topMenu.jsp"></jsp:include>
	<div class="page-header header-filter clear-filter"	data-parallax="true" style="background-image: url('/images/userSetting/ ${userSetting.image}')">
		<div class="container">
			<div class="row">
				<div class="col-md-8 ml-auto mr-auto">
					<div class="brand">
						<h2 class="title">Scrap</h2>
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
								<h3 class="title">My Scrap</h3>
								<div class="col-sm-4"></div>
							</div>
							<!-- table 위쪽 검색 Start /////////////////////////////////////-->
							<div class="row">
								<div class="col-md-6 text-left">
									<p class="text-primary">
										전체  ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage}  페이지
									</p>
								</div>
							</div>
							<nav class="navbar navbar-default navbar-expand-lg" style="float:right;">
								<div class="container">
									<form name="detailForm" class="form-inline ml-auto">
										<div class="form-group bmd-form-group" style="align-content: right;">
											<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="제목+내용" value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
											<input type="hidden" id="currentPage" name="currentPage"  value="" />
										</div>
										<button type="button" class="btn btn-white btn-raised btn-fab btn-round" id="search">
											<i class="material-icons">search</i>
										</button>
									 </form>
								</div>
							</nav>
							<form name="deleteForm">
								<table class="table table-hover">
									<thead style="box-shadow:1px 1px 1px 1px gray;">
										<tr>
											<th align="center">
												<div class="form-check">
													<label class="form-check-label"> <input id="allCheck"
														name="allCheck" class="form-check-input" type="checkbox"
														onclick="fncAllchk();" /> 전체선택 <span class="form-check-sign">
															<span class="check"></span>
													</span>
													</label>
												</div> 
											</th>
											<th align="left">No</th>
											<th align="left">카테고리</th>
											<th align="left">스크랩 제목</th>
											<th align="left">작성 날짜</th>
										</tr>
									</thead>
			
									<tbody>
			
										<c:set var="i" value="${fn:length(list)}" />
										<c:forEach var="scrap" items="${list}">
											<c:set var="i" value="${ i-1 }" />
											<tr class="getDetail">
												<td align="left">
													<div class="form-check">
														<label class="form-check-label"> <input
															name="deleteScrap" class="form-check-input" type="checkbox"
															value="${scrap.scrapNo}" /> <span class="form-check-sign">
																<span class="check"></span>
														</span>
														</label>
													</div>
												</td>
												<td align="left">${ i+1 }</td>
												<td align="left">${scrap.sectionName}</td>
												<td align="left" data-param2="${scrap.scrapNo}" style="cursor:pointer">${scrap.scrapTitle}</td>
												<td align="left">${scrap.scrapDate}</td>
											</tr>
										</c:forEach>
			
									</tbody>
			
								</table>
							</form>
							<!--  table End /////////////////////////////////////-->
							<div class="form-group">
								<div class="col-sm-offset-4  col-sm-4 text-left"
									style="float: left;">
									<button type="button" name="delete" class="btn btn-primary"
										onclick="fncDeleteScrap();">삭제</button>
								</div>
								<div class="col-sm-offset-4  col-sm-4 text-right"
									style="float: right;">
								</div>
							</div>
							<jsp:include page="../common/pageNavigator.jsp" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<button class="content-modal-btn" type="button" data-toggle="modal" data-target="#myFullsizeModal" style="display:none"></button>
	<div class="modal fade" id="myFullsizeModal" tabindex="-1" role="dialog" aria-labelledby="myFullsizeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-fullsize">
	    <div class="modal-content modal-fullsize">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
		          <span aria-hidden="true">&times;</span>
		      </div>
		      
		      <div class="modal-body">
		      	<iframe src=""></iframe>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-info" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
	  </div>
	  
	<jsp:include page="/common/footer.jsp"></jsp:include>

</body>
</html>