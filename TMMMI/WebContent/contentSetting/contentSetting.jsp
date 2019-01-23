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
				if ($(this).val() == '' || $("input[name='tastyKeyword']")) {
					$('#'+id).remove();
				} else {
					$('li').last().after('<li id=\''+id+'\'class="ui-state-default ui-sortable-handle">'+$(this).val()+'</li>');
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
 	</script>
 	
 	<!-- Rest -->
 	<script type="text/javascript">
 	function fncUpdateContentSetting(){
 		/* var result = [];
	    $('.ui-state-default.ui-sortable-handle').each(function(index){
	    	result.push($( this ).attr("id")+":"+(index+1));
	    });
	    result.push('tastyKeyword'+":"+$("input[name='tastyKeyword']").val());
	    result.push('shoppingSearch1'+":"+$("input[name='shoppingSearch1']").val());
	    result.push('showShoppingSearch2'+":"+$("input[name='shoppingSearch2']").val());
	    result.push('showShoppingSearch3'+":"+$("input[name='shoppingSearch3']").val());
	    result.push('showShoppingReview'+":"+$("input[name='shoppingReview']").val());
	    result.push('showUserSearch1'+":"+$("input[name='userSearch1']").val());
	    result.push('showUserSearch2'+":"+$("input[name='userSearch2']").val());
	    result.push('showUserSearch3'+":"+$("input[name='userSearch3']").val());
	    result.push('showUserVideo1'+":"+$("input[name='userVideo1']").val());
	    result.push('showUserVideo2'+":"+$("input[name='userVideo2']").val()); */
	    
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
	    		alert('수정 되었습니다!');
	    	},
	    	error : function(request, status, error ) {  

            	console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
            	alert('수정 된 내용이 없습니다!');
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
				<div class="col-sm-2"><input type="checkbox" class="box" id="boxOfficeTop10Check" value="박스오피스" ${ ! empty contentSetting.boxOfficeTop10 && contentSetting.boxOfficeTop10 >= 1 ? "checked" : "" }><label for="boxOfficeTop10Check">박스오피스</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="romanceComedyCheck" value="로맨스/코미디" ${ ! empty contentSetting.romanceComedy && contentSetting.romanceComedy >= 1 ? "checked" : "" }><label for="romanceComedyCheck">로맨스/코미디</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="actionCheck" value="액션" ${ ! empty contentSetting.action && contentSetting.action >= 1 ? "checked" : "" }><label for="actionCheck">액션</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="horrorThrillerCheck" value="호러/스릴러" ${ ! empty contentSetting.horrorThriller && contentSetting.horrorThriller >= 1 ? "checked" : "" }><label for="horrorThrillerCheck">호러/스릴러</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="animationCheck" value="애니메이션" ${ ! empty contentSetting.animation && contentSetting.animation >= 1 ? "checked" : "" }><label for="animationCheck">애니메이션</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="fantasySFCheck" value="판타지/SF" ${ ! empty contentSetting.fantasySF && contentSetting.fantasySF >= 1 ? "checked" : "" }><label for="fantasySFCheck">판타지</label></div> 
				<hr width="98%" />
			</div>
			<div style="float:right; width:100%; margin: 0 auto;" class="col-sm-13">
				<div class="col-sm-2"><h4>스포츠</h4></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="soccerCheck" value="국내 축구" ${ ! empty contentSetting.soccer && contentSetting.soccer >= 1 ? "checked" : "" }><label for="soccerCheck">국내 축구</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="overseaSoccerCheck" value="해외 축구" ${ ! empty contentSetting.overseaSoccer && contentSetting.overseaSoccer >= 1 ? "checked" : "" }><label for="overseaSoccerCheck">해외 축구</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="baseballCheck" value="국내 야구" ${ ! empty contentSetting.baseball && contentSetting.baseball >= 1 ? "checked" : "" }><label for="baseballCheck">국내 야구</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="overseaBaseballCheck" value="해외 야구" ${ ! empty contentSetting.overseaBaseball && contentSetting.overseaBaseball >= 1 ? "checked" : "" }><label for="overseaBaseballCheck">해외 야구</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="basketballCheck" value="국내 농구" ${ ! empty contentSetting.basketball && contentSetting.basketball >= 1 ? "checked" : "" }><label for="basketballCheck">국내 농구</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="overseaBasketballCheck" value="해외 농구" ${ ! empty contentSetting.overseaBasketball && contentSetting.overseaBasketball >= 1 ? "checked" : "" }><label for="overseaBasketballCheck">해외 농구</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="sportGeneralCheck" value="스포츠 일반" ${ ! empty contentSetting.sportGeneral && contentSetting.sportGeneral >= 1 ? "checked" : "" }><label for="sportGeneralCheck">스포츠 일반</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="sportHighlightCheck" value="하이라이트" ${ ! empty contentSetting.sportHighlight && contentSetting.sportHighlight >= 1 ? "checked" : "" }><label for="sportHighlightCheck">하이라이트</label></div>
				<hr width="98%" />
			</div>
			
			<div style="float:right; width:100%; margin: 0 auto;" class="col-sm-8">
				<div class="col-sm-2"><h4>맛집</h4></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="koreanFoodCheck" value="한식" ${ ! empty contentSetting.koreanFood && contentSetting.koreanFood >= 1 ? "checked" : "" }><label for="koreanFoodCheck">한식</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="chineseFoodCheck" value="중식" ${ ! empty contentSetting.chineseFood && contentSetting.chineseFood >= 1 ? "checked" : "" }><label for="chineseFoodCheck">중식</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="japaneseFoodCheck" value="일식" ${ ! empty contentSetting.japaneseFood && contentSetting.japaneseFood >= 1 ? "checked" : "" }><label for="japaneseFoodCheck">일식</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="foreignFoodCheck" value="양식" ${ ! empty contentSetting.foreignFood && contentSetting.foreignFood >= 1 ? "checked" : "" }><label for="foreignFoodCheck">양식</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="dessertCheck" value="디저트" ${ ! empty contentSetting.dessert && contentSetting.dessert >= 1 ? "checked" : "" }><label for="dessertCheck">디저트</label></div>
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
			  <c:if test="${ ! empty contentSetting.boxOfficeTop10 && contentSetting.boxOfficeTop10 >=1 }"><li id="boxOfficeTop10" class="ui-state-default">박스오피스</li></c:if>
			  <c:if test="${ ! empty contentSetting.romanceComedy && contentSetting.romanceComedy >=1 }"><li id="romanceComedy"  class="ui-state-default">로맨스/코미디</li></c:if>
			  <c:if test="${ ! empty contentSetting.action && contentSetting.action >=1 }"><li id="action"  class="ui-state-default">액션</li></c:if>
			  <c:if test="${ ! empty contentSetting.horrorThriller && contentSetting.horrorThriller >=1 }"><li id="horrorThriller"  class="ui-state-default">호러/스릴러</li></c:if>
			  <c:if test="${ ! empty contentSetting.animation && contentSetting.animation >=1 }"><li id="animation"  class="ui-state-default">애니메이션</li></c:if>
			  <c:if test="${ ! empty contentSetting.fantasySF && contentSetting.fantasySF >=1 }"><li id="fantasySF"  class="ui-state-default">판타지/SF</li></c:if>
			 
			  <c:if test="${ ! empty contentSetting.soccer && contentSetting.soccer >=1 }"><li id="soccer"  class="ui-state-default">국내 축구</li></c:if>
			  <c:if test="${ ! empty contentSetting.overseaSoccer && contentSetting.overseaSoccer >=1 }"><li id="overseaSoccer"  class="ui-state-default">해외 축구</li></c:if>
			  <c:if test="${ ! empty contentSetting.baseball && contentSetting.baseball >=1 }"><li id="baseball"  class="ui-state-default">국내 야구</li></c:if>
			  <c:if test="${ ! empty contentSetting.overseaBaseball && contentSetting.overseaBaseball >=1 }"><li id="overseaBaseball"  class="ui-state-default">해외 야구</li></c:if>
			  <c:if test="${ ! empty contentSetting.basketball && contentSetting.basketball >=1 }"><li id="basketball"  class="ui-state-default">국내 농구</li></c:if>
			  <c:if test="${ ! empty contentSetting.overseaBasketball && contentSetting.overseaBasketball >=1 }"><li id="overseaBasketball"  class="ui-state-default">해외 농구</li></c:if>
			  <c:if test="${ ! empty contentSetting.sportGeneral && contentSetting.sportGeneral >=1 }"><li id="sportGeneral"  class="ui-state-default">스포츠 일반</li></c:if>
			  <c:if test="${ ! empty contentSetting.sportHighlight && contentSetting.sportHighlight >=1 }"><li id="sportHighlight"  class="ui-state-default">하이라이트</li></c:if>
			  
			  <c:if test="${ ! empty contentSetting.koreanFood && contentSetting.koreanFood >=1 }"><li id="koreanFood" class="ui-state-default">한식</li></c:if>
			  <c:if test="${ ! empty contentSetting.chineseFood && contentSetting.chineseFood >=1 }"><li id="chineseFood"  class="ui-state-default">중식</li></c:if>
			  <c:if test="${ ! empty contentSetting.japaneseFood && contentSetting.japaneseFood >=1 }"><li id="japaneseFood"  class="ui-state-default">일식</li></c:if>
			  <c:if test="${ ! empty contentSetting.foreignFood && contentSetting.foreignFood >=1 }"><li id="foreignFood"  class="ui-state-default">양식</li></c:if>
			  <c:if test="${ ! empty contentSetting.dessert && contentSetting.dessert >=1 }"><li id="dessert"  class="ui-state-default">디저트</li></c:if>
			 
			  <c:if test="${ ! empty contentSetting.shoppingSearch1 && contentSetting.showShoppingSearch1 >=1 }"><li id="showShoppingSearch1"  class="ui-state-default">쇼핑 키워드1</li></c:if>
			  <c:if test="${ ! empty contentSetting.shoppingSearch2 && contentSetting.showShoppingSearch2 >=1 }"><li id="showShoppingSearch2"  class="ui-state-default">쇼핑 키워드2</li></c:if>
			  <c:if test="${ ! empty contentSetting.shoppingSearch3 && contentSetting.showShoppingSearch3 >=1 }"><li id="showShoppingSearch3"  class="ui-state-default">쇼핑 키워드3</li></c:if>
			  <c:if test="${ ! empty contentSetting.shoppingReview && contentSetting.showShoppingReview >=1 }"><li id="showShoppingReview"  class="ui-state-default">리뷰 키워드</li></c:if>
			  
			  <c:if test="${ ! empty contentSetting.userSearch1 && contentSetting.showUserSearch1 >=1 }"><li id="showUserSearch1"  class="ui-state-default">사용자 키워드1</li></c:if>
			  <c:if test="${ ! empty contentSetting.userSearch2 && contentSetting.showUserSearch2 >=1 }"><li id="showUserSearch2"  class="ui-state-default">사용자 키워드2</li></c:if>
			  <c:if test="${ ! empty contentSetting.userSearch3 && contentSetting.showUserSearch3 >=1 }"><li id="showUserSearch3"  class="ui-state-default">사용자 키워드3</li></c:if>
			  <c:if test="${ ! empty contentSetting.userVideo1 && contentSetting.showUserVideo1 >=1 }"><li id="showUserVideo1"  class="ui-state-default">동영상 키워드1</li></c:if>
			  <c:if test="${ ! empty contentSetting.userVideo2 && contentSetting.showUserVideo2 >=1 }"><li id="showUserVideo2"  class="ui-state-default">동영상 키워드2</li></c:if>
			</ul>
		</div>
		</div>
		<div class="col-sm-12">
			<br/>
			<button type="button" class="button primary" ><span id="p1" style="font-size:20px">수&nbsp;정</span></button><br/><br/>
		</div>
	</form>
</div>
</body>
</html>