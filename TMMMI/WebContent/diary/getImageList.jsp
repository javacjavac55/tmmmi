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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--sweet alert -->
<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script >

<style>
	@font-face{font-family:'Calluna';
 src:url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/callunasansregular-webfont.woff') format('woff');
}
body {
	background: url(//subtlepatterns.com/patterns/scribble_light.png);
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

<script type="text/javascript">
/*무한스크롤  */
  $(function(){
	  var currentPage = ${search.currentPage};
	  var totalCount = ${resultPage.totalCount};
	  var pageSize = ${resultPage.pageSize};
		console.log(currentPage, totalCount, pageSize);
		
	  $(window).scroll(function(){		
			if($(window).scrollTop() == $(document).height() - $(window).height()){
				++currentPage;
				console.log("스크롤 인식");
				console.log(currentPage);

				 var data = {currentPage:currentPage, searchKeyword:$("#searchKeyword").val()}
				 
				 $.ajax({
						type: 'POST',
						url : '/diaryRest/imageList?currentPage='+currentPage,
						contentType: 'application/json',
						dataType : 'json',
						data: JSON.stringify(data),			
						success: function(data){
							console.log("success");
							var list = data['list'];
							var str = "";
							if(list != null){
								$(list).each(function(){
									console.log(this);									
									str += "<figure class='card' style='cursor:pointer;' >"	 									
										+		"<button type='button' id='close' class='close' data-param2='"+this.diaryNo+"' style="+"'opacity:0;'"+">"
										+			"<span aria-hidden='true'>"
										+				"<i class='material-icons'>clear</i>"
										+			"</span>"
										+		"</button>"
										+ 		"<div style="+"'width:100%;'"+" class="+"'getDetail'"+" data-param1='"+this.diaryNo+"'>"
										+			this.diaryDetail
										+		"</div>"
										+		"<figcaption>"
										+			/* "["+this.diaryNo+"]"+ */"["+this.userCategoryName+"]"+this.diaryTitle
										+		"</figcaption>"
										+	"</figure>"
								});
								$('figure').last().after(str);
							}
							else{
								alert("마지막 페이지 입니다.");
							}
						}

					});
				 }						 
			}) 
		})
	
 
		/* 
		var lastScrollTop =0;
		var currentScrollTop = $(window).scrollTop();
		
		if( currentScrollTop - lastScrolltop >0){
			lastScrollTop = currentScrollTop;
		}else{
			lastScrollTop = currentScrollTop;
		}
		
		 */
		
 
	/*툴팁  */
	$( function() {
    	$( '.listDiary' ).tooltip();
  	});
	
	$( function() {
	    $( '.imageDiary' ).tooltip();
	});
	/* 리스트 */
	function fncGetList(currentPage) {
		/* document.getElementById("currentPage").value = currentPage; */
		$("#currentPage").val(currentPage);
		/* document.detailForm.submit(); */
		$('[name="detailForm"]').attr("method", "POST").attr("action",
				"/diary/imageList").submit();
	}
	/* function deleteOnMouseOver(){		
		close.style.display="block";
	}
	
	function deleteOnMouseOut(){		
		close.style.display="none";
	} */
	/* 전체 선택 */
	function fncAllchk() {
		if ($("#allCheck").is(':checked')) {
			$("input[name=deleteDiary]").prop("checked", true);
		} else {
			$("input[name=deleteDiary]").prop("checked", false);
		}
	}
	

	$(function() {
		
		$(document).on("mouseover",".card", function() {
			console.log($(this).children());
			$(this).children().attr('style','opacity:1;');
		});
		
		$(document).on("mouseleave",".card", function() {
			console.log($(this).children());
			$(this).children().first().attr('style','opacity:0;');
		});

		$(document).on("click",".getDetail", function() {
			var diaryNo = $(this).data('param1');
			self.location = "/diary/getImageDiary?diaryNo="+diaryNo;
		});

		$('#search').on("click", function() {			
			fncGetList(1);
		});
		
		$("#addDiary").on("click", function() {
			location.replace('/diary/addImageDiary');
		});
		


		/* 삭제 */
		$(document).on("click",".close", function() {
			var diaryNo2 = $(this).data('param2');
			$('#diaryNo').val(diaryNo2);
			swal({
				  title: "삭제 하시겠습니까?",
				  text: "삭제하면 파일을 복구할 수 없습니다.",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {					  
				    swal("삭제되었습니다.", {
				      icon: "success",
				    }).then((value)=>{				    	
				    	$('[name="deleteImageForm"]').attr("method", "POST").attr("action","/diary/deleteImage").submit();
				    });
				  } else {
				    swal("취소되었습니다.");
				  }
				});
			/* var agree = confirm("삭제 하시겠습니까?"+diaryNo2);
			if (agree == true) {
				$('#diaryNo').val(diaryNo2);
				$('[name="deleteImageForm"]').attr("method", "POST").attr("action","/diary/deleteImage").submit();
			}
			if (agree == false) {
				return false;
			} */
			
		});

	});
</script>

</head>


							<!-- table 위쪽 검색 Start /////////////////////////////////////-->
							<div class="row">

								<div class="col-md-6 text-left">
									<p class="text-default"><%-- 전체 글: ${resultPage.totalCount} --%></p>

								</div>
								<div class="col-md-6 text-right">
									<div class="col-sm-offset-4  col-sm-4 text-right"
							style="float: right;">
							<%-- <button type="button" name="imageList" class="btn btn-primary"
								id="imageList" data-param1="${search.currentPage}"> --%>
										<!-- <a href='/diary/listDiary'><img src=/images/diaryImage/3213.PNG class="listDiary" style="width:30px; height:24px;" title="리스트 형식으로 보기"/></a>
										<a href='/diary/imageList'><img src=/images/diaryImage/321312.PNG class="imageDiary" style="width:30px; height:24px;" title="썸네일 형식으로 보기"/></a> -->
									</div>

								</div>
								
								<div class="col-md-4"></div>

								<div class="col-md-6 text-right"></div>
							</div>
							<nav class="navbar navbar-default navbar-expand-lg">
								<div class="container" style="position:relative">
									
									
										<div class="navbar-translate text-left" style="float: left; position:absolute; left:0;">
											<button type="button" name="add" class="btn btn-primary" id="addDiary" onclick="fncAddDiary();">글쓰기</button>
										</div>
									<form name="detailForm" class="form-inline ml-auto">
									<div class="form-group bmd-form-group">


										<!-- <label class="sr-only" for="searchKeyword">검색어</label> 
											 -->
										<input type="text" class="form-control" id="searchKeyword"
											name="searchKeyword" placeholder="제목+내용" onKeyPress="if(event.keyCode=='13'){fncGetList(1)}"
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
				<!-- table 위쪽 검색 Start /////////////////////////////////////-->

				<!-- 디테일폼 끝 -->

				<!--  table Start /////////////////////////////////////-->
							<form name="deleteImageForm">
								<input type="hidden" id="diaryNo" name="deleteImage" value="" />
			 						
								<div id="columns">
									<c:forEach var="diary" items="${list}">
										<c:set var="i" value="${ i+1 }" />
										
			 								<figure class="card" style="cursor:pointer;" >
			 									<button type="button" id="close" class="close" data-param2="${diary.diaryNo}" style="opacity:0;">
				 									<span aria-hidden="true">
				 										<i class="material-icons">clear</i>
				 									</span>
			 									</button>
			 									<div style="width:100%;" class="getDetail" data-param1="${diary.diaryNo}">			 												 									
													${diary.diaryDetail}
												</div>
												<figcaption>
													<%-- [${diary.diaryNo}] --%>[${diary.userCategoryName}]${diary.diaryTitle}
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
						

	<!--  화면구성 div End /////////////////////////////////////-->
	<!-- PageNavigation Start... -->


</body>
</html>