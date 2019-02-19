<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>사용자 설정</title>
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

<!-- color picker -->
<script type="text/javascript" src="/javascript/colorPicker/farbtastic.js"></script>
<link rel="stylesheet" href="/css/colorPicker/farbtastic.css" type="text/css" />

<!-- sweetAlert -->
<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script >

<!-- style -->
<style type="text/css">
	.farbtastic{
		margin: 0 auto;
	}
</style>

<script type="text/javascript" charset="utf-8">
$(document).ready(function() {
    var f = $.farbtastic('#picker');
    var selected;
    $('.colorwell')
      .each(function () { f.linkTo(this);})
      .focus(function() {
        if (selected) {
          $(selected).removeClass('colorwell-selected');
        }
        f.linkTo(this);
        $(selected = this).css('opacity', 1).addClass('colorwell-selected');
      });
  });
</script>

<!-- 버튼 이벤트 -->
<script type="text/javascript">
$(function(){
	$("#update").on("click", function(){
		var image=$("input[name='file']").val();
		if(image == null){
			swal("이미지는 반드시 첨부하여야 합니다!", "이미지를 추가해주세요");
			return;	
		}
		swal("수정완료 하시겠습니까?", {
			 buttons: true,
			 value: true,
			}).then((result)=>{
				if (result === true) {
					$("form").attr("method" , "POST").attr("action" , "/userSetting/updateUserSetting").submit();
			      }
			}, function (dismiss) { });
		
		
	});
});
</script>

<!-- 추가된 부분 -->
<style>
	 .form-group{
		width: 100%; 
		text-align: center;
	}
	.bmd-label-static{
		width: 100%;
		text-align:center;
		display: inline-block;
	}
	#chgcolor{
		width:300px
	}
</style>

</head>
<body class="index-page sidebar-collapse">
<!-- top menu -->
<jsp:include page="/common/topMenu.jsp"></jsp:include>

<!-- page header -->
<div class="page-header header-filter clear-filter" data-parallax="true" style="background-image: url('/images/userSetting/ ${userSetting.image}')">
	<div class="container">
		<div class="row">
			<div class="col-md-8 ml-auto mr-auto">
				<div class="brand">
					<h2 class="title">UserSetting Update</h2>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- main -->
<div class="main main-raised">
	<div class="section section-basic">
	<form enctype="multipart/form-data">
		<div class="container">
			<div class="row">
				<div class="col-md-6 ml-auto mr-auto">
					<div class="profile">
				
						<div class="description text-center">
							<div class="form-group bmd-form-group">
								<label class="bmd-label-static">Main Color</label>
								<div class="form-check form-check-radio">
									<label class="form-check-label">
										<input class="form-check-input" type="radio" name="mainColorModeNo" id="mainColorModeNo0" value="0"  ${ ! empty userSetting.mainColorModeNo && userSetting.mainColorModeNo eq 0 ? "checked" : "" } >
										<div id="chgcolor" style="background-color:#000000; border:solid 1px; padding: 1.5%; font-size:15px;">
										컨텐츠 배경색 입니다.
										</div>
										<div id="chgcolor" style="background-color:#fafafa; border:solid 1px; padding: 1.2%; font-size:15px;">
										컨텐츠 폰트색 입니다.
										</div>
										<span class="circle" style="top: 19px;">
											<span class="check" ></span>
										</span>
									</label>
								</div>
								<div class="form-check form-check-radio">
									<label class="form-check-label">
										<input class="form-check-input" type="radio" name="mainColorModeNo" id="mainColorModeNo1" value="1"  ${ ! empty userSetting.mainColorModeNo && userSetting.mainColorModeNo eq 1 ? "checked" : "" }>
										<div id="chgcolor" style="background-color:#fafafa; border:solid 1px; padding: 1.2%; font-size:15px;">
										컨텐츠 배경색 입니다.
										</div>
										<div id="chgcolor" style="background-color:#000000; border:solid 1px; padding: 1.5%; font-size:15px;">
										컨텐츠 폰트색 입니다.
										</div>
										<span class="circle" >
										<span class="check"></span>
										</span>
									</label>
								</div>
							</div>
							<br/>
							
							<!-- 이미지업로드 -->
							<div>
								<input type="file" name="file" class="inputFileHidden" maxLength="13" value="${userSetting.image}" style="width: 208px;"><br/><br/>
							</div>
							
							<div class="form-group bmd-form-group">
								<label class="bmd-label-static">Menu Font Color</label>
								<div id="picker" ></div> <br>
								<div><label style="width:195px; height: 30px;" for="color1">현재 메뉴 폰트 색상:</label><input type="text" id="color1" name="color1" class="colorwell" value="${userSetting.menuFontColor}" /></div>
								<div><label style="width:195px; height: 30px;" for="menuFontColor">변경할 메뉴 폰트 색상:</label><input type="text" id="menuFontColor" name="menuFontColor" class="colorwell" value=" " /></div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 text-center ">
								<br/>
								<button type="button" class="btn btn-primary btn-round" id="update">사용자 설정 수정</button>
							</div>
						</div>
					</div>
				</div>
				</div>
			</div>
	</form>
	</div>
</div>

<!-- footer -->
<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>