<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- JQcloud CSS -->
<link rel="stylesheet" href="/css/jqcloud/jqcloud.min.css">
<!-- Material Kit JS -->
<script src="/javascript/template/core/jquery.min.js" type="text/javascript"></script>
<script src="/javascript/template/core/popper.min.js" type="text/javascript"></script>
<script src="/javascript/template/core/bootstrap-material-design.min.js" type="text/javascript"></script>
<script async defer src="https://buttons.github.io/buttons.js"></script>
<script src="/javascript/template/material-kit.js?v=2.0.5" type="text/javascript"></script>
<link href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Material Kit CSS -->
<link href="/css/template/material-kit.min.css?v=2.0.5" rel="stylesheet" />
<!-- JQcloud JS -->
<script src="/javascript/jqcloud/jqcloud.min.js" charset="utf-8"></script>
<title>할 일 워드클라우드</title>
<style>
	#todocloud {
		height: 800px;
		width: 800px;
	}
</style>
</head>
<body>
<div id="todocloud" class="todocloud">
</div>
<script>
$(function () {
	var words =${wordList};
	/* var t;
	var w;
	console.log('${wordList}');
	<c:forEach items="" var="words">
	t = "${words.text}";
	console.log(t);
	w = "${words.weight}";
	console.log(w);
	var l = {text: t, weight: w};
	words.push(l);
	</c:forEach>
	console.log(words); */
$('#todocloud').jQCloud(words);
console.log('words');
});
</script>
</body>
</html>