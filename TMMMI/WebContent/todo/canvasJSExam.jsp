<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Example</title>

<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

<script src="/javascript/canvasJS/jquery.canvasjs.min.js" type="text/javascript"></script>

<script>

$(function() {
	var counts = [];
	var label;
	var y;
	console.log(counts);
	<c:forEach items="${todoMonth}" var="count">
	label = "${count.toDoCompleteCount}";
	y = "${count.toDoCount}"
	c = '{y:'+y+', label: '+'"'+label+'월"}';
	counts.push(c);
	</c:forEach>
var chart = new CanvasJS.Chart("chartContainer", {
	exportFileName: "Doughnut Chart",
	exportEnabled: true,
	animationEnabled: true,
	title:{
		text: "월 별 할 일 그래프"
	},
	legend:{
		cursor: "pointer",
		itemclick: explodePie
	},
	 data: [{
		type: "doughnut",
		innerRadius: 90,
		showInLegend: true,
		toolTipContent: "<b>{name}</b>: ${y} (개)",
		indexLabel: "{name} - ${y}개",
		dataPoints: counts
	}] 
});
chart.render();
function explodePie (e) {
	if(typeof (e.dataSeries.dataPoints[e.dataPointIndex].exploded) === "undefined" || !e.dataSeries.dataPoints[e.dataPointIndex].exploded) {
		e.dataSeries.dataPoints[e.dataPointIndex].exploded = true;
	} else {
		e.dataSeries.dataPoints[e.dataPointIndex].exploded = false;
	}
	e.chart.render();
}
});
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
</body>
</html>