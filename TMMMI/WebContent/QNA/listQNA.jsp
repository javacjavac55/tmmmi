<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
<!--  Fonts and icons -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link href="/css/template/material-kit.css" rel="stylesheet" />

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	    
    <script type="text/javascript">
    
	////////////////////////////////FAQ로 이동
    $(function() {	
    	$("#faq").on("click",function(){	
    		//alert("FAQ로 이동")
			self.location = "/faq/getFAQList";
	    });
    });
	
	////////////////////////////////문의글 작성페이지로 이동
    $(function() {	
    	$( "button:contains('1:1 문의하기')" ).on("click" , function() {
    		//alert("문의글 작성페이지로 이동")
    		self.location = "/qna/addQNA";
	    });
    });
	
	////////////////////////////////get QNA로 이동
    $(function() {	
    	$(".QNAtitle" ).on("click" , function() {
    		//alert("get QNA")
    		var qnaNo =$(this).data("param1");
    		//console.log(qnaNo)
			self.location = "/qna/getQNA?qnaNo="+qnaNo;
	    });
    });
	
	////////////////////////////////페이지 네비게이터
    function fncGetList(currentPage) {
    	$.ajax({
    			url:"/qnaRest/json/getQNAList/" +currentPage,
    			method:"GET",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(data) {
				console.log("abc"+data);
				$('#table').html(data);
				}
		});
    }
	
</script>

<style>
		.QNAtitle {
			cursor:pointer;
		}
		/* .finish{background-color: whitesmoke} */
</style>

</head>

<body class="index-page sidebar-collapse">
<form>

<jsp:include page="/common/toolbar2.jsp"></jsp:include>
  <div class="page-header header-filter clear-filter" style="height:55vh; background-image: url('/images/weather/4016924c4eb809d80e5ac60ad0703088.jpg');">
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
      	
      	<span>Home/QNA</span>
		 	<h2 style="margin-top:-0.3%">고객센터</h2>
		 	
		 	<hr style="margin-bottom:-0.1%;">
			<ul class="nav justify-content-center" >
			  <li class="nav-item">
			    <a class="nav-link active"  id="faq" style="cursor:pointer;" data-toggle="tooltip" data-placement="left" title="FAQ로 이동합니다">FAQ</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link"  >1:1 QNA</a>
			  </li>
			</ul>
			<hr style="margin-top:0.1%;">
		 	
		 	<div id="table">
				<jsp:include page="../QNA/QNATable.jsp"/>
			</div>
		 			 	
		<button type="button"  class="btn btn-primary btn-round btn-sm" style="left: 95%;">1:1 문의하기</button>
		
      </div>
    </div>
  </div>
  
  </form>
  <jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>

</html>