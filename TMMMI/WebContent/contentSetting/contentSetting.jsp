<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>컨텐츠 설정</title>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- bootstrap -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<!-- styleSheet -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="/css/template/main.css">
	
	<!-- font -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
	
	<!-- sortable style -->
	<style>
 		#sortable { list-style-type: none; margin: 0; padding: 0; width: 450px; }
  		#sortable li { margin: 3px 3px 3px 3px; padding: 1px; float: left; width: 100px; height: 90px; font-size: 1em; text-align: center; }
  		body, h2, h4{
  			font-family: "Nanum Gothic", sans-serif;
  		}
  	</style>
  	
  	<!-- sortable script -->
  	<script>
		$( function() {
		  $( "#sortable" ).sortable();
		  $( "#sortable" ).disableSelection();
		} );
 	</script>
</head>
<body>
<div class="container"  align="center">
	<h2>컨텐츠 보기 여부</h2>
	<form class="form-horizontal">
		<div class="row gtr-uniform" align="left">
			<div style="float:left; width:100%; margin: 15px 25px 15px 0px; padding:10px;" class="col-sm-12">
				<div class="col-sm-1"><h4>영화</h4></div>
				<div class="col-sm-2"><input type="checkbox" name="boxOfficeTop10" id="boxOfficeTop10" value="boxOfficeTop10"><label for="boxOfficeTop10">박스오피스</label></div>
				<div class="col-sm-2"><input type="checkbox" name="romanceComedy" id="romanceComedy" value="romanceComedy"><label for="romanceComedy">로맨스/코미디</label></div>
				<div class="col-sm-2"><input type="checkbox" name="action" value="action">액션</div>
				<div class="col-sm-2"><input type="checkbox" name="horrorThriller" value="horrorThriller">호러/스릴러</div>
				<div class="col-sm-2"><input type="checkbox" name="animation" value="animation">애니메이션</div>
				<div class="col-sm-2"><input type="checkbox" name="fantasySF" value="fantasySF">판타지</div> 
			</div>
			<div height="2px"></div>
			<div style="float:left; width:100%; margin: 15px 25px 15px 0px; padding:10px;" class="col-sm-12">
				<div class="col-sm-1"><h4>스포츠</h4></div>
				<div class="col-sm-2"><input type="checkbox" name="soccer" value="soccer">국내 축구</div>
				<div class="col-sm-2"><input type="checkbox" name="overseaSoccer" value="overseaSoccer">해외 축구</div>
				<div class="col-sm-2"><input type="checkbox" name=baseball value="baseball">국내 야구</div>
				<div class="col-sm-2"><input type="checkbox" name="overseaBaseball" value="overseaBaseball">해외 야구</div>
				<div class="col-sm-2"><input type="checkbox" name="basketball" value="basketball">국내 농구</div>
				<div class="col-sm-2"><input type="checkbox" name="overseaBasketball" value="overseaBasketball">해외 농구</div>
				<div class="col-sm-2"><input type="checkbox" name="sportGeneral" value="sportGeneral">스포츠 일반</div>
				<div class="col-sm-2"><input type="checkbox" name="sportHighlight" value="sportHighlight">하이라이트</div>
			</div>
			<div style="float:left; width:100%; margin: 15px 25px 15px 0px; padding:10px;" class="col-sm-12">
				<div class="col-sm-1"><h4>맛집</h4></div>
				<div class="col-sm-2"><input type="checkbox" name="koreanFood" value="koreanFood">한식</div>
				<div class="col-sm-2"><input type="checkbox" name="chineseFood" value="chineseFood">중식</div>
				<div class="col-sm-2"><input type="checkbox" name="japaneseFood" value="japaneseFood">일식</div>
				<div class="col-sm-2"><input type="checkbox" name="foreignFood" value="foreignFood">양식</div>
				<div class="col-sm-2"><input type="checkbox" name="dessert" value="dessert">디저트</div>
			</div>
			<div style="float:left; width:100%; margin: 15px 25px 15px 0px; padding:10px;" class="col-sm-12">
				<div class="col-sm-1"><h4>쇼핑</h4></div>
				<div class="col-sm-2"><input type="checkbox" name="shoppingSearch1" value="shoppingSearch1">쇼핑 키워드1</div>
				<div class="col-sm-2"><input type="checkbox" name="shoppingSearch2" value="shoppingSearch2">쇼핑 키워드2</div>
				<div class="col-sm-2"><input type="checkbox" name="shoppingSearch3" value="shoppingSearch3">쇼핑 키워드3</div>
				<div class="col-sm-2"><input type="checkbox" name="shoppingReview" value="shoppingReview">리뷰 키워드</div>
			</div>
			<div style="float:left; width:100%; margin: 15px 25px 15px 0px; padding:10px;" class="col-sm-12">
				<div class="col-sm-1"><h4>사용자 키워드</h4></div>
				<div class="col-sm-2"><input type="checkbox" name="userSearch1" value="userSearch1">사용자 키워드1</div>
				<div class="col-sm-2"><input type="checkbox" name="userSearch2" value="userSearch2">사용자 키워드2</div>
				<div class="col-sm-2"><input type="checkbox" name="userSearch3" value="userSearch3">사용자 키워드3</div>
				<div class="col-sm-2"><input type="checkbox" name="userVideo1" value="userVideo1">동영상 키워드1</div>
				<div class="col-sm-2"><input type="checkbox" name="userVideo2" value="userVideo2">동영상 키워드2</div>
			</div>
		</div>
		<div style="margin: 15px 25px 15px 0px; padding:10px;" class="col-sm-12">
			<h2>컨텐츠 보기 순서</h2>
			<ul id="sortable">
			  <li class="ui-state-default">박스오피스 Top 10</li>
			  <li class="ui-state-default">로맨스/코미디</li>
			  <li class="ui-state-default">액션</li>
			  <li class="ui-state-default">호러/스릴러</li>
			  <li class="ui-state-default">애니메이션</li>
			  <li class="ui-state-default">판타지/SF</li>
			 
			  <li class="ui-state-default">국내 축구</li>
			  <li class="ui-state-default">해외 축구</li>
			  <li class="ui-state-default">국내 야구</li>
			  <li class="ui-state-default">해외 야구</li>
			  <li class="ui-state-default">국내 농구</li>
			  <li class="ui-state-default">해외 농구</li>
			  <li class="ui-state-default">스포츠 일반</li>
			  <li class="ui-state-default">하이라이트</li>
			  
			  <li class="ui-state-default">한식</li>
			  <li class="ui-state-default">중식</li>
			  <li class="ui-state-default">일식</li>
			  <li class="ui-state-default">양식</li>
			  <li class="ui-state-default">디저트</li>
			 
			  <li class="ui-state-default">쇼핑 키워드1</li>
			  <li class="ui-state-default">쇼핑 키워드2</li>
			  <li class="ui-state-default">쇼핑 키워드3</li>
			  <li class="ui-state-default">리뷰 키워드</li>
			  
			  <li class="ui-state-default">사용자 키워드1</li>
			  <li class="ui-state-default">사용자 키워드2</li>
			  <li class="ui-state-default">사용자 키워드3</li>
			  <li class="ui-state-default">동영상 키워드1</li>
			  <li class="ui-state-default">동영상 키워드2</li>
			</ul>
		</div>
		
		<div style="margin: 15px 25px 15px 0px; padding:10px;" class="col-sm-12">
			<button type="button"><span id="p1" class="youth">수정</span></button><br/>
		</div>
	</form>
</div>
</body>
</html>