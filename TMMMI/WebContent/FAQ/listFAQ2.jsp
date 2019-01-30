<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title> listFAQ </title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
  
  	<!--  Fonts and icons -->
  	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  	
  	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
    <!-- CSS Files -->
    <link href="/css/template/material-kit.css" rel="stylesheet" />
    
    <script type="text/javascript">
    var currentPage=$("#currentPage").val();
    
    function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		console.log(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/faq/getFAQList").submit();

	}
    
    function fncJsonGetList(currentPage) {
    	$.ajax({
    			url:"/faqRest/json/getFAQList/" +currentPage,
    			method:"GET",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(data) {
				console.log(data)
				$('#table').html(data);
				}
		});
    }
	
	$(function() {	
		
		var faqNo=$(this).data("param1");
		 $(".title").on("click",function(){
			/* alert("클릭됨?") */			
			var faqNo=$(this).data("param1");
			$(".hide"+faqNo).toggleClass("show");
        }); 
		
		$("a:contains('글쓰기')" ).on("click" , function() {
			 self.location = "/faq/addFAQ";
		 });
		 
		$("a:contains('수정하기')" ).on("click" , function() {
			var faqNo =$(this).data("param2");
			self.location = "/faq/updateFAQ?faqNo="+faqNo;
		 });
		
		$("a:contains('삭제하기')" ).on("click" , function() {
			var faqNo =$(this).data("param2");
			alert("asd");
			 self.location = "/faq/deleteFAQ?faqNo="+faqNo;
		 });
		
		$("button:contains('검색')" ).on("click" , function() {
			fncGetList(1);
		 });
 	});
	</script>

	<style>
			.title{cursor:pointer;}
	</style>
    
</head>

<body class="index-page sidebar-collapse">
<form name="lisfFAQ">
	<jsp:include page="/common/toolbar2.jsp"></jsp:include>
	
	  <div class="page-header header-filter clear-filter purple-filter" data-parallax="true">
	    <div class="container">
	      <div class="row">
	        <div class="col-md-8 ml-auto mr-auto">
	          <div class="brand">
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	  
  <div class="main main-raised">
    <div class="section section-basic">
      <div class="container">
		 	
		 	<span>Home/FAQ</span>
		 	<h2 style="margin-top:-0.3%">고객센터</h2>
		 			 	
		 	<br/><br/><br/><br/>
		 	
			<div class="row searchFAQ" style="margin:0 auto; ">
				<div class="col-md-7" style="margin-left:15%; ">	
					<label style="margin-left:20%">소중한 문의에 감사드리며, 성심성의껏 답변해드리겠습니다.</label>
					<div class="input-group">
					    <div class="input-group-prepend">
					      <span class="input-group-text">
					        <i class="fa fa-group"></i>
					      </span>
					    </div>
					    <input type="text" class="form-control" >
					  </div>
				</div>
				<div class="col-md-1" style="margin-top:1%;">
					<button type="submit" class="btn btn-primary">검색</button>
				</div>
			</div>
			
			<br/><br/><br/><br/><br/><br/>
			
			<div class="row" style="margin-left:19%" >
				<div class="card" style="width: 20rem;">
				  <img class="card-img-top" src="https://images.unsplash.com/photo-1517303650219-83c8b1788c4c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=bd4c162d27ea317ff8c67255e955e3c8&auto=format&fit=crop&w=2691&q=80" alt="Card image cap">
				  <div class="card-body">
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				  </div>
				</div>
				<div class="card" style="width: 20rem; margin-left:2.4%;">
				  <img class="card-img-top" src="https://images.unsplash.com/photo-1517303650219-83c8b1788c4c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=bd4c162d27ea317ff8c67255e955e3c8&auto=format&fit=crop&w=2691&q=80" alt="Card image cap">
				  <div class="card-body">
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				  </div>
				</div>
			</div>
			<div class="row" style="margin-top: -2.5%; margin-left:19%;">
				<div class="card" style="width: 20rem;">
				  <img class="card-img-top" src="https://images.unsplash.com/photo-1517303650219-83c8b1788c4c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=bd4c162d27ea317ff8c67255e955e3c8&auto=format&fit=crop&w=2691&q=80" alt="Card image cap">
				  <div class="card-body">
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				  </div>
				</div>
				<div class="card" style="width: 20rem; margin-left:2.5%;">
				  <img class="card-img-top" src="https://images.unsplash.com/photo-1517303650219-83c8b1788c4c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=bd4c162d27ea317ff8c67255e955e3c8&auto=format&fit=crop&w=2691&q=80" alt="Card image cap">
				  <div class="card-body">
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				  </div>
				</div>
			</div>
			
			<br/><br/><br/>
			
			<hr style="margin-bottom:-0.1%;">
			<ul class="nav justify-content-center" >
			  <li class="nav-item">
			    <a class="nav-link active" >FAQ</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-toggle="tooltip" data-placement="right" title="QNA로 이동합니다">1:1 QNA</a>
			  </li>
			</ul>
			<hr style="margin-top:0.1%;">
		
			<br/><br/>
		    
		    <div id="table">
				<jsp:include page="../FAQ/FAQTable.jsp"/>
			</div>
			
			<div>
				<c:if test="${role == 0}">
					<button class="btn btn-primary btn-round btn-sm" style="left: 95%;">글쓰기</button>
				</c:if>
			</div>
      </div>
    </div>
  </div>
  </form>
  <jsp:include page="/common/footer.jsp"></jsp:include>
  
  
</body>

</html>