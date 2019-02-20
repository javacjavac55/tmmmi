<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Index</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="/css/index/assets/css/main.css" />
	<link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
	<noscript><link rel="stylesheet" href="/css/index/assets/css/noscript.css" /></noscript>
	<style type="text/css">
		.tiles article > a{
			color:#3a2a64;
			background-color:#ffffff;
		}
		.tiles article > a:hover{
			color: #f2849e !important;
			background-color:#ffffff;
		}
		.tiles article.style1 > .image:before, .tiles article.style2 > .image:before, .tiles article.style3 > .image:before, .tiles article.style4 > .image:before,
		.tiles article.style5 > .image:before, .tiles article.style6 > .image:before, .tiles article.style7 > .image:before, .tiles article.style8 > .image:before,
		.tiles article.style9 > .image:before {;
			background-color:#ffffff;
		}
		#header {
			padding:4em 0 0.1em 0;
		}
	</style>
</head>
	<body class="is-preload">
	<div align="right">
		<span style="font-family:'Do Hyeon'; margin:10px 10px 0 0;">${userName }님 환영합니다.</span>
		<a href="/user/logout" style="font-family:'Do Hyeon';margin:10px 10px 0 0; color:#3a2a64">Logout</a>
	</div>
		<!-- Wrapper -->
			<div id="wrapper">
			<!-- Header -->
				<header id="header">
					<div class="inner" style="text-align:center;">
						<img src="/images/Logo/logo2.png" alt=""  style="width:50%;"/>
					</div>
				</header>

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header style="text-align:center">
								<br/>
								<p style="font-family:'Do Hyeon'; font-size : x-large;">하루를 Tmmmi와 함께 시작해보세요.</p>
							</header>
							<section class="tiles">
								<article class="style1" >
									<span class="image">
										<img src="/css/index/images/loginIndex.png" alt="" />
									</span>
									<a href="/calendar/getCalendarMonth">
										<h2>Calendar</h2><br/>
										<img src="/images/loginIndex/calendar.png" width="20%"/>
										<div class="content">
											<p>Manage Your Schedules</p>
										</div>
									</a>
								</article>
								<article class="style2">
									<span class="image">
										<img src="/css/index/images/pic06.jpg" alt="" />
									</span>
									<a href="/todo/getToDoList">
										<h2>To do</h2><br/>
										<img src="/images/loginIndex/checklist.png" width="20%"/>
										<div class="content">
											<p>Take Care Of The Day's Work</p>
										</div>
									</a>
								</article>
								<article class="style3">
									<span class="image">
										<img src="/css/index/images/pic02.jpg" alt="" />
									</span>
									<a href="/content/getContentList">
										<h2>Content</h2><br/>
										<img src="/images/loginIndex/sharing-content.png" width="20%"/>
										<div class="content">
											<p>Collect Your Interests</p>
										</div>
									</a>
								</article>
								<article class="style4">
									<span class="image">
										<img src="/css/index/images/pic04.jpg" alt="" />
									</span>
									<a href="/calendar/getCalendarInterest">
										<h2>Calendar Interest</h2><br/>
										<img src="/images/loginIndex/sportcalendar.png" width="20%"/>
										<div class="content">
											<p>Movie Calendar & Sport Calendar</p>
										</div>
									</a>
								</article>								
								<article class="style5">
									<span class="image">
										<img src="/css/index/images/pic03.jpg" alt="" />
									</span>
									<a href="/diary/getDiaryList">
										<h2>Diary</h2><br/>
										<img src="/images/loginIndex/diary.png" width="20%"/>
										<div class="content">
											<p>Leave An Appreciation For The Day</p>
										</div>
									</a>
								</article>
								<article class="style6">
									<span class="image">
										<img src="/css/index/images/pic05.jpg" alt="" />
									</span>
									<a href="/scrap/getScrapList">
										<h2>Scrap</h2><br/>
										<img src="/images/loginIndex/floppydisk.png" width="20%"/>
										<div class="content">
											<p>Store Your Interests</p>
										</div>
									</a>
								</article>
								<!--스크랩-->
								<article class="style7">
									<span class="image">
										<img src="/css/index/images/pic05.jpg" alt="" />
									</span>
									<a href="/user/getUser">
										<h2>My page</h2><br/>
										<img src="/images/loginIndex/find-my-friend.png" width="20%"/>
										<div class="content">
											<p>Check My Information</p>
										</div>
									</a>
								</article>
								
								<article class="style8">
									<span class="image">
										<img src="/css/index/images/pic07.jpg" alt="" />
									</span>
									<a href="/faq/getFAQList">
										<h2>FAQ</h2><br/>
										<img src="/images/loginIndex/conversation.png" width="20%" />
										<div class="content">
											<p>Frequently Asked Questions</p>
										</div>
									</a>
								</article>
								<article class="style9">
									<span class="image">
										<img src="/css/index/images/pic08.jpg" alt="" />
									</span>
									<a href="/qna/getQNAList">
										<h2>QNA</h2><br/>
										<img src="/images/loginIndex/qa.png" width="20%" />
										<div class="content">
											<p>Questions And Answers</p>
										</div>
									</a>
								</article>
							</section>
						</div>
					</div>
			</div>

		<!-- Scripts -->
		<script src="/css/index/assets/js/jquery.min.js"></script>
		<script src="/css/index/assets/js/browser.min.js"></script>
		<script src="/css/index/assets/js/breakpoints.min.js"></script>
		<script src="/css/index/assets/js/util.js"></script>
		<script src="/css/index/assets/js/main.js"></script>
	</body>
</html>

