<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Grid Menu | Demo 2 | Codrops</title>
		<meta name="description" content="A CSS Grid powered menu with a box look" />
		<meta name="keywords" content="menu, css grid, box, navigation, web development, animation" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="favicon.ico">
		<link rel="stylesheet" type="text/css" href="/css/mainMenu/base.css" />
		<link rel="stylesheet" type="text/css" href="/css/mainMenu/demo2.css" />
		<script>document.documentElement.className="js";var supportsCssVars=function(){var e,t=document.createElement("style");return t.innerHTML="root: { --tmp-var: bold; }",document.head.appendChild(t),e=!!(window.CSS&&window.CSS.supports&&window.CSS.supports("font-weight","var(--tmp-var)")),t.parentNode.removeChild(t),e};supportsCssVars()||alert("Please view this demo in a modern browser that supports CSS Variables.");</script>
	</head>
	<body>
		<svg class="hidden">
			<symbol id="icon-arrow" viewBox="0 0 24 24">
				<title>arrow</title>
				<polygon points="6.3,12.8 20.9,12.8 20.9,11.2 6.3,11.2 10.2,7.2 9,6 3.1,12 9,18 10.2,16.8 "/>
			</symbol>
			<symbol id="icon-drop" viewBox="0 0 24 24">
				<title>drop</title>
				<path d="M12,21c-3.6,0-6.6-3-6.6-6.6C5.4,11,10.8,4,11.4,3.2C11.6,3.1,11.8,3,12,3s0.4,0.1,0.6,0.3c0.6,0.8,6.1,7.8,6.1,11.2C18.6,18.1,15.6,21,12,21zM12,4.8c-1.8,2.4-5.2,7.4-5.2,9.6c0,2.9,2.3,5.2,5.2,5.2s5.2-2.3,5.2-5.2C17.2,12.2,13.8,7.3,12,4.8z"/><path d="M12,18.2c-0.4,0-0.7-0.3-0.7-0.7s0.3-0.7,0.7-0.7c1.3,0,2.4-1.1,2.4-2.4c0-0.4,0.3-0.7,0.7-0.7c0.4,0,0.7,0.3,0.7,0.7C15.8,16.5,14.1,18.2,12,18.2z"/>
			</symbol>
		</svg>
		<main>
			<div class="message">To see the menu, please view on a larger screen.</div>
			<div class="content content--fixed">
				<button class="menu-trigger">+ Menu</button>
			</div>
			<nav class="grim">
				<div class="grim__item">
					<div class="grim__item-bg grim__item-bg--1"></div>
				</div>
				<div class="grim__item">
					<div class="grim__item-bg grim__item-bg--2"></div>
				</div>
				<div class="grim__item">
					<div class="grim__item-bg grim__item-bg--3"></div>
					<div class="grim__item-content">
						<div class="grim__item-inner">
							<button class="menu-trigger menu-trigger--close">- close</button>
						</div>
					</div>
				</div>
				<div class="grim__item">
					<div class="grim__item-bg grim__item-bg--4"></div>
					<a href="#content-3" class="grim__link grim__item-content">
						<div class="grim__item-inner">
							<h3 class="grim__item-title">QNA</h3>
						</div>
					</a>
				</div>
				<div class="grim__item">
					<div class="grim__item-bg grim__item-bg--6"></div>
					<a href="#content-1" class="grim__link grim__item-content">
						<div class="grim__item-inner">
							<h3 class="grim__item-title">FAQ</h3>
						</div>
					</a>
				</div>
				<div class="grim__item">
					<div class="grim__item-bg grim__item-bg--6"></div>
					<div class="grim__item-img grim__item-img--1" style="background-image: url(/images/mainMenu/1.jpg);"></div>
					<a href="#content-2" class="grim__link grim__item-content">
						<div class="grim__item-inner">
							<h3 class="grim__item-title" data-link="/todo/getCalendarMonth/">To Do</h3>
							<span class="grim__item-desc">Lift your spirits</span>
						</div>
					</a>
					<div class="grim__item-bg grim__item-bg-cover grim__item-bg--6"></div>
				</div>
				<div class="grim__item">
					<div class="grim__item-bg grim__item-bg--7"></div>
					<div class="grim__item-img grim__item-img--2" style="background-image: url(/images/mainMenu/2.jpg);"></div>
					<a href="#content-3" class="grim__link grim__item-content">
						<div class="grim__item-inner">
							<h3 class="grim__item-title" data-link="/user/getUser/">My Page</h3>
							<span class="grim__item-desc">Find yourself</span>
						</div>
					</a>
					<div class="grim__item-bg grim__item-bg-cover grim__item-bg--7"></div>
				</div>
				<div class="grim__item">
					<div class="grim__item-bg grim__item-bg--8"></div>
					<div class="grim__item-img grim__item-img--3" style="background-image: url(/images/mainMenu/3.jpg);"></div>
					<a href="#content-4" class="grim__link grim__item-content">
						<div class="grim__item-inner">
							<h3 class="grim__item-title" data-link="/diary/listDiary/">Diary</h3>
							<span class="grim__item-desc">Uncover beauty</span>
						</div>
					</a>
					<div class="grim__item-bg grim__item-bg-cover grim__item-bg--8"></div>
				</div>
				<div class="grim__item">
					<div class="grim__item-bg grim__item-bg--9"></div>
					<div class="grim__item-img grim__item-img--4" style="background-image: url(/images/mainMenu/4.jpg);"></div>
					<a href="#content-5" class="grim__link grim__item-content">
						<div class="grim__item-inner">
							<h3 class="grim__item-title" data-link="/calendar/getCalendarMonth/">Calendar</h3>
							<span class="grim__item-desc">Feel nature</span>
						</div>
					</a>
					<div class="grim__item-bg grim__item-bg-cover grim__item-bg--9"></div>
				</div>
				<div class="grim__item">
					<div class="grim__item-bg grim__item-bg--10"></div>
					<div class="grim__item-img grim__item-img--5" style="background-image: url(/images/mainMenu/5.jpg);"></div>
					<a href="#content-6" class="grim__link grim__item-content">
						<div class="grim__item-inner">
							<h3 class="grim__item-title" data-link="/content/listContent.jsp">Content</h3>
							<span class="grim__item-desc">Explore your limits</span>
						</div>
					</a>
					<div class="grim__item-bg grim__item-bg-cover grim__item-bg--10"></div>
				</div>
			</nav>
		</main>
		<script src="/javascript/mainMenu/demo.js"></script>
		<script src="/javascript/mainMenu/imagesloaded.pkgd.min.js"></script>
		<script src="/javascript/mainMenu/anime.min.js"></script>
		<script src="/javascript/mainMenu/menu2.js"></script>
		<script>
		$(function(){
			$('.grim__item-title').on('click', function(){
				console.log($(this).data('link'));
				$(location).attr("href", $(this).data('link'));
			});
		})
		</script>
	</body>
</html>
