<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<title>TMMMI</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
		<canvas id="myChart" style="position: relative; height: 70vh; width: 50vw;"></canvas>
	<script type="text/javascript">
		$(function() {
			var counts = [];
			var c;
			<c:forEach items="${todoMonth}" var="count">
			c = "${count.toDoCount}";
			counts.push(c);
			</c:forEach>
			console.log(counts);
			var ctx = $('#myChart');
			var toDoMonthChart = new Chart(ctx, {
				type : 'line',
				data : {
					labels : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
							"9월", "10월", "11월", "12월" ],
					datasets : [ {
						data : counts,
						label: "",
						backgroundColor: "rgba(235,73,36 ,0.4)",
					} ]
				},
				 options : {
					scales : {
						yAxes : [ {
							scaleLabel : {
								display : true,
								labelString : '월 별 성취도 개수'
							}
						} ],
						xAxes : [ {
							scaleLabel : {
								display : true,
								labelString : '월 별 완료 그래프'
							}
						} ]
					}
				}
			})
		});
	</script>
</body>
</html>