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
    
	    //////////////////////////////// 검색
	    $(function() {	
	    	$( "button:contains('검색')" ).on("click" , function() {
	    		//alert("검색")
				fncGetSearchList();
			})
	    });
	    
	    function fncGetSearchList(searchKeyword) {
			var searchKeyword = $("#searchKeyword").val();
			$.ajax({
	    			url:"/faqRest/json/getFAQSearchList/",
	    			method:"POST",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					data: JSON.stringify({
						searchKeyword : $("#searchKeyword").val()
					}),
					success : function(data) {
					/* console.log(data) */
					$('#table').html(data);
					}
			});
		}
	    
		//////////////////////////////// 1:1문의로 이동
	    $(function() {	
	    	$("#qna").on("click",function(){	
	    		//alert("1:1문의로 이동")
				self.location = "/qna/getQNAList";
		    });
	    });
    
		//////////////////////////////// 수정
	    $(function() {	
	    	$( "button:contains('수정하기')" ).on("click" , function() {
	    		//alert("수정")
	    		var faqNo =$(this).data("param1");
				//console.log(faqNo)
				self.location = "/faq/updateFAQ?faqNo="+faqNo;
			})
	    });
		
		//////////////////////////////// 삭제
	    $(function() {	
	    	$( "button:contains('삭제하기')" ).on("click" , function() {
	    		//alert("삭제")
	    		var faqNo =$(this).data("param2");
				//console.log(faqNo)
				self.location = "/faq/deleteFAQ?faqNo="+faqNo;
			})
	    });
		
		//////////////////////////////// 글쓰기
	    $(function() {	
	    	$( "button:contains('글쓰기')" ).on("click" , function() {
	    		//alert("글쓰기")
				self.location = "/faq/addFAQ";
			})
	    });

		$(function() {	
			
			 /* $(".title").on("click",function(){	
				var faqNo=$(this).data("param1");
				$(".hide"+faqNo).toggleClass("show");
	        });  */
	
			 
	 	});
 	
	    
		//////////////////////////////// 페이지 네비게이터
	    function fncGetList(currentPage) {
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
	    $(document).ready(function() {
	    	 
	    	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	    	var floatPosition = parseInt($("#floatdiv").css('top'));
	    	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
	     
	    	$(window).scroll(function() {
	    		// 현재 스크롤 위치를 가져온다.
	    		var scrollTop = $(window).scrollTop();
	    		var newPosition = scrollTop + floatPosition + "px";
	     
	    		/* 애니메이션 없이 바로 따라감
	    		 $("#floatMenu").css('top', newPosition);
	    		 */
	     
	    		$("#floatdiv").stop().animate({
	    			"top" : newPosition
	    		}, 500);
	     
	    	}).scroll();
	     
	    });
	</script>

	<style>
			.title {
				cursor:pointer;
			}
			
			/* 이미지확대 */
			.rounded { 
				transform: scale(1);
				-webkit-transform: scale(1);
				-moz-transform: scale(1);
		    	-ms-transform: scale(1);
		  		-o-transform: scale(1);
		  		transition: all ease-in-out;		 
			}
			.rounded:hover {
			  transform: scale(1.05); /*이미지 hover 했을경우 transform: scale() 값을 키워 확대*/
			  -webkit-transform: scale(1.05);
			  -moz-transform: scale(1.05);
			  -ms-transform: scale(1.05);
			  -o-transform: scale(1.05);
			} 
			/* 속도조절 */
			.rounded {
				letter-spacing: 0;
				/* -webkit-transition: all .28s ease-in-out; */
				transition: all .1s ease-in-out;
			} 
			
			 #floatdiv {
	position: absolute;
	width: 320px;
	height: 200px;
	right: 50px;
	top: 50px;
	background-color: #606060;
	color: #fff;
}

		 	
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
		 	
		<embed  id="floatdiv" src="/widget/getWeather3.jsp"></embed>
		 	<span>Home/FAQ</span>
		 	<h2 style="margin-top:-0.3%">고객센터</h2>
		 			 	
		 	<br/><br/><br/><br/>
		 	
			<div class="row searchFAQ" style="margin:0 auto; " >
				<div class="col-md-7" style="margin-left:15%; ">	
					<label style="margin-left:20%">소중한 문의에 감사드리며, 성심성의껏 답변해드리겠습니다.</label>
					<div class="input-group" >
					    <div class="input-group-prepend">
					      <span class="input-group-text">
					        <i class="fa fa-group"></i>
					      </span>
					    </div>
					    <input type="text" class="form-control" name="searchKeyword" id="searchKeyword" value="${search.searchKeyword}">
					</div>
				</div>
				<div class="col-md-1" style="margin-top:1%;">
					<button type="button" class="btn btn-primary" name="searchCondition" value="0">검색</button>
				</div>
			</div>
			
			<br/><br/><br/><br/><br/><br/>
			
			<div class="row" style="margin-top:1.6%; text-align:center">
				<img src="/images/weather/photo.jpg" style="margin-left:19%; position: relative;" class="rounded float-left" >		
				 <img src="/images/weather/photo.jpg" style="margin-left:1.6%;" class="rounded float-right" >
				  
			</div>
			<div class="row" style="margin-top:1.6%; text-align:center">
				  <img src="/images/weather/photo.jpg" style="margin-left:19%;" class="rounded float-left" >
				  <img src="/images/weather/photo.jpg" style="margin-left:1.6%;" class="rounded float-right">
			</div>
			
	
			<br/><br/><br/>
			
			<hr style="margin-bottom:-0.1%;">
			<ul class="nav justify-content-center" >
			  <li class="nav-item">
			    <a class="nav-link active" >FAQ</a>
			  </li>
			  <li class="nav-item" style="cursor:pointer;">
			    <a class="nav-link" id="qna" data-toggle="tooltip" data-placement="right" title="QNA로 이동합니다">1:1 QNA</a>
			  </li>
			</ul>
			<hr style="margin-top:0.1%;">
		
			<br/>
		    
		    <div id="table">
				<jsp:include page="../FAQ/FAQTable.jsp"/>
			</div>
			
			<div>
				<c:if test="${role == 0}">
					<button type="button"  class="btn btn-primary btn-round btn-sm" style="left: 95%;">글쓰기</button>
				</c:if>
			</div>
		
		
			<br/><br/><br/><br/>
      </div>
    </div>
  </div>
  </form>
  <jsp:include page="/common/footer.jsp"></jsp:include>
</body>

</html>