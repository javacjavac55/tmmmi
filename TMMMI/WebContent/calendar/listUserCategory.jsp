<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
<!--  Fonts and icons -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link href="/css/template/material-kit.css" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/css/template/demo.css" rel="stylesheet" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>listUserCategory</title>
<script type="text/javascript" src="/javascript/colorPicker/farbtastic.js"></script>
<link rel="stylesheet" href="/css/colorPicker/farbtastic.css" type="text/css" />

<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	function addUserCategory(){
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
				if (JSONData != -1) {
					swal({
						title : "등록 완료 " , 
						text: "카테고리를 성공적으로 등록했습니다" , 
						icon : "success" , 
					}).then((value) => {
						if ($('.user-category-item').length){
						$('.user-category-item').last().after(
								'<div class="user-category-item">'+
								'<button class="btn btn-fab btn-round dot" id="userCategoryInfo'+JSONData+'"'+
								'data-param1="'+JSONData+
								'" data-param2="'+$('#userCategoryName').val()+
								'" data-param3="'+$('#userCategoryColor').val()+
								'" style="background-color:'+$("#userCategoryColor").val()+'"></button><br/><span>'+
								$('#userCategoryName').val()+'</span></div>');
						} else {
							$('.profile.category-list-area').html('');
							$('.profile.category-list-area').html(
									'<div class="user-category-item">'+
									'<button class="btn btn-fab btn-round dot" id="userCategoryInfo'+JSONData+'"'+
									'data-param1="'+JSONData+
									'" data-param2="'+$('#userCategoryName').val()+
									'" data-param3="'+$('#userCategoryColor').val()+
									'" style="background-color:'+$("#userCategoryColor").val()+'"></button><br/><span>'+
									$('#userCategoryName').val()+'</span></div>');
						}
						$('#cancelBtn').click();
					});
				} else {
					swal({
						title : "등록 오류" , 
						text: "같은 이름과 색상의 카테고리는 등록하실 수 없습니다. 다른 이름과 색상을 선택해주세요" , 
						icon : "error" , 
					}).then((value) => {
					});
				}
			}
		});	
	};
	
	function updateUserCategory(){		
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
				if (JSONData != -1) {
					swal({
						title : "수정 완료 " , 
						text: "카테고리를 성공적으로 수정했습니다" , 
						icon : "success" , 
					}).then((value) => {
						$('#userCategoryInfo'+$("#userCategoryNo").val()).parent().html(
								'<div class="user-category-item">'+
								'<button class="btn btn-fab btn-round dot" id="userCategoryInfo'+$("#userCategoryNo").val()+'"'+
								'data-param1="'+$("#userCategoryNo").val()+
								'" data-param2="'+$('#userCategoryName').val()+
								'" data-param3="'+$('#userCategoryColor').val()+
								'" style="background-color:'+$("#userCategoryColor").val()+'"></button><br/><span>'+
								$('#userCategoryName').val()+'</span></div>');
					});
				} else {
					swal({
						title : "수정 오류" , 
						text: "같은 이름과 색상의 카테고리는 등록하실 수 없습니다. 다른 이름과 색상을 선택해주세요" , 
						icon : "error" , 
					}).then((value) => {
					});
				}
			}
		});	
	};
	
	function deleteUserCategory(){
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
				swal({
					title : "삭제 완료 " , 
					text: "카테고리를 성공적으로 삭제했습니다" , 
					icon : "success" , 
				}).then((value) => {
					$('#userCategoryInfo'+$("#userCategoryNo").val()).parent().remove();
					$('#cancelBtn').click();
					$('.profile.category-list-area').html('<p><span>등록된 카테고리가 없습니다</span></p>');
				});
			}
		});	
	};
	
	$(function(){
		var f = $.farbtastic('#picker');
	    f.linkTo($('#userCategoryColor'));
	    
	    $(document).on("click", '.dot', function(){
	    	var userCategoryNo = $(this).data("param1");
	    	var userCategoryName = $(this).data("param2");
	    	var userCategoryColor = $(this).data("param3");
	    	
	    	$('#userCategoryNo').val(userCategoryNo);
	    	$('#userCategoryName').val(userCategoryName);
	    	$('#userCategoryColor').val(userCategoryColor);
	    	f.setColor(userCategoryColor);
	    	
	    	$('#updateBtn').attr("style","display:inline-block;");
		    $('#deleteBtn').attr("style","display:inline-block;");
		    $('#submitBtn').attr("style","display:none;");
		    $('.form-title').text('카테고리 수정');
		});
	    
	    $('.dot').each(function(){
	    	var userCategoryColor = $(this).data("param3");	    	
			$(this).attr("style","background-color:"+userCategoryColor);
		});
	    
	    $('#updateBtn').attr("style","display:none;");
	    $('#deleteBtn').attr("style","display:none;");
	    
	    $('#submitBtn').on("click",function(){
	    	addUserCategory();
	    })
	    
	    $('#updateBtn').on("click",function(){
	    	updateUserCategory();
	    })
	    
	    $('#deleteBtn').on("click",function(){
	    	deleteUserCategory();
	    })
	    
	    $('#cancelBtn').on("click",function(){
	    	$('#userCategoryName').val('');
	    	$('#userCategoryColor').val('#eac1f0');
	    	f.setColor('#eac1f0');
	    	
	    	$('#updateBtn').attr("style","display:none;");
		    $('#deleteBtn').attr("style","display:none;");
		    $('#submitBtn').attr("style","display:inline-block;");
		    
		    $('.form-title').text('카테고리 등록');
	    })
	    
	    $('#calendar').on('click', function(){
			$(self).attr('location','/calendar/getCalendarMonth');
		});
	    
	    $('#diary').on('click', function(){
			$(self).attr('location','/diary/addDiary');
		});
	})
