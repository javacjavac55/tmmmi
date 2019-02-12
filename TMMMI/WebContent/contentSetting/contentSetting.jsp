<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>컨텐츠 설정</title>
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
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="/css/template/main.css">
	
	<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script >
		
	<!-- sortable style -->
	<style>
 		#sortable { list-style-type: none; margin: 0; padding: 0; width: 100%; }
  		#sortable li {
  			float:left;
  			width: 120px;
			padding: 5px 5px 5px 5px;
			margin: 5px 5px 5px 5px ;
			border: 2px solid #EA8A8A;
			border-radius: 5px;
			font-size: 0.9em;
			font-weight: bold;
			text-align: center;
		}
  	</style>
  	
  	<!-- sortable script -->
  	<script>
  	/* 		function viewArray(){
    var result = $('#sortable').sortable('toArray');
    console.log(result);
    alert( 'value:' + result );
    alert( 'first value:' + result[0] );
}  */
	$(function(){ 
		$("#sortable").sortable({
			update: function (event, ui) {
				getOrder();
			}
		});
		$( "#sortable" ).disableSelection();
	}); 
	
	function getOrder(){
	    var getOrder = [];
	    $('.ui-state-default.ui-sortable-handle').each(function(index){
	    	getOrder.push($( this ).attr("id")+":"+(index+1));
	    });
	    console.log(getOrder);
	}
 	</script>
 	
 	<!-- li 변경 이벤트 -->
 	<script type="text/javascript">
 	function capitalize(s)
 	{
 	    return s[0].toUpperCase() + s.slice(1);
 	}
 	
 	$(function(){
 		$(document).ready(function(){
 	 	    $(".box").change(function(){
 	 	        if($(this).is(":checked")){
 	 	        	var check = $(this).attr('id').replace("Check", "");
 	 	        	console.log("선택:"+check);
 	 	        	$('li').last().after('<li id=\''+check+'\'class="ui-state-default">'+$(this).attr('value')+'</li>')
 	 	        }else if(!($(this).is(":checked"))){
	 	 	        var check = $(this).attr('id').replace("Check", "");
	 	 	        console.log("삭제:"+check);
	 	 	        $('#'+check).remove()
 	 	        }
 	 	    });
 	 	    
 	 	  	$("input[type=text]").on("change", function(){
 	 	  		var id = $(this).attr('id').replace("Check", "");
 	 	  		var id2 = capitalize(id);
 	 	  		console.log(id2);
				if ($(this).val() == '') {
					$('#show'+id2).remove();
				} else {
					$('#show'+id2).remove();
					$('li').last().after('<li id=\'show'+id2+'\'class="ui-state-default ui-sortable-handle">'+$(this).val()+'</li>');
				}
			});
 	 	});
 	})
 	</script>
 	
 	<!-- 버튼 이벤트 -->
 	<script type="text/javascript">
 	$(function() {
		$( "button.button.primary" ).on("click" , function() {
			fncUpdateContentSetting();
		});
	});
 	$( function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#' ]").on("click" , function() {
			self.location = "/content/getContentList"
		});
	});
 	</script>
 	
 	<!-- Rest -->
 	<script type="text/javascript">
 	function fncUpdateContentSetting(){
	    
	    var result = '{';
	    $('.ui-state-default.ui-sortable-handle').each(function(index){
	    	result = result.concat('"'+$( this ).attr("id")+'":'+(index+1)+",");
	    });
	    result = result.concat('"tastyKeyword"'+':"'+$("input[name='tastyKeyword']").val()+'",');
	    result = result.concat('"shoppingSearch1"'+':"'+$("input[name='shoppingSearch1']").val()+'",');
	    result = result.concat('"shoppingSearch2"'+':"'+$("input[name='shoppingSearch2']").val()+'",');
	    result = result.concat('"shoppingSearch3"'+':"'+$("input[name='shoppingSearch3']").val()+'",');
	    result = result.concat('"shoppingReview"'+':"'+$("input[name='shoppingReview']").val()+'",');
	    result = result.concat('"userSearch1"'+':"'+$("input[name='userSearch1']").val()+'",');
	    result = result.concat('"userSearch2"'+':"'+$("input[name='userSearch2']").val()+'",');
	    result = result.concat('"userSearch3"'+':"'+$("input[name='userSearch3']").val()+'",');
	    result = result.concat('"userVideo1"'+':"'+$("input[name='userVideo1']").val()+'",');
	    result = result.concat('"userVideo2"'+':"'+$("input[name='userVideo2']").val()+'"'); 
	    result = result.concat('}'); 
	    
	    console.log(result);
	    
	    $.ajax({
	    	url : "/contentSettingRest/updateContentSetting",
	    	method : "POST",
	    	data : result,
	    	dataType : 'json',
	    	headers : {
	    		'Accept' : 'application/json',
				'Content-Type' : 'application/json'
	    	},
	    	success : function(Data){
	    		swal({
					title : "수정 완료 " , 
					text: "컨텐츠 설정을 성공적으로 수정했습니다" , 
					icon : "success" , 
				}).then((value) => {
					window.parent.fucCloseModal();
				});
	    	},
	    	error : function(request, status, error ) {  

            	console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
            	alert('수정 된 내용이 없습니다!');
            	window.location = '/content/getContentList';
            }
	    }) 
 	}
 	</script>
