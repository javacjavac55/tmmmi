<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ ����</title>
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
 	
 	<!-- li ���� �̺�Ʈ -->
 	<script type="text/javascript">
 	$(function(){
 		$(document).ready(function(){
 	 	    $(".box").change(function(){
 	 	        if($(this).is(":checked")){
 	 	        	var check = $(this).attr('id').replace("Check", "");
 	 	        	console.log("����:"+check);
 	 	        	$('li').last().after('<li id=\''+check+'\'class="ui-state-default">'+$(this).attr('value')+'</li>')
 	 	        }else if(!($(this).is(":checked"))){
	 	 	        var check = $(this).attr('id').replace("Check", "");
	 	 	        console.log("����:"+check);
	 	 	        $('#'+check).remove()
 	 	        }
 	 	    });
 	 	    
 	 	  	$("input[type=text]").on("change", function(){
 	 	  		var id = $(this).attr('id').replace("Check", "");
 	 	  		console.log(id);
				if ($(this).val() == '') {
					$('#'+id+'Check').remove();
				} else {
					$('li').last().after('<li id=\''+id+'\'class="ui-state-default ui-sortable-handle">'+$(this).val()+'</li>');
				}
			});
 	 	});
 	})
 	</script>
 	
 	<!-- ��ư �̺�Ʈ -->
 	<script type="text/javascript">
 	$(function() {
		$( "button.button.primary" ).on("click" , function() {
			fncUpdateContentSetting();
		});
	});
 	$( function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#' ]").on("click" , function() {
			self.location = "/content/listContent.jsp"
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
	    		alert('���� �Ǿ����ϴ�!');
	    		window.location = '/content/listContent.jsp';
	    	},
	    	error : function(request, status, error ) {  

            	console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
            	alert('���� �� ������ �����ϴ�!');
            	window.location = '/content/listContent.jsp';
            }
	    }) 
 	}
 	</script>
