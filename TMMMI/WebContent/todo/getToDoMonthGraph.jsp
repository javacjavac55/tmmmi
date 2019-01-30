<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<!-- ChartJS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<!-- Templete CSS -->
<link href="/css/template/material-kit.min.css?v=2.0.5" rel="stylesheet" />
<!--   Core JS Files   -->
<script src="/javascript/template/core/jquery.min.js"
	type="text/javascript"></script>
<script src="/javascript/template/core/popper.min.js"
	type="text/javascript"></script>
<script src="/javascript/template/core/bootstrap-material-design.min.js"
	type="text/javascript"></script>
<!--momentJS  -->
<script src="/javascript/moment/moment.js" type="text/javascript"></script>
<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
<script src="/javascript/template/material-kit.js?v=2.0.5"
	type="text/javascript"></script>
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean"
	rel="stylesheet">
<style type="text/css">

.controlbtn {
	padding-inline-start: 0;
	overflow : hidden;
	margin : 0 auto;
}
	li{
		list-style-type : none;
		float : left;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="row ">
			<ul class="controlbtn">
				<li>
					<button type="button" class="btn btn-info btn-fab btn-round" style="margin-top : 20px; margin-right : 10px;">
						<i class="material-icons">first_page</i>
					</button>
				</li>
				<li>
					<button type="button" class="btn btn-info btn-fab btn-round" style="margin-top : 20px; margin-right : 10px;">
						<i class="material-icons">chevron_left</i>
					</button>
				</li>
				<li>
					<h3 id="currentyear"></h3>
				</li>
				<li>
					<button type="button" class="btn btn-info btn-fab btn-round" style="margin-top : 20px; margin-left : 10px;">
						<i class="material-icons">chevron_right</i>
					</button>	
				</li>
				<li>
					<button type="button" class="btn btn-info btn-fab btn-round" style="margin-top : 20px; margin-left : 10px;">
						<i class="material-icons">last_page</i>
					</button>
				</li>
			</ul>
		</div>

		<canvas id="myChart" style="position: relative; height: 70vh; width: 50vw;"></canvas>
	</div>

	<script type="text/javascript">
		$(function() {
			var currentyear = moment().format("YYYY");
			var y;
			$("#currentyear").text(currentyear+"년 성취도 그래프");
			var changeyear = moment();
			
			$("i:contains('chevron_right')").on("click", function () {
				 changeyear = changeyear.add(1, 'year')
				 y = changeyear.format("YYYY");
				 console.log(y);
				 $("#currentyear").text(y+"년 성취도 그래프");
			 })
			
			 $("i:contains('last_page')").on("click", function () {
				 changeyear = changeyear.add(10, 'year')
				 y = changeyear.format("YYYY");
				 console.log(y);
				 $("#currentyear").text(y+"년 성취도 그래프");
			 })
			 
			 $("i:contains('chevron_left')").on("click", function () {
				 changeyear = changeyear.add(-1, 'year')
				 y = changeyear.format("YYYY");
				 console.log(y);
				 $("#currentyear").text(y+"년 성취도 그래프");
			 })
			 
			 $("i:contains('first_page')").on("click", function () {
				 changeyear = changeyear.add(-10, 'year')
				 y = changeyear.format("YYYY");
				 console.log(y);
				 $("#currentyear").text(y+"년 성취도 그래프");
			 })
			 $(".btn.btn-info").on("click", function () {
				 
			  $.ajax({
                          url: "/todoRest/getToDoMonthGraphPost",
                          method: 'POST',
                          headers: {
                              "Accept": "application/json",
                              "Content-Type": "application/json"
                          },
                          data: y,
                          dataType: 'json',
                          success: function (JSONData) {
                        	  console.log(JSONData);
                        	  var newList = [];
                        	  $.each(JSONData, function (i) {
                        	  toDoMonthChart.data.datasets.forEach((dataset) => {
                      	        dataset.data.pop();
                      	    	});
                        	 })
                        	$.each(JSONData, function (i) {
                        	  newList.push(JSONData[i].toDoCount);
                        	  toDoMonthChart.data.datasets.forEach((dataset) => {
                        	        dataset.data.push(JSONData[i].toDoCount);
                        	        console.log(dataset);
                        	    });
                        	  toDoMonthChart.update();
                        	  })
                          }
                      })
			 })
			var counts = [];
			var c;
			<c:forEach items="${todoMonth}" var="count">
			c = "${count.toDoCount}";
			counts.push(c);
			</c:forEach>

			var ctx = $('#myChart');
			var toDoMonthChart = new Chart(ctx, {
				type : 'bar',
				data : {
					labels : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
							"9월", "10월", "11월", "12월" ],
					datasets : [ {
						label : '# of Votes',
						data : counts,
						backgroundColor : [ 'rgba(189,8,28 ,0.5)',
								'rgba(235,73,36 ,0.5)', 'rgba(255,87,0 ,0.5)',
								'rgba(255,170,0 ,0.5)', 'rgba(245,125,0 ,0.5)',
								'rgba(37,211,102 ,0.5)',
								'rgba(0,180,137 ,0.5)',
								'rgba(76,117,163 ,0.5)',
								'rgba(0,175,240 ,0.5)', 'rgba(0,132,255 ,0.5)',
								'rgba(0,126,229 ,0.5)', 'rgba(65,0,147 ,0.5)'

						],
						borderColor : [ 'rgba(189,8,28 ,1)',
								'rgba(235,73,36 ,1)', 'rgba(255,87,0 ,1)',
								'rgba(255,170,0 ,1)', 'rgba(245,125,0 ,1)',
								'rgba(37,211,102 ,1)', 'rgba(0,180,137 ,1)',
								'rgba(76,117,163 ,1)', 'rgba(0,175,240 ,1)',
								'rgba(0,132,255 ,1)', 'rgba(0,126,229 ,1)',
								'rgba(65,0,147 ,1)' ],
						borderWidth : 1
					} ]
				},
				options : {
					scales : {
						yAxes : [ {
							scaleLabel : {
								display : true,
								labelString : '월 별 성취도 개수'
							},
							ticks : {
								beginAtZero : true
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
	<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>