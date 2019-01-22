<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <% 	Product product = (Product)request.getAttribute("product");
	System.out.println(product);
	User user = (User)request.getSession().getAttribute("user");
	System.out.println(user);
	
%> --%>

<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- 부트스트랩, 제이쿼리 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.js"></script>

<!-- summernote -->
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="/css/summernote/summernote.css" rel="stylesheet">
<script src="/javascript/summernote/summernote.js"></script>

<!-- 로딩 -->
<link rel="stylesheet" href="/css/summernote/loading.css">
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->
<script src="/javascript/summernote/loading.js"></script>

<link rel="stylesheet" href=/css/template/main.css>
<link rel="stylesheet" href="assets/css/main.css" />
<script type="text/javascript">
	/* function postForm() {
	    $('textarea[name="diaryDetail"]').val($('#summernote').summernote('code'));
	} */
	/* function fncLoading(){
		  $(".loading").fakeLoader({
		    timeToHide:3000, // 로딩중에 걸리는 시간, 1000은 1초
		    bgColor:"#2ecc71", // 배경색
		    spinner:"spinner2" // 로딩중으로 원하는 로딩이미지타입
	})};  */

	var $note = null;
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
							}, 4000);

						}
					});
				}
			}

		});
		/* $('textarea[name="Contents"]').html($('.summernote').code()); */
	});

	/* function senFIle(file, el){
		var form_data = new FormData();
		form_data.append('file', file)
		
	} */

	function fncAddDiary() {
		document.addDiary.submit();
		$('form[name="addDiary"]').attr("method", "POST").attr("enctype",
				"multipart/form-data").attr("action", "/diary/addDiary")
				.submit();
	}

	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		$("button.btn.btn-primary").on("click", function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('확인')" ).html() );
			fncAddDiary();
		});

		$("a.btn.btn-primary").on("click", function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('추가등록')" ).html() );
			history.go(-1);
		});
	});
</script>
</head>


<body>
	<form name="addDiary" class="form-horizontal">
		<div class="navbar  navbar-default">
			<div class="container">
				<a class="navbar-brand" href="/index.jsp">Tmmmi</a>
			</div>
		</div>

		<h1 class="bg-primary text-center">다이어리 등 록</h1>



		<div class="form-group">
			<label for="userCategoryNo"
				class="col-sm-offset-1 col-sm-3 control-label text-center">유저카테고리</label>
			<div class="col-sm-4">
				<input type="text" name="userCategoryNo" class="form-control"
					placeholder="유저카테고리." />

			</div>
		</div>
		<hr />

		<div class="form-group">
			<label for="diaryTitle"
				class="col-sm-offset-1 col-sm-3 control-label text-center">제목</label>
			<div class="col-sm-4">
				<input type="text" name="diaryTitle" class="form-control"
					placeholder="제목" />
			</div>
		</div>
		<hr />
		<div class="form-group">
			<label for="diaryDetail"
				class="col-sm-offset-1 col-sm-3 control-label text-center">내용</label>
			<div class="col-sm-4">
				<textarea id="summernote" name="diaryDetail" style="display: none;"></textarea>
			</div>
		</div>

		<hr />


		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">

				<button type="button" class="btn btn-primary">등록</button>
				<a class="btn btn-primary" href="#" role="button">취&nbsp;소</a>
			</div>
		</div>


	</form>
</body>
</html>