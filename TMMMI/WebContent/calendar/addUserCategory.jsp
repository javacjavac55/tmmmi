<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>addUserCategory</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="/javascript/colorPicker/farbtastic.js"></script>
	<link rel="stylesheet" href="/css/colorPicker/farbtastic.css" type="text/css" />
	<script type="text/javascript" charset="utf-8">
		function addUserCategory(){
			alert("����");
			$.ajax({
				url : "/calendarRest/addUserCategory",
				method : "POST",
				data: JSON.stringify({
					userCategoryName:$("#userCategoryName").val(),
					userCategoryColor:$("#userCategoryColor").val()
				}),
				dataType: "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status) {
					console.log(JSONData);
					$('#result').html("�߰� �Ϸ�");
				}
			});	
		};
		
		$(function() {
		    var f = $.farbtastic('#picker');
		    f.linkTo($('#userCategoryColor'));
		    
		    $('#submitBtn').on("click", function(){
		    	addUserCategory();
		    });
		    
		    $('#listBtn').on("click", function(){
		    	$(self.location).attr("href","/calendar/getUserCategoryList");
		    });
		});
	</script>
	<style>
		.main {
			width: 500px;
		}
		#picker {
			float: right;
		}
	</style>
</head>
<body>
	<div class="main">
		<div id="picker"></div>
		<div><label for="userCategoryName">ī�װ� �̸�: </label><input id="userCategoryName" name="userCategoryName"></input></div>
		<br/>
		<div><label for="userCategoryColor">ī�װ� ����: </label><input id="userCategoryColor" name="userCategoryColor" value="#9c27b0"></input></div>
		<br/>
		<div id="result"></div>
		<button id="submitBtn" type="button">�߰�</button>
		<br/>
		<button id="listBtn" type="button">����Ʈ</button>
	</div>
</body>
</html>