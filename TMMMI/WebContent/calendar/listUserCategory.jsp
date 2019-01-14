<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>listUserCategory</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/javascript/colorPicker/farbtastic.js"></script>
<link rel="stylesheet" href="/css/colorPicker/farbtastic.css" type="text/css" />
<script>
	function updateUserCategory(){
		alert("수정");
		
		console.log($("#userCategoryNo").val());
    	console.log($("#userCategoryName").val());
    	console.log($("#userCategoryColor").val());
		
		$.ajax({
			url : "/calendarRest/updateUserCategory",
			method : "POST",
			data: JSON.stringify({
				userCategoryNo:$("#userCategoryNo").val(),
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
				$('#userCategoryInfo'+$("#userCategoryNo").val()).html("<span class='dot' data-param1='"+$('#userCategoryNo').val()+"' data-param2='"+$('#userCategoryName').val()+"' data-param3='"+$('#userCategoryColor').val()+"' style='background-color:"+$('#userCategoryColor').val()+"'></span> "+$('#userCategoryName').val());
				
			}
		});	
	};
	
	function deleteUserCategory(){
		alert("삭제");
		
		console.log($("#userCategoryNo").val());
    	console.log($("#userCategoryName").val());
    	console.log($("#userCategoryColor").val());
		
		$.ajax({
			url : "/calendarRest/deleteUserCategory",
			method : "POST",
			data: JSON.stringify({
				userCategoryNo:$("#userCategoryNo").val(),
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
				$('#userCategoryInfo'+$("#userCategoryNo").val()).remove();
			}
		});	
	};
	
	$(function(){
		var f = $.farbtastic('#picker');
	    f.linkTo($('#userCategoryColor'));
	    
	    $('.dot').on("click", function(){
	    	var userCategoryNo = $(this).data("param1");
	    	var userCategoryName = $(this).data("param2");
	    	var userCategoryColor = $(this).data("param3");
	    	
	    	$('#userCategoryNo').val(userCategoryNo);
	    	$('#userCategoryName').val(userCategoryName);
	    	$('#userCategoryColor').val(userCategoryColor);
	    	
			$('#updateForm').attr("style","display:block;");
		});
	    
	    $('.dot').each(function(){
	    	var userCategoryColor = $(this).data("param3");	    	
			$(this).attr("style","background-color:"+userCategoryColor);
		});
	    
	    $('#updateBtn').on("click",function(){
	    	$('#updateForm').attr("style","display:none;");
	    	updateUserCategory();
	    })
	    
	     $('#deleteBtn').on("click",function(){
	    	$('#updateForm').attr("style","display:none;");
	    	deleteUserCategory();
	    })
	    
	    $('#cancelBtn').on("click",function(){
	    	$('#updateForm').attr("style","display:none;");
	    })
	})
</script>
<style>
	.dot {
	  height: 25px;
	  width: 25px;
	  border-radius: 50%;
	  display: inline-block;
	}
	
	.form-popup {
	  display: none;
	  position: fixed;
	  bottom: 0;
	  right: 15px;
	  border: 3px solid #f1f1f1;
	  z-index: 9;
	}
	
	.form-container {
	  max-width: 300px;
	  padding: 10px;
	  background-color: white;
	}
	
	.form-container input[type=text] {
	  width: 60%;
	  padding: 15px;
	  margin: 5px 0 22px 0;
	  border: none;
	  background: #f1f1f1;
	}
	
	.form-container input[type=text]:focus {
	  background-color: #ddd;
	  outline: none;
	}
	
	.form-container .btn {
	  background-color: #4CAF50;
	  color: white;
	  padding: 16px 20px;
	  border: none;
	  cursor: pointer;
	  width: 100%;
	  margin-bottom:10px;
	  opacity: 0.8;
	}
</style>
</head>
<body>
	<div>
		<div>
			<c:set var="i" value="0" />
			<c:forEach var="userCategory" items="${userCategoryList}">
				<c:set var="i" value="${ i+1 }" />
				<div id="userCategoryInfo${ userCategory.userCategoryNo }"><span class="dot" data-param1="${ userCategory.userCategoryNo }" data-param2="${ userCategory.userCategoryName }" data-param3="${ userCategory.userCategoryColor }"></span> ${ userCategory.userCategoryName } </div>
			</c:forEach>
			
			<div class="form-popup" id="updateForm">
			  <form class="form-container">
			    <h1>Update</h1>
			    <div id="picker"></div>
			    <input type="hidden" id="userCategoryNo" name="userCategoryNo" value="" required/>
			
			    <label for="userCategoryName"><b>카테고리 이름: </b></label>
			    <input type="text" id="userCategoryName" name="userCategoryName" value="" required>
			
			    <label for="userCategoryColor"><b>카테고리 색상: </b></label>
			    <input type="text" id="userCategoryColor" name="userCategoryColor" value="" required>
			
			    <button type="button" id="updateBtn">수정</button>
			    <button type="button" id="deleteBtn">삭제</button>
			    <button type="button" id="cancelBtn">취소</button>
			  </form>
			</div>
		</div>
	</div>
</body>
</html>