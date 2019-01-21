<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--
<%
	Product product = (Product)request.getAttribute("product");
	String menu = request.getParameter("menu");
	User vo = (User) session.getAttribute("user");

	String role = "";

	if (vo != null) {
		role = vo.getRole();
	}
%>	
--%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>상품상세조회</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href=/css/template/main.css>
	<link rel="stylesheet" href="assets/css/main.css" />
	
    
   
   <style>
 		body {
            padding-top : 50px;
        }
     </style>
     
	<script type="text/javascript">	
	$( function(){
		
		$('#update').on("click", function(){
			var diaryNo = $(this).data('param1');		
			self.location="/diary/updateDiary?diaryNo="+diaryNo;			
		});
		
		$('#back').on("click", function(){	
			self.location="/diary/listDiary";			
		});
	});
	</script>
</head>
	
<body class="is-preload">
<a href="../index.jsp">Home</a>
	<div class="container">
	
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="/diary/listDiary" class="logo"><h2><strong>다이어리</strong></h2>&nbsp;&nbsp;&nbsp;<strong>유저 카테고리 :</strong>&nbsp; ${diary.userCategoryNo}</a> <p align="right"><strong>작성날짜 : </strong>${diary.diaryDate}</p>									
								</header>
							<!-- Content -->
								<section>
									<header class="main">
										<h1>${diary.diaryTitle}</h1>
									</header>
									<hr/>
									<span class="image main"><img src="images/pic11.jpg" alt="" /></span>

									<p>${diary.diaryDetail}</p>

								</section>
							
							
						</div>
						<div align="right" style="margin-left: 70%;">
							<ul class="actions" style = "margin-right: auto;">
									<li><a href="#" id="update" class="button primary" data-param1="${diary.diaryNo}">수정</a></li>
									<li><a href="#" id="back" class="button">확인</a></li>
							</ul>
						</div>						
				 	</div>	
				
		
		
		<hr/>
	</div>
		
 	<!--  화면구성 div Start /////////////////////////////////////-->
	</div>
</body>

</html>