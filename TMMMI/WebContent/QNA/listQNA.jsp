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

<!--  Fonts and icons -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- styleSheet -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="/css/index/assets/css/main.css" />
<link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<noscript><link rel="stylesheet" href="/css/index/assets/css/noscript.css" /></noscript>
	    
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
		
		////////////////////////////////top ��ư
	    $(function() {
	        $(window).scroll(function() {
	            if ($(this).scrollTop() > 500) {
	                $('#arrow').fadeIn();
	            } else {
	                $('#arrow').fadeOut();
	            }
	        });
	        
	        $("#arrow").click(function() {
	            $('html, body').animate({
	                scrollTop : 0
	            }, 400);
	            return false;
	        });
	    });
		
		////////////////////////////////���
		$(document).ready(function() {	    	 
			
	    	// ���� css���� �÷��� ��� ��ġ(top)���� ������ �����Ѵ�.
	    	var floatPosition = parseInt($("#floatdiv").css('top'));
	    	// 250px �̷������� �������Ƿ� ���⼭ ���ڸ� �����´�. parseInt( �� );
	     
	    	$(window).scroll(function() {
	    		// ���� ��ũ�� ��ġ�� �����´�.
	    		var scrollTop = $(window).scrollTop();
	    		var newPosition = scrollTop + floatPosition + "px";

	    		$("#floatdiv").stop().animate({
	    			"top" : newPosition
	    		}, 500);
	    	}).scroll();
	    });
	
		
		////////////////////////////////
	    $(function() {	
	    	$(".users").on("click",function(){	
	    		//alert("���� ī�װ��� ����")
				self.location = "/faq/getFAQList?searchCondition=1";
		    });
	    });
		
		////////////////////////////////
	    $(function() {	
	    	$(".calendar").on("click",function(){	
	    		//alert("1:1���Ƿ� �̵�")
				self.location = "/faq/getFAQList?searchCondition=2";
		    });
	    });
	    
		////////////////////////////////
	    $(function() {	
	    	$(".content").on("click",function(){	
	    		//alert("1:1���Ƿ� �̵�")
				self.location = "/faq/getFAQList?searchCondition=3";
		    });
	    });
	    
		////////////////////////////////
	    $(function() {	
	    	$(".diary").on("click",function(){	
	    		//alert("1:1���Ƿ� �̵�")
				self.location = "/faq/getFAQList?searchCondition=4";
		    });
	    });
		
</script>

<style>

		.QNAtitle {
			cursor:pointer;
		}
		
		/* ��� */
	 	#floatdiv {
			position: absolute;
		    height: 360px;
		    right:-20px;
		    color: #fff;
		}		
		
		/* ��� �̹��� */
		.tiles article > a{
			color:#3a2a64;
			background-color:#ffffff;
		}
		.tiles article > a:hover{
			color: #f2849e !important;
			background-color:#ffffff;
		}
		.tiles article.style1 > .image:before, .tiles article.style2 > .image:before, .tiles article.style3 > .image:before, .tiles article.style4 > .image:before,
		.tiles article.style5 > .image:before, .tiles article.style6 > .image:before {;
			background-color:#ffffff;
		}
		
		button{
			color:white !important;
		}
</style>

</head>

<body class="index-page sidebar-collapse">
<form>

<jsp:include page="/common/toolbar2.jsp"></jsp:include>
  <div class="page-header header-filter clear-filter" style="background-image: url('/images/userSetting/ ${userSetting.image}')">
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
      		
      		 <!-- ��� -->
			<iframe id="floatdiv" src="/widget/getWeather.jsp" style="border-color: rgb(0,0,0,0);"></iframe>
		
			<div style="margin-top: -35px;">
      			<img src="/images/common/star.png" width="2%"/>
	      		<span>Home / CustomerCenter</span> <br><br>
	      	</div>
			 	
			 	<br><br>
			 	
			 	<section class="tiles" style="cursor:pointer; margin-top: -30px;">
					<article class="style5 users" style="width:243px;">
						<span class="image">
							<img src="/css/index/images/pic05.jpg" alt="" />
						</span>
						<a>
							<h4>User</h4><br/>
							<img src="/images/loginIndex/find-my-friend.png" width="20%"/>
							<div class="content">
								<p>Check my information</p>
							</div>
						</a>
					</article>
					<article class="style1 calendar" style="width:243px;">
						<span class="image">
							<img src="/css/index/images/loginIndex.png" alt="" />
						</span>
						<a>
							<h4>Calendar</h4><br/>
							<img src="/images/loginIndex/calendar.png" width="20%"/>
							<div class="content">
								<p>Schedule Management</p>
							</div>
						</a>
					</article>
					<article class="style2 content" style="width:243px;">
						<span class="image">
							<img src="/css/index/images/pic02.jpg" alt="" />
						</span>
						<a>
							<h4>Content</h4><br/>
							<img src="/images/loginIndex/sharing-content.png" width="20%"/>
							<div class="content">
								<p>Collect Interest</p>
							</div>
						</a>
					</article>
					<article class="style3 diary" style="width:243px;">
						<span class="image">
							<img src="/css/index/images/pic03.jpg" alt="" />
						</span>
						<a>
							<h4>Diary</h4><br/>
							<img src="/images/loginIndex/diary.png" width="20%"/>
							<div class="content">
								<p>Leave an appreciation for the day</p>
							</div>
						</a>
					</article>		
				</section>	
				
				<br/><br/>
				
				<hr style="margin-bottom:-0.1%;">
				<ul class="nav justify-content-center" >
				  <li class="nav-item">
				    <a class="nav-link active"  id="faq" style="cursor:pointer;" data-toggle="tooltip" data-placement="left" title="FAQ�� �̵��մϴ�" onMouseover="this.style.color='#9124a3';" onMouseout="this.style.color='black';">FAQ</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link"  >1:1 QNA</a>
				  </li>
				</ul>
				<hr style="margin-top:1%;">

			
			 	<div id="table">
					<jsp:include page="../QNA/QNATable.jsp"/>
				</div>
			 	
			 <div class="row"></div>		 	
				<button type="button"  class="btn btn-primary btn-round btn-sm" style="left: 90%;">1:1 �����ϱ�</button>
				<a style="cursor:pointer;" id="arrow" >	Back To Top</a>
			</div>	
	      <br/><br/><br/><br/>
      
      </div>      
    </div>
  </div>
  </form>
  <jsp:include page="/common/footer.jsp"></jsp:include>
</body>


</html>