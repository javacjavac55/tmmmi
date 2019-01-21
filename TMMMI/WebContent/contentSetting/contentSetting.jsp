<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ ����</title>
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
	<h2>������ ���� ����</h2>
	<form class="form-horizontal">
		<div class="row gtr-uniform" align="left">
			<div style="float:left; width:100%; margin: 15px 25px 15px 0px; padding:10px;" class="col-sm-12">
				<div class="col-sm-1"><h4>��ȭ</h4></div>
				<div class="col-sm-2"><input type="checkbox" name="boxOfficeTop10" id="boxOfficeTop10" value="boxOfficeTop10"><label for="boxOfficeTop10">�ڽ����ǽ�</label></div>
				<div class="col-sm-2"><input type="checkbox" name="romanceComedy" id="romanceComedy" value="romanceComedy"><label for="romanceComedy">�θǽ�/�ڹ̵�</label></div>
				<div class="col-sm-2"><input type="checkbox" name="action" value="action">�׼�</div>
				<div class="col-sm-2"><input type="checkbox" name="horrorThriller" value="horrorThriller">ȣ��/������</div>
				<div class="col-sm-2"><input type="checkbox" name="animation" value="animation">�ִϸ��̼�</div>
				<div class="col-sm-2"><input type="checkbox" name="fantasySF" value="fantasySF">��Ÿ��</div> 
			</div>
			<div height="2px"></div>
			<div style="float:left; width:100%; margin: 15px 25px 15px 0px; padding:10px;" class="col-sm-12">
				<div class="col-sm-1"><h4>������</h4></div>
				<div class="col-sm-2"><input type="checkbox" name="soccer" value="soccer">���� �౸</div>
				<div class="col-sm-2"><input type="checkbox" name="overseaSoccer" value="overseaSoccer">�ؿ� �౸</div>
				<div class="col-sm-2"><input type="checkbox" name=baseball value="baseball">���� �߱�</div>
				<div class="col-sm-2"><input type="checkbox" name="overseaBaseball" value="overseaBaseball">�ؿ� �߱�</div>
				<div class="col-sm-2"><input type="checkbox" name="basketball" value="basketball">���� ��</div>
				<div class="col-sm-2"><input type="checkbox" name="overseaBasketball" value="overseaBasketball">�ؿ� ��</div>
				<div class="col-sm-2"><input type="checkbox" name="sportGeneral" value="sportGeneral">������ �Ϲ�</div>
				<div class="col-sm-2"><input type="checkbox" name="sportHighlight" value="sportHighlight">���̶���Ʈ</div>
			</div>
			<div style="float:left; width:100%; margin: 15px 25px 15px 0px; padding:10px;" class="col-sm-12">
				<div class="col-sm-1"><h4>����</h4></div>
				<div class="col-sm-2"><input type="checkbox" name="koreanFood" value="koreanFood">�ѽ�</div>
				<div class="col-sm-2"><input type="checkbox" name="chineseFood" value="chineseFood">�߽�</div>
				<div class="col-sm-2"><input type="checkbox" name="japaneseFood" value="japaneseFood">�Ͻ�</div>
				<div class="col-sm-2"><input type="checkbox" name="foreignFood" value="foreignFood">���</div>
				<div class="col-sm-2"><input type="checkbox" name="dessert" value="dessert">����Ʈ</div>
			</div>
			<div style="float:left; width:100%; margin: 15px 25px 15px 0px; padding:10px;" class="col-sm-12">
				<div class="col-sm-1"><h4>����</h4></div>
				<div class="col-sm-2"><input type="checkbox" name="shoppingSearch1" value="shoppingSearch1">���� Ű����1</div>
				<div class="col-sm-2"><input type="checkbox" name="shoppingSearch2" value="shoppingSearch2">���� Ű����2</div>
				<div class="col-sm-2"><input type="checkbox" name="shoppingSearch3" value="shoppingSearch3">���� Ű����3</div>
				<div class="col-sm-2"><input type="checkbox" name="shoppingReview" value="shoppingReview">���� Ű����</div>
			</div>
			<div style="float:left; width:100%; margin: 15px 25px 15px 0px; padding:10px;" class="col-sm-12">
				<div class="col-sm-1"><h4>����� Ű����</h4></div>
				<div class="col-sm-2"><input type="checkbox" name="userSearch1" value="userSearch1">����� Ű����1</div>
				<div class="col-sm-2"><input type="checkbox" name="userSearch2" value="userSearch2">����� Ű����2</div>
				<div class="col-sm-2"><input type="checkbox" name="userSearch3" value="userSearch3">����� Ű����3</div>
				<div class="col-sm-2"><input type="checkbox" name="userVideo1" value="userVideo1">������ Ű����1</div>
				<div class="col-sm-2"><input type="checkbox" name="userVideo2" value="userVideo2">������ Ű����2</div>
			</div>
		</div>
		<div style="margin: 15px 25px 15px 0px; padding:10px;" class="col-sm-12">
			<h2>������ ���� ����</h2>
			<ul id="sortable">
			  <li class="ui-state-default">�ڽ����ǽ� Top 10</li>
			  <li class="ui-state-default">�θǽ�/�ڹ̵�</li>
			  <li class="ui-state-default">�׼�</li>
			  <li class="ui-state-default">ȣ��/������</li>
			  <li class="ui-state-default">�ִϸ��̼�</li>
			  <li class="ui-state-default">��Ÿ��/SF</li>
			 
			  <li class="ui-state-default">���� �౸</li>
			  <li class="ui-state-default">�ؿ� �౸</li>
			  <li class="ui-state-default">���� �߱�</li>
			  <li class="ui-state-default">�ؿ� �߱�</li>
			  <li class="ui-state-default">���� ��</li>
			  <li class="ui-state-default">�ؿ� ��</li>
			  <li class="ui-state-default">������ �Ϲ�</li>
			  <li class="ui-state-default">���̶���Ʈ</li>
			  
			  <li class="ui-state-default">�ѽ�</li>
			  <li class="ui-state-default">�߽�</li>
			  <li class="ui-state-default">�Ͻ�</li>
			  <li class="ui-state-default">���</li>
			  <li class="ui-state-default">����Ʈ</li>
			 
			  <li class="ui-state-default">���� Ű����1</li>
			  <li class="ui-state-default">���� Ű����2</li>
			  <li class="ui-state-default">���� Ű����3</li>
			  <li class="ui-state-default">���� Ű����</li>
			  
			  <li class="ui-state-default">����� Ű����1</li>
			  <li class="ui-state-default">����� Ű����2</li>
			  <li class="ui-state-default">����� Ű����3</li>
			  <li class="ui-state-default">������ Ű����1</li>
			  <li class="ui-state-default">������ Ű����2</li>
			</ul>
		</div>
		
		<div style="margin: 15px 25px 15px 0px; padding:10px;" class="col-sm-12">
			<button type="button"><span id="p1" class="youth">����</span></button><br/>
		</div>
	</form>
</div>
</body>
</html>