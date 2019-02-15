function refresh() {
	var $window = $(window), $body = $('body'), settings = {

		// Carousels
		carousels : {
			speed : 10,
			fadeIn : true,
			fadeDelay : 250
		},

	};

	// Breakpoints.
	breakpoints({
		wide : [ '1281px', '1680px' ],
		normal : [ '961px', '1280px' ],
		narrow : [ '841px', '960px' ],
		narrower : [ '737px', '840px' ],
		mobile : [ null, '736px' ]
	});

	// Play initial animations on page load.

	window.setTimeout(function() {
		$body.removeClass('is-preload');
	}, 100);

	// Dropdowns.
	$('#nav > ul').dropotron({
		mode : 'fade',
		speed : 350,
		noOpenerFade : true,
		alignment : 'center'
	});

	// Scrolly.
	$('.scrolly').scrolly();

	// Nav.

	// Button.
	$(
			'<div id="navButton">' + '<a href="#navPanel" class="toggle"></a>'
					+ '</div>').appendTo($body);

	// Panel.
	$(
			'<div id="navPanel">' + '<nav>' + $('#nav').navList() + '</nav>'
					+ '</div>').appendTo($body).panel({
		delay : 500,
		hideOnClick : true,
		hideOnSwipe : true,
		resetScroll : true,
		resetForms : true,
		target : $body,
		visibleClass : 'navPanel-visible'
	});

	// Carousels.
	$('.carousel').each(
		function() {
			$('.forward').remove();
			$('.backward').remove();

			var $t = $(this), $forward = $('<span class="forward"></span>'), $backward = $('<span class="backward"></span>'), $reel = $t
					.children('.reel'), $items = $reel
					.children('article');

			var pos = 0, leftLimit, rightLimit, itemWidth, reelWidth, timerId;

			// Main.
			$t._update = function() {
				pos = $('.reel').attr('style').split('(')[1]
						.split('px,')[0];
				rightLimit = (-1 * reelWidth) + $window.width();
				leftLimit = 0;
				$t._updatePos();
			};

			$t._updatePos = function() {
				$reel.css('transform', 'translate(' + pos
						+ 'px, 0)');
			};

			// Forward.
			$forward.appendTo($t).hide().mouseenter(function(e) {
				timerId = window.setInterval(function() {
					pos -= settings.carousels.speed;

					if (pos <= rightLimit) {
						window.clearInterval(timerId);
						pos = rightLimit;
					}

					$t._updatePos();
				}, 10);
			}).mouseleave(function(e) {
				window.clearInterval(timerId);
			});

			// Backward.
			$backward.appendTo($t).hide().mouseenter(function(e) {
				timerId = window.setInterval(function() {
					pos += settings.carousels.speed;

					if (pos >= leftLimit) {

						window.clearInterval(timerId);
						pos = leftLimit;

					}

					$t._updatePos();
				}, 10);
			}).mouseleave(function(e) {
				window.clearInterval(timerId);
			});

			// Init.
			reelWidth = $reel[0].scrollWidth;

			if (browser.mobile) {

				$reel.css('overflow-y', 'hidden').css('overflow-x',
						'scroll');
				$forward.hide();
				$backward.hide();

			} else {

				$reel.css('overflow', 'visible');
							$forward.show();
							$backward.show();

						}

						$t._update();

					});
}