</head>
<body>
<div class="container"  style="text-align:center; margin:0 auto;">
	<br/><br/>
	<h2>������ ���� ����</h2>
	<form class="form-horizontal" align="center">
		<div class="row gtr-uniform" align="left">
			<div style="float:right; width:100%; margin: 0 auto;" class="col-sm-7">
				<hr width="98%" color="#f56a6a"/>
				<div class="col-sm-2"><h4>��ȭ</h4></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="boxOfficeTop10Check" value="�ڽ����ǽ�" ${ ! empty contentSetting.boxOfficeTop10 && contentSetting.boxOfficeTop10 >= 1 ? "checked" : "" }><label for="boxOfficeTop10Check">�ڽ����ǽ�</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="romanceComedyCheck" value="�θǽ�/�ڹ̵�" ${ ! empty contentSetting.romanceComedy && contentSetting.romanceComedy >= 1 ? "checked" : "" }><label for="romanceComedyCheck">�θǽ�/�ڹ̵�</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="actionCheck" value="�׼�" ${ ! empty contentSetting.action && contentSetting.action >= 1 ? "checked" : "" }><label for="actionCheck">�׼�</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="horrorThrillerCheck" value="ȣ��/������" ${ ! empty contentSetting.horrorThriller && contentSetting.horrorThriller >= 1 ? "checked" : "" }><label for="horrorThrillerCheck">ȣ��/������</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="animationCheck" value="�ִϸ��̼�" ${ ! empty contentSetting.animation && contentSetting.animation >= 1 ? "checked" : "" }><label for="animationCheck">�ִϸ��̼�</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="fantasySFCheck" value="��Ÿ��/SF" ${ ! empty contentSetting.fantasySF && contentSetting.fantasySF >= 1 ? "checked" : "" }><label for="fantasySFCheck">��Ÿ��</label></div> 
				<hr width="98%" />
			</div>
			<div style="float:right; width:100%; margin: 0 auto;" class="col-sm-13">
				<div class="col-sm-2"><h4>������</h4></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="soccerCheck" value="���� �౸" ${ ! empty contentSetting.soccer && contentSetting.soccer >= 1 ? "checked" : "" }><label for="soccerCheck">���� �౸</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="overseaSoccerCheck" value="�ؿ� �౸" ${ ! empty contentSetting.overseaSoccer && contentSetting.overseaSoccer >= 1 ? "checked" : "" }><label for="overseaSoccerCheck">�ؿ� �౸</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="baseballCheck" value="���� �߱�" ${ ! empty contentSetting.baseball && contentSetting.baseball >= 1 ? "checked" : "" }><label for="baseballCheck">���� �߱�</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="overseaBaseballCheck" value="�ؿ� �߱�" ${ ! empty contentSetting.overseaBaseball && contentSetting.overseaBaseball >= 1 ? "checked" : "" }><label for="overseaBaseballCheck">�ؿ� �߱�</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="basketballCheck" value="���� ��" ${ ! empty contentSetting.basketball && contentSetting.basketball >= 1 ? "checked" : "" }><label for="basketballCheck">���� ��</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="overseaBasketballCheck" value="�ؿ� ��" ${ ! empty contentSetting.overseaBasketball && contentSetting.overseaBasketball >= 1 ? "checked" : "" }><label for="overseaBasketballCheck">�ؿ� ��</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="sportGeneralCheck" value="������ �Ϲ�" ${ ! empty contentSetting.sportGeneral && contentSetting.sportGeneral >= 1 ? "checked" : "" }><label for="sportGeneralCheck">������ �Ϲ�</label></div>
				<div class="col-sm-2"><input type="checkbox" class="box" id="sportHighlightCheck" value="���̶���Ʈ" ${ ! empty contentSetting.sportHighlight && contentSetting.sportHighlight >= 1 ? "checked" : "" }><label for="sportHighlightCheck">���̶���Ʈ</label></div>
				<hr width="98%" />
			</div>
			
			<div style="float:right; width:100%; margin: 0 auto;" class="col-sm-8">
				<div class="col-sm-2"><h4>����</h4></div>
				<div class="col-sm-2"><input type="text" name="tastyKeyword" id="tastyKeywordCheck"  value="${contentSetting.tastyKeyword }"><label for="tastyKeywordCheck" align="center">���� Ű����</label></div>
				<hr width="98%" />
			</div>
			
			<div style="float:right; width:100%; margin: 0 auto;" class="col-sm-13">
				<div class="col-sm-2"><h4>����</h4></div>
				<div class="col-sm-2"><input type="text" name="shoppingSearch1" id="shoppingSearch1Check" value="${contentSetting.shoppingSearch1 }" ><label for="shoppingSearch1" align="center">���� �˻�1</label></div>
				<div class="col-sm-2"><input type="text" name="shoppingSearch2" id="shoppingSearch2Check" value="${contentSetting.shoppingSearch2 }" ><label for="shoppingSearch2" align="center">���� �˻�2</label></div>
				<div class="col-sm-2"><input type="text" name="shoppingSearch3" id="shoppingSearch3Check"  value="${contentSetting.shoppingSearch3 }" ><label for="shoppingSearch3" align="center">���� �˻�3</label></div>
				<div class="col-sm-2"><input type="text" name="shoppingReview" id="shoppingReviewCheck" value="${contentSetting.shoppingReview }"><label for="shoppingReview" align="center">���� Ű����</label></div>
				<hr width="98%" />
			</div>
			
			<div style="width:100%; margin: 0 auto;" class="col-sm-13">
				<div class="col-sm-2"><h4>����� Ű����</h4></div>
				<div class="col-sm-2"><input type="text" name="userSearch1" id="userSearch1Check"  value="${contentSetting.userSearch1 }" ><label for="userSearch1" align="center">����� �˻�1</label></div>
				<div class="col-sm-2"><input type="text" name="userSearch2" id="userSearch2Check" value="${contentSetting.userSearch2 }"><label for="userSearch2" align="center">����� �˻�2</label></div>
				<div class="col-sm-2"><input type="text" name="userSearch3" id="userSearch3Check" value="${contentSetting.userSearch2 }"><label for="userSearch3" align="center">����� �˻�3</label></div>
				<div class="col-sm-2"><input type="text" name="userVideo1" id="userVideo1Check" value="${contentSetting.userVideo1 }"><label for="userVideo1" align="center">������ �˻�1</label></div>
				<div class="col-sm-2"><input type="text" name="userVideo2" id="userVideo2Check" value="${contentSetting.userVideo2 }"><label for="userVideo2" align="center">������ �˻�2</label></div>
			</div>
		</div>
		<hr width="100%" color="#f56a6a"/>
		<h2>������ ���� ����</h2>
		<div class="container" style="margin: 0 2px 0 0;">
		<div style="margin: 0 auto;" class="col-sm-12">
			<ul id="sortable">
			  <c:if test="${ ! empty contentSetting.boxOfficeTop10 && contentSetting.boxOfficeTop10 >=1 }"><li id="boxOfficeTop10" class="ui-state-default">�ڽ����ǽ�</li></c:if>
			  <c:if test="${ ! empty contentSetting.romanceComedy && contentSetting.romanceComedy >=1 }"><li id="romanceComedy"  class="ui-state-default">�θǽ�/�ڹ̵�</li></c:if>
			  <c:if test="${ ! empty contentSetting.action && contentSetting.action >=1 }"><li id="action"  class="ui-state-default">�׼�</li></c:if>
			  <c:if test="${ ! empty contentSetting.horrorThriller && contentSetting.horrorThriller >=1 }"><li id="horrorThriller"  class="ui-state-default">ȣ��/������</li></c:if>
			  <c:if test="${ ! empty contentSetting.animation && contentSetting.animation >=1 }"><li id="animation"  class="ui-state-default">�ִϸ��̼�</li></c:if>
			  <c:if test="${ ! empty contentSetting.fantasySF && contentSetting.fantasySF >=1 }"><li id="fantasySF"  class="ui-state-default">��Ÿ��/SF</li></c:if>
			 
			  <c:if test="${ ! empty contentSetting.soccer && contentSetting.soccer >=1 }"><li id="soccer"  class="ui-state-default">���� �౸</li></c:if>
			  <c:if test="${ ! empty contentSetting.overseaSoccer && contentSetting.overseaSoccer >=1 }"><li id="overseaSoccer"  class="ui-state-default">�ؿ� �౸</li></c:if>
			  <c:if test="${ ! empty contentSetting.baseball && contentSetting.baseball >=1 }"><li id="baseball"  class="ui-state-default">���� �߱�</li></c:if>
			  <c:if test="${ ! empty contentSetting.overseaBaseball && contentSetting.overseaBaseball >=1 }"><li id="overseaBaseball"  class="ui-state-default">�ؿ� �߱�</li></c:if>
			  <c:if test="${ ! empty contentSetting.basketball && contentSetting.basketball >=1 }"><li id="basketball"  class="ui-state-default">���� ��</li></c:if>
			  <c:if test="${ ! empty contentSetting.overseaBasketball && contentSetting.overseaBasketball >=1 }"><li id="overseaBasketball"  class="ui-state-default">�ؿ� ��</li></c:if>
			  <c:if test="${ ! empty contentSetting.sportGeneral && contentSetting.sportGeneral >=1 }"><li id="sportGeneral"  class="ui-state-default">������ �Ϲ�</li></c:if>
			  <c:if test="${ ! empty contentSetting.sportHighlight && contentSetting.sportHighlight >=1 }"><li id="sportHighlight"  class="ui-state-default">���̶���Ʈ</li></c:if>
			  
			  <c:if test="${ ! empty contentSetting.koreanFood && contentSetting.koreanFood >=1 }"><li id="koreanFood" class="ui-state-default">�ѽ�</li></c:if>
			  <c:if test="${ ! empty contentSetting.chineseFood && contentSetting.chineseFood >=1 }"><li id="chineseFood"  class="ui-state-default">�߽�</li></c:if>
			  <c:if test="${ ! empty contentSetting.japaneseFood && contentSetting.japaneseFood >=1 }"><li id="japaneseFood"  class="ui-state-default">�Ͻ�</li></c:if>
			  <c:if test="${ ! empty contentSetting.foreignFood && contentSetting.foreignFood >=1 }"><li id="foreignFood"  class="ui-state-default">���</li></c:if>
			  <c:if test="${ ! empty contentSetting.dessert && contentSetting.dessert >=1 }"><li id="dessert"  class="ui-state-default">����Ʈ</li></c:if>
			 
			  <c:if test="${ ! empty contentSetting.shoppingSearch1 && contentSetting.showShoppingSearch1 >=1 }"><li id="showShoppingSearch1"  class="ui-state-default">${contentSetting.shoppingSearch1}</li></c:if>
			  <c:if test="${ ! empty contentSetting.shoppingSearch2 && contentSetting.showShoppingSearch2 >=1 }"><li id="showShoppingSearch2"  class="ui-state-default">${contentSetting.shoppingSearch2}</li></c:if>
			  <c:if test="${ ! empty contentSetting.shoppingSearch3 && contentSetting.showShoppingSearch3 >=1 }"><li id="showShoppingSearch3"  class="ui-state-default">${contentSetting.shoppingSearch3}</li></c:if>
			  <c:if test="${ ! empty contentSetting.shoppingReview && contentSetting.showShoppingReview >=1 }"><li id="showShoppingReview"  class="ui-state-default">${contentSetting.shoppingReview}</li></c:if>
			  
			  <c:if test="${ ! empty contentSetting.userSearch1 && contentSetting.showUserSearch1 >=1 }"><li id="showUserSearch1"  class="ui-state-default">${contentSetting.userSearch1}</li></c:if>
			  <c:if test="${ ! empty contentSetting.userSearch2 && contentSetting.showUserSearch2 >=1 }"><li id="showUserSearch2"  class="ui-state-default">${contentSetting.userSearch2}</li></c:if>
			  <c:if test="${ ! empty contentSetting.userSearch3 && contentSetting.showUserSearch3 >=1 }"><li id="showUserSearch3"  class="ui-state-default">${contentSetting.userSearch2}</li></c:if>
			  <c:if test="${ ! empty contentSetting.userVideo1 && contentSetting.showUserVideo1 >=1 }"><li id="showUserVideo1"  class="ui-state-default">${contentSetting.userVideo1}</li></c:if>
			  <c:if test="${ ! empty contentSetting.userVideo2 && contentSetting.showUserVideo2 >=1 }"><li id="showUserVideo2"  class="ui-state-default">${contentSetting.userVideo2}</li></c:if>
			</ul>
		</div>
		</div>
		<div class="col-sm-12">
			<br/>
			<a class="button" href="#" role="button">��&nbsp;��</a>
			<button type="button" class="button primary" ><span id="p1" style="font-size:20px">��&nbsp;��</span></button><br/><br/>
		</div>
	</form>
</div>
</body>
</html>