</script>
<style>
	.dot {
	  height: 25px;
	  width: 25px;
	  border-radius: 50%;
	  display: inline-block;
	}
	
	.category-list-area {
		text-align: center;
		justify-content: center;
		vertical-align: middle;
		border: 1px solid;
		border-color: #d5d5d5;
		margin: 1em 0;
	}
	
	.color-picker-wrapper {
		width: 100%;
		margin: 3em 0;
		text-align: center;
	}
	
	#picker {
		display: inline-block;
	}
	
	.user-category-item {
		display: inline-block;
		width: 70px;
		height: 70px;
	}
</style>
</head>
<body class="index-page sidebar-collapse">
<jsp:include page="/common/toolbar2.jsp"></jsp:include>
<div class="page-header header-filter clear-filter" data-parallax="true" style="background-image: url('/images/userSetting/ ${userSetting.image}')">
  <div class="container">
    <div class="row">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand">
          <h2 class="title">TMMMI</h2>
          <h3>Too Much, Memorable, My Information </h3>
        </div>
      </div>
    </div>
  </div>
</div>
	<div class="main main-raised">
		<div class="section section-basic">
			<div class="container">
				<div class="row">
					<div class="col-md-6 ml-auto mr-auto">
						<div class="profile category-list-area">
							<c:if test="${! empty userCategoryList}">
								<c:set var="i" value="0" />
								<c:forEach var="userCategory" items="${userCategoryList}">
									<c:set var="i" value="${ i+1 }" />
									<div class="user-category-item">
										<button class="btn btn-fab btn-round dot" id="userCategoryInfo${ userCategory.userCategoryNo }"
											data-param1="${ userCategory.userCategoryNo }" data-param2="${ userCategory.userCategoryName }" data-param3="${ userCategory.userCategoryColor }"></button><br/>
										<span>${ userCategory.userCategoryName }</span>
									</div>
									<%-- <div id="userCategoryInfo${ userCategory.userCategoryNo }"><span class="dot" data-param1="${ userCategory.userCategoryNo }" data-param2="${ userCategory.userCategoryName }" data-param3="${ userCategory.userCategoryColor }"></span> ${ userCategory.userCategoryName } </div> --%>
								</c:forEach>
							</c:if>
							<c:if test="${empty userCategoryList}">
								<p>
									<span>등록된 카테고리가 없습니다</span>
								</p>
							</c:if>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 ml-auto mr-auto">
						<div class="profile">
							
							<div class="color-picker-wrapper">
								<div id="picker"></div>
							</div>
							
							<header>
								<h4 class="form-title">카테고리 등록</h4><br/>
							</header>
							
							<div class="description text-center">
								<div class="form-group bmd-form-group">
									<label for="userCategoryName" class="bmd-label-static">카테고리 이름</label>
									<input autocomplete="off" type="text" class="form-control" id="userCategoryName" name="userCategoryName" placeholder="Name"/>
								</div>
							</div>
						  
							<div class="description text-center">
								<div class="form-group bmd-form-group">
									<label for="userCategoryColor" class="bmd-label-static">카테고리 색상</label>
									<input autocomplete="off" type="text" class="form-control" id="userCategoryColor" name="userCategoryColor" placeholder="Color" value="#eac1f0" readonly>
								</div>
								<input type="hidden" id="userCategoryNo" name="userCategoryNo" value=""/>
							</div>
							
							<div align="center">
								<button type="button" class="btn btn-primary" id="submitBtn">등록</button>
								<button type="button" class="btn btn-warning" id="updateBtn">수정</button>
								<button type="button" class="btn btn-danger" id="deleteBtn">삭제</button>
								<button type="button" class="btn btn-default" id="cancelBtn">리셋</button>
								<button type="button" class="btn btn-info" id="calendar">일정 달력 보기</button>
								<button type="button" class="btn btn-info" id="diary">다이어리 쓰기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>