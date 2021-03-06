
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Tmmmi</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
<!--  Fonts and icons -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- CSS Files -->
<link href="/css/template/material-kit.css" rel="stylesheet" />

<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/css/template/demo.css" rel="stylesheet" />

<!--ckeditor  -->
<!-- <script src="/ckeditor/ckeditor.js"></script> -->
<script src="//cdn.ckeditor.com/4.7.3/full/ckeditor.js"></script>
<!-- <script type="text/javascript" src="/ckeditor/ckeditor.js"></script> -->

<!--sweet alert -->
<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script >

<!-- 로딩 -->
<!-- <link rel="stylesheet" href="/css/summernote/loading.css"> -->
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->
<!-- <script src="/javascript/summernote/loading.js"></script> -->

<!-- <link href="/css/summernote/summernote.css" rel="stylesheet"> -->
<!-- <script src="/javascript/summernote/summernote.js"></script> -->

<script type="text/javascript">
	/* function postForm() {
	    $('textarea[name="diaryDetail"]').val($('#summernote').summernote('code'));
	} */
	/* function fncLoading(){
		  $(".loading").fakeLoader({
		    timeToHide:3000, // 로딩중에 걸리는 시간, 1000은 1초
		    bgColor:"#2ecc71", // 배경색
		    spinner:"spinner2" // 로딩중으로 원하는 로딩이미지타입
	})}; */

	/* var $note = null;
	$(document).ready(function() {

		$('#summernote').summernote({
			height : "200px",
			width : "500px",
			minHeight : null,
			maxHeight : null,
			focus : true,
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					console.log(files);
					console.log(files[0]);
					var form_data = new FormData();
					form_data.append("file", files[0]);

					$note = $(this);
					console.log("abcd");
					$.ajax({
						data : form_data,
						type : "POST",
						url : '/diaryRest/imageDiary',
						cache : false,
						contentType : false,
						enctype : 'multipart/form-data',
						processData : false,
						success : function(url) {
							console.log("hi");
							isloading.start();
							setTimeout(function() {
								$note.summernote('insertImage', url);
								isloading.stop();
							}, 4250);

						}
					});
				}
			}

		});
		 $('textarea[name="Contents"]').html($('.summernote').code()); 
	}); */
	/* function senFIle(file, el){
		var form_data = new FormData();
		form_data.append('file', file)
		
	} */
	$(function() {
		<c:set var="data" value="${userCategory}" />		
		<c:if test="${empty data}">
			swal({
				title : "사용자 카테고리가 없습니다." , 
				text: "사용자 카테고리를 먼저 등록 해주세요. \n 사용자 카테고리 등록 페이지로 이동합니다." , 
				icon : "success" , 
			}).then((value)=>{
				location.replace('/calendar/getUserCategoryList');
			});
		</c:if>		
	});
		
		
	function fncAddDiary() {
		var title=$("input[name='diaryTitle']").val();
		var detail=CKEDITOR.instances.ckeditor.getData();
		var userCategoryNo = $("select[name='userCategoryNo']").val();
		
		if(userCategoryNo =="없음"){
			swal({
				  title: "오류",
				  text: "카테고리를 선택해주세요.",
				  icon: "warning",
				  dangerMode: true,
				})
			return;
		}
		if(title == null || title =="" || title.length >30){
			swal({
				  title: "제목을  꼭 입력해주세요",
				  text: "제목은 30자 이상 넘어가면 안됩니다.",
				  icon: "warning",
				  dangerMode: true,
				})
			return;
		}
		if(detail == null || detail ==""){
			swal({
				  title: "오류",
				  text: "내용을 입력해주세요.",
				  icon: "warning",
				  dangerMode: true,
				})
			return;
		} 
		
		swal({
			title : "등록 완료" , 
			text: "다이어리가 등록되었습니다. 다이어리를 관리해보세요!" , 
			icon : "success" , 
		}).then((value)=>{
			$('form[name="addDiary"]').attr("method", "POST").attr("enctype","multipart/form-data").attr("action", "/diary/addDiary").submit();
		});
		
	}

	$(function() {
		$("button.btn.btn-primary").on("click", function() {
			fncAddDiary();
		});

		$("a.btn.btn-primary").on("click", function() {
			self.location = "/diary/getDiaryList";
		});
	});
</script>
</head>

<body class="index-page sidebar-collapse">
	<jsp:include page="/common/topMenu.jsp"></jsp:include>
	<div class="page-header header-filter clear-filter" data-parallax="true" style="background-image: url('/images/userSetting/ ${userSetting.image}')">
		
		<div class="container">
			<div class="row">
				<div class="col-md-8 ml-auto mr-auto">
					<div class="brand">
						<h2 class="title">Diary</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="main main-raised">
		<div class="section section-basic">
			<div class="container">
				<div align="center">
					<!-- Wrapper -->
					<div id="wrapper">
						<!-- Main -->
						<div id="main">
							<form name="addDiary" class="form-horizontal">
							
								<div class="form-group" align="left">
									<label for="userCategoryNo" class="col-sm-offset-1 col-sm-1 control-label text-center"></label>
									<h3>다이어리를 등록해주세요</h3>	
									<div class="col-sm-4">
																		
									</div>
								</div>								
								
								
								<div class="form-group" align="left">
									<label for="userCategoryNo" class="col-sm-offset-3 col-sm-3 control-label text-left">카테고리 선택</label>
									<div class="col-sm-4">
										<select class="form-control" name="userCategoryNo" >
													<option selected="selected" value="없음">선택</option>
											<c:forEach var="userCategory" items="${userCategory}">
												<c:set var="i" value="${i+1}" />
										    		<option value="${userCategory.userCategoryNo}" data-ucn="${userCategory.userCategoryName}">${userCategory.userCategoryName}</option>
										    </c:forEach>
									    </select>
								    </div>
								</div>
								
								<div class="form-group" align="left">
									<label for="diaryTitle" class="col-sm-offset-1 col-sm-1 control-label text-center"></label>
									<div class="col-sm-4">
										<input type="text" name="diaryTitle" class="form-control" placeholder="제목" />
									</div>
								</div>
								
								<div>
									<label for="diaryDetail" class="col-sm-offset-1 col-sm-3 control-label text-center"></label>
									<div class="col-sm-12" align="center"  style="max-width=100%;">
										<textarea id="ckeditor" name="diaryDetail" style="display: none;"></textarea>
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-offset-4  col-sm-4 text-center">
										<button type="button" class="btn btn-primary">등록</button>
										<a class="btn btn-primary" href="#" role="button">취소</a>
									</div>
								</div>
							</form>
						</div>
					</div>	
				</div>
			</div>
		</div>
	</div>
	<hr />
	<%-- <jsp:include page="/common/footer.jsp"></jsp:include> --%>
	<jsp:include page="/common/footer.jsp"></jsp:include>
	<script>
	
		CKEDITOR.replace('ckeditor', {//해당 이름으로 된 textarea에 에디터를 적용
			/* extraPlugins: 'autoembed,embedsemantic,image2,uploadimage,uploadfile',
			removePlugins: 'image', */
			width : '100%',
			height : '700PX',
			filebrowserImageUploadUrl : '/diary/imageDiary'
		});

		CKEDITOR.on('dialogDefinition', function(ev) {
			var dialogName = ev.data.name;
			var dialogDefinition = ev.data.definition;

			switch (dialogName) {
			case 'image': //Image Properties dialog
				//dialogDefinition.removeContents('info');
				dialogDefinition.removeContents('Link');
				dialogDefinition.removeContents('advanced');
				break;
			}
		});
	</script>
	
</body>
</html>