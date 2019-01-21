<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>유저 키워드</title>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- styleSheet -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<!-- userKeyword Ajax -->
	<script type="text/javascript">
	$(function(){
		var currentPage = ${resultPage.currentPage};
		var menu = getParameterByName('menu');
		console.log(menu)
		console.log($(window).scrollTop()+" "+$(document).height()+" "+$(window).height());
		console.log(currentPage+" "+$("#searchCondition").val()+" "+$("#searchKeyword").val()+" "+$("#priceOrder").val());
		
		$(window).scroll(function() { 
			if($(window).scrollTop() == $(document).height() - $(window).height()){
				++currentPage;
				console.log($(window).scrollTop()+" "+$(document).height()+" "+$(window).height());
				var data = {currentPage:currentPage, searchCondition:$("#searchCondition").val(), searchKeyword:$("#searchKeyword").val(), priceOrder:$("#priceOrder").val()}
				/* if( menu == 'search'){  */
					$.ajax({
						url : "/contentRest/getContentList",
						method : "POST",
						data : JSON.stringify(data),
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status){
							console.log(JSONData);
							var list = JSONData['list'];
							console.log(list)
							
						}
					});
				/* } */
			}
		});
	})
	</script>
</head>
<body>
	<div id="container">
		<div class="row">
			<div class="container">
			<c:forEach var="userKeyword" items="${list }" >
				<div  style="width:200px; height:150px; border:1px solid red; float:left; margin-right:10px;">
					<img src="resources/images/diaryImage/1547701429773.jpeg" style="height:200px;"/>
					<div class="caption">
						<h3>${userKeyword.title }</h3>
					</div>
				</div>
			</c:forEach>
			</div>		
		</div>
	</div>
</body>
</html>