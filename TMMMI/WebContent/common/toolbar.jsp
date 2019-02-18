<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	.menu-bar {
		position: fixed;
		height: 80px;
		width: 100%;
		z-index: 23;
    	background-color: ${userSetting.mainColorModeNo==0?"#ffffff":"#000000"};
	}
	
	.logo {
    	font-size: xx-large;
    	font-weight: bold;
    	position: fixed;
		top: 25px;
		left: 40px;
    	color: ${userSetting.mainColorModeNo==0?"#000000":"#ffffff"};
	}
	
	.nav-link {
    	font-size: large;
    	font-weight: bold;
    	position: fixed;
		top: 20px;
		right: 40px;
    	color: ${userSetting.mainColorModeNo==0?"#000000":"#ffffff"};
	}
	
	.section-nav {
	    color: white;
	    font-size: x-large;
	    text-align: center;
	    padding-top: 30px;
	}
	
	ul {
		list-style-type: none;
		display: inline-block;
		padding: 0 !important;
		margin: 0 !important;
	}
	
	li {
		display: inline-block;
		vertical-align: top;
	}
	
	.section-item {
		display:inline-block;
		zoom:1;
    	*display:inline;
	}
	
	.mydot{
		border-radius: 50%;
		display: inline-block;
		height: 11px;
		width: 11px;
		margin: 2px 5px;
		transition: all 0.1s;
		position: relative;
		background: ${userSetting.mainColorModeNo==0?"#000000":"#ffffff"};
	}
	
	.mydot:hover {
		border-radius: 50%;
		display: inline-block;
		height: 15px;
		width: 15px;
		margin: 0 3px;
		background: ${userSetting.mainColorModeNo==0?"#000000":"#ffffff"};
	}
	
	.wording {
		padding-top: 5px;
		font-size: small;
		display: none;
	}
</style>
<script>
$(function(){
	$("a").click(function(event){
		console.log(event);
		console.log($(event.target).prev());
		console.log(event.target.href);
	    if(event.currentTarget.href.indexOf("#")!=-1){
	        var arrhash=event.currentTarget.href.split("#");
	        console.log($('iframe[id=' + arrhash[1] + ']').offset().top);
	        $('html, body').animate(
	            { scrollTop: $('iframe[id=' + arrhash[1] + ']').offset().top },
	            500,    // this is the animation time
	            function (){ return false; }    // what to do after the animation
	        );
	    }
	});
	
	$( '.mydot' ).tooltip();
})
</script>
</head>
<body>
	<div class="menu-bar">
		<span class="logo"><a href="../index.jsp" style="color:${userSetting.mainColorModeNo==0?"#000000":"#ffffff"};">TMMMI</a></span>
		<div class="section-nav">
			<ul>
				${sectionNaviHtml}
			</ul>
		</div>
		<a href="/user/logout" class="nav-link" >Logout</a>
	</div>
</body>
</html>