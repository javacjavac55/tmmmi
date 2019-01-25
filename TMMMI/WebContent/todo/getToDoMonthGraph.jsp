<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<script crossorigin="anonymous" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<link crossorigin="anonymous" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" rel="stylesheet">

</head>
<body>
<div class="container">
<div class="row">
<h3 style="text-align:center">월 별 할일 성취도 그래프</h3>
<canvas id="myChart" style="height:70vh; width:50vw;margin:100px"></canvas>
</div>
</div>
<script type="text/javascript">

$(function(){
	
	var counts = [];
	var c;
	console.log("${todoMonth}");
	<c:forEach items="${todoMonth}" var="count">
	c = "${count.toDoCount}";
	 counts.push(c);
	</c:forEach>
	
	
var ctx = $('#myChart');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["1월", "2월", "3월", "4월", "5월", "6월","7월","8월","9월","10월","11월","12월"],
        datasets: [{
            label: '# of Votes',
            data: counts,
            backgroundColor: [
                'rgba(189,8,28 ,0.5)',
                'rgba(235,73,36 ,0.5)',
                'rgba(255,87,0 ,0.5)',
                'rgba(255,170,0 ,0.5)',
                'rgba(245,125,0 ,0.5)',
                'rgba(37,211,102 ,0.5)',
                'rgba(0,180,137 ,0.5)',
                'rgba(76,117,163 ,0.5)',
                'rgba(0,175,240 ,0.5)',
                'rgba(0,132,255 ,0.5)',
                'rgba(0,126,229 ,0.5)',
                'rgba(65,0,147 ,0.5)'
                
            ],
            borderColor: [
            	'rgba(189,8,28 ,1)',
                'rgba(235,73,36 ,1)',
                'rgba(255,87,0 ,1)',
                'rgba(255,170,0 ,1)',
                'rgba(245,125,0 ,1)',
                'rgba(37,211,102 ,1)',
                'rgba(0,180,137 ,1)',
                'rgba(76,117,163 ,1)',
                'rgba(0,175,240 ,1)',
                'rgba(0,132,255 ,1)',
                'rgba(0,126,229 ,1)',
                'rgba(65,0,147 ,1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
            	scaleLabel: {
                    display: true,
                    labelString: '월 별 성취도 개수'
                  },
               ticks: {
                   beginAtZero:true
               }
            }],
		    xAxes: [{
		        scaleLabel: {
		          display: true,
		          labelString: '월 별 완료 그래프'
		        }
		      }]
        }
    }
})
});
</script>

</body>
</html>