</head>
<body>
<div class="container"  style="text-align:center; margin:0 auto;">
	<br/><br/>
	<h2>컨텐츠 보기 여부</h2>
	<form class="form-horizontal" align="center">
		<div class="row gtr-uniform" align="left">
			<div style="float:right; width:100%; margin: 0 auto;" class="col-sm-7">
				<hr width="98%" color="#f56a6a"/>
				<div class="col-sm-2"><h4>영화</h4></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="movieBoxOfficeCheck" value="박스 오피스" ${ ! empty contentSetting.movieBoxOffice && contentSetting.movieBoxOffice >= 1 ? "checked" : "" }><label for="movieBoxOfficeCheck">박스 오피스</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="movieNewCheck" value="현재 상영영화" ${ ! empty contentSetting.movieNew && contentSetting.movieNew >= 1 ? "checked" : "" }><label for="movieNewCheck">현재 상영영화</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="movieUpcomingCheck" value="개봉 예정영화" ${ ! empty contentSetting.movieUpcoming && contentSetting.movieUpcoming >= 1 ? "checked" : "" }><label for="movieUpcomingCheck">개봉 예정영화</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="movieReviewCheck" value="영화 리뷰" ${ ! empty contentSetting.movieReview && contentSetting.movieReview >= 1 ? "checked" : "" }><label for="movieReviewCheck">영화 리뷰</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="movieTrailerCheck" value="영화 예고편" ${ ! empty contentSetting.movieTrailer && contentSetting.movieTrailer >= 1 ? "checked" : "" }><label for="movieTrailerCheck">영화 예고편</label></div>
				<hr width="98%" />
			</div>
			<div style="float:right; width:100%; margin: 0 auto;" class="col-sm-13">
				<div class="col-sm-2"><h4>스포츠</h4></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="soccerCheck" value="국내 축구" ${ ! empty contentSetting.soccer && contentSetting.soccer >= 1 ? "checked" : "" }><label for="soccerCheck">국내 축구</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="overseaSoccerCheck" value="해외 축구" ${ ! empty contentSetting.overseaSoccer && contentSetting.overseaSoccer >= 1 ? "checked" : "" }><label for="overseaSoccerCheck">해외 축구</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="baseballCheck" value="국내 야구" ${ ! empty contentSetting.baseball && contentSetting.baseball >= 1 ? "checked" : "" }><label for="baseballCheck">국내 야구</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="overseaBaseballCheck" value="해외 야구" ${ ! empty contentSetting.overseaBaseball && contentSetting.overseaBaseball >= 1 ? "checked" : "" }><label for="overseaBaseballCheck">해외 야구</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="basketballCheck" value="농구" ${ ! empty contentSetting.basketball && contentSetting.basketball >= 1 ? "checked" : "" }><label for="basketballCheck">농구</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="sportGeneralCheck" value="스포츠 일반" ${ ! empty contentSetting.sportGeneral && contentSetting.sportGeneral >= 1 ? "checked" : "" }><label for="sportGeneralCheck">스포츠 일반</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="sportHighlightCheck" value="하이라이트" ${ ! empty contentSetting.sportHighlight && contentSetting.sportHighlight >= 1 ? "checked" : "" }><label for="sportHighlightCheck">하이라이트</label></div>
				<hr width="98%" />
			</div>
			
			<div style="float:right; width:100%; margin: 0 auto;" class="col-sm-8">
				<div class="col-sm-2"><h4>맛집</h4></div>
				<div class="col-sm-2"><input type="text" name="tastyKeyword" id="tastyKeywordCheck"  value="${contentSetting.tastyKeyword }"><label for="tastyKeywordCheck" align="center">맛집 키워드</label></div>
				<hr width="98%" />
			</div>
			
			<div style="float:right; width:100%; margin: 0 auto;" class="col-sm-13">
				<div class="col-sm-2"><h4>쇼핑</h4></div>
				<div class="col-sm-2"><input type="text" name="shoppingSearch1" id="shoppingSearch1Check" value="${contentSetting.shoppingSearch1 }" ><label for="shoppingSearch1" align="center">쇼핑 검색1</label></div>
				<div class="col-sm-2"><input type="text" name="shoppingSearch2" id="shoppingSearch2Check" value="${contentSetting.shoppingSearch2 }" ><label for="shoppingSearch2" align="center">쇼핑 검색2</label></div>
				<div class="col-sm-2"><input type="text" name="shoppingSearch3" id="shoppingSearch3Check"  value="${contentSetting.shoppingSearch3 }" ><label for="shoppingSearch3" align="center">쇼핑 검색3</label></div>
				<div class="col-sm-2"><input type="text" name="shoppingReview" id="shoppingReviewCheck" value="${contentSetting.shoppingReview }"><label for="shoppingReview" align="center">리뷰 키워드</label></div>
				<hr width="98%" />
			</div>
			
			<div style="width:100%; margin: 0 auto;" class="col-sm-13">
				<div class="col-sm-2"><h4>사용자 키워드</h4></div>
				<div class="col-sm-2"><input type="text" name="userSearch1" id="userSearch1Check"  value="${contentSetting.userSearch1 }" ><label for="userSearch1" align="center">사용자 검색1</label></div>
				<div class="col-sm-2"><input type="text" name="userSearch2" id="userSearch2Check" value="${contentSetting.userSearch2 }"><label for="userSearch2" align="center">사용자 검색2</label></div>
				<div class="col-sm-2"><input type="text" name="userSearch3" id="userSearch3Check" value="${contentSetting.userSearch2 }"><label for="userSearch3" align="center">사용자 검색3</label></div>
				<div class="col-sm-2"><input type="text" name="userVideo1" id="userVideo1Check" value="${contentSetting.userVideo1 }"><label for="userVideo1" align="center">동영상 검색1</label></div>
				<div class="col-sm-2"><input type="text" name="userVideo2" id="userVideo2Check" value="${contentSetting.userVideo2 }"><label for="userVideo2" align="center">동영상 검색2</label></div>
			</div>
		</div>
		<hr width="100%" color="#f56a6a"/>
		<h2>컨텐츠 보기 순서</h2>
		<div class="container" style="margin: 0 2px 0 0;">
		<div style="margin: 0 auto;" class="col-sm-12">
			<ul id="sortable">
			  ${contentHtml}
			</ul>
		</div>
		</div>
		<div class="col-sm-12">
			<br/>
			<button type="button" class="button primary small" ><span id="p1" style="font-size:20px">수&nbsp;정</span></button><br/><br/>
		</div>
	</form>
</div>
</body>
</html>