<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />

<!-- CSS Files -->
<link href="/css/template/material-kit.css" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/css/template/demo.css" rel="stylesheet" />

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	    
    <script type="text/javascript">
    
		////////////////////////////////FAQ�� �̵�
	    $(function() {	
	    	$("#faq").on("click",function(){	
	    		//alert("FAQ�� �̵�")
				self.location = "/faq/getFAQList";
		    });
	    });
		
		////////////////////////////////���Ǳ� �ۼ��������� �̵�
	    $(function() {	
	    	$( "button:contains('1:1 �����ϱ�')" ).on("click" , function() {
	    		//alert("���Ǳ� �ۼ��������� �̵�")
	    		self.location = "/qna/addQNA";
		    });
	    });
		
		////////////////////////////////get QNA�� �̵�
	    $(function() {	
	    	$(".QNAtitle" ).on("click" , function() {
	    		//alert("get QNA")
	    		var qnaNo =$(this).data("param1");
	    		//console.log(qnaNo)
				self.location = "/qna/getQNA?qnaNo="+qnaNo;
		    });
	    });
		
		////////////////////////////////������ �׺������
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
</style>

</head>

<body class="index-page sidebar-collapse">
<form>

<jsp:include page="/common/toolbar2.jsp"></jsp:include>
  <div class="page-header header-filter clear-filter" style="background-image: url('/images/weather/4016924c4eb809d80e5ac60ad0703088.jpg');">
    <div class="container">
      <div class="row">
        <div class="col-md-8 ml-auto mr-auto">
          <div class="brand">
          <h2 class="title">QNA</h2>
          	<h3 style="margin-top:-3%" >Question and Answer</h3>
          </div>
        </div>
      </div>
    </div>
  </div>

	<div class="main main-raised">
    	<div class="section section-basic">
      		<div class="container">
      	
	      	<span>Home / CustomerCenter</span> <br><br>
			 	
			 	<hr style="margin-bottom:-0.1%;">
				<ul class="nav justify-content-center" >
				  <li class="nav-item">
				    <a class="nav-link active"  id="faq" style="cursor:pointer;" data-toggle="tooltip" data-placement="left" title="FAQ�� �̵��մϴ�" onMouseover="this.style.color='#9124a3';" onMouseout="this.style.color='black';">FAQ</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link"  >1:1 QNA</a>
				  </li>
				</ul>
				<hr style="margin-top:0.1%;">
			 	
			 	<div id="table">
					<jsp:include page="../QNA/QNATable.jsp"/>
				</div>
			 			 	
			<button type="button"  class="btn btn-primary btn-round btn-sm" style="left: 95%;">1:1 �����ϱ�</button>
			
			
	      <br/><br/><br/><br/>
      
      </div>      
    </div>
  </div>
  </form>
  <jsp:include page="/common/footer.jsp"></jsp:include>
</body>


</html>