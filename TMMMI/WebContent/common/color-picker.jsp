<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="/javascript/colorPicker/farbtastic.js"></script>
		<link rel="stylesheet" href="/css/colorPicker/farbtastic.css" type="text/css" />
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
	</head>

	<body>
		<form action="" style="width: 500px;">
		  <div id="picker" style="float: right;"></div>
		  <div class="form-item"><label for="color1">Color 1:</label><input type="text" id="color1" name="color1" class="colorwell" value="#000000" /></div>
		  <div class="form-item"><label for="color2">Color 2:</label><input type="text" id="color2" name="color2" class="colorwell" value="#ffffff" /></div>
		  <div class="form-item"><label for="color3">Color 3:</label><input type="text" id="color3" name="color3" class="colorwell" value="#123456" /></div>
		</form>
	</body>
</html>