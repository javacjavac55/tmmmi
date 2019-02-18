var map = {
	    'ContentMovieBoxOffice': function() {
			$($('#movieBoxOffice').contents().find('.content-model-btn')).on('click', function(){
				var content = $('#movieBoxOffice').contents().find('#movieBoxOfficeInput').val();
				fncOpenModal(1, content, true);
			});
	    },
	    'ContentMovieNew': function() {
			$($('#movieNew').contents().find('.content-model-btn')).on('click', function(){
				var content = $('#movieNew').contents().find('#movieNewInput').val();
				fncOpenModal(1, content, true);
			});
	    },
		'ContentMovieUpcoming': function() {
			$($('#movieUpcoming').contents().find('.content-model-btn')).on('click', function(){
				var content = $('#movieUpcoming').contents().find('#movieUpcomingInput').val();
				console.log('here');
				fncOpenModal(1, content, true);
			});
	    },
		'ContentMovieReview': function() {
			$($('#movieReview').contents().find('.content-model-btn')).on('click', function(){
				var content = $('#movieReview').contents().find('#movieReviewInput').val();
				fncOpenModal(1, content, true);
			}); 
			$($('#movieReview').contents().find('.movie-review-link')).on('click', function(){
				var content = $('#movieReview').contents().find('#movieReviewInput').val();
				fncOpenModal(1, content, true);
			});     
	    },
		'ContentMovieTrailer': function() {
	      	$($('#movieTrailer').contents().find('.content-model-btn')).on('click', function(){
				var content = $('#movieTrailer').contents().find('#movieTrailerInput').val();
				fncOpenModal(1, content, true);
			});
			
			$($('#movieTrailer').contents().find('.scrap-btn')).on('click', function(){
				fncScrapArticle(1, "[예고편] "+$(this).siblings('.movie').find('.trailer-title').text().trim(), $(this).closest('article').get(0).outerHTML)
			});
	    },


		'ContentKsoccerList': function() {
	      	$($('#kSoccer').contents().find('.content-model-btn')).on('click', function(){
				var content = $('#kSoccer').contents().find('#kSoccerInput').val();
				fncOpenModal(2, content, true);
			});
	    },
		'ContentWsoccerList': function() {
			$($('#wSoccer').contents().find('.content-model-btn')).on('click', function(){
				var content = $('#wSoccer').contents().find('#wSoccerInput').val();
				fncOpenModal(2, content, true);
			});      
	    },
		'ContentKbaseballList': function() {
			$($('#kBaseball').contents().find('.content-model-btn')).on('click', function(){
				var content = $('#kBaseball').contents().find('#kBaseballInput').val();
				fncOpenModal(2, content, true);
			});  
	    },
		'ContentWbaseballList': function() {
			$($('#wBaseball').contents().find('.content-model-btn')).on('click', function(){
				var content = $('#wBaseball').contents().find('#wBaseballInput').val();
				fncOpenModal(2, content, true);
			});      
	    },
		'ContentBasketballList': function() {
			$($('#basketball').contents().find('.content-model-btn')).on('click', function(){
				var content = $('#basketball').contents().find('#basketballInput').val();
				fncOpenModal(2, content, true);
			});      
	    },
		'ContentGeneralList': function() {
	      	$($('#general').contents().find('.content-model-btn')).on('click', function(){
				var content = $('#general').contents().find('#generalInput').val();
				fncOpenModal(2, content, true);
			});
	    },
		'ContentHighlightList': function() {
			$($('#highlight').contents().find('.scrap-btn')).on('click', function(){
				fncScrapArticle(2, $(this).siblings('.highlight-title').text().trim(), $(this).closest('article').get(0).outerHTML)
			});      
	    },


		'ContentTastyList': function() {
			$($('#tasty').contents().find('.content-model-btn')).on('click', function(){
				var content = $('#tasty').contents().find('#tastyInput').val();
				fncOpenModal(3, content, false);
			});
			
			$($('#tasty').contents().find('.scrap-btn')).on('click', function(){
				fncScrapArticle(3, $(this).siblings('.tasty-tasty-title').text(), $(this).closest('article').get(0).outerHTML)
			});
	    },


		'ShoppingListFirst': function() {
			$($('#shoppingFirst').contents().find('.content-model-btn')).on('click', function(){
				var content = $('#shoppingFirst').contents().find('#shoppingFirstInput').val();
				fncOpenModal(4, content, true);
			});      
	    },
		'ShoppingListSecond': function() {
			$($('#shoppingSecond').contents().find('.content-model-btn')).on('click', function(){
				var content = $('#shoppingSecond').contents().find('#shoppingSecondInput').val();
				fncOpenModal(4, content, true);
			});      
	    },
		'ShoppingListThird': function() {
			$($('#shoppingThird').contents().find('.content-model-btn')).on('click', function(){
				var content = $('#shoppingThird').contents().find('#shoppingThirdInput').val();
				fncOpenModal(4, content, true);
			});		
	    },
		'ShoppingReviewList': function() {
			$($('#shoppingReview').contents().find('.scrap-btn')).on('click', function(){
				console.log('7');
				fncScrapArticle(4, $(this).siblings('.shopping-review-title').text().trim(), $(this).closest('article').get(0).outerHTML)
			});      
	    },


		'UserKeywordListFirst': function() {
			$($('#userKeywordFirst').contents().find('.content-model-btn')).on('click', function(){
				var content = $('#userKeywordFirst').contents().find('#userSearchFirstInput').val();
				fncOpenModal(5, content, false);
			});
	    },
		'UserKeywordListSecond': function() {
			$($('#userKeywordSecond').contents().find('.content-model-btn')).on('click', function(){
				var content = $('#userKeywordSecond').contents().find('#userSearchSecondInput').val();
				fncOpenModal(5, content, false);
			});
	    },
		'UserKeywordListThird': function() {
			$($('#userKeywordThird').contents().find('.content-model-btn')).on('click', function(){
				var content = $('#userKeywordThird').contents().find('#userSearchThirdInput').val();
				fncOpenModal(5, content, false);
			});  
	    },
		'UserVideoListFirst': function() {
			$($('#userVideoFirst').contents().find('.scrap-btn')).on('click', function(){
				fncScrapArticle(5, $(this).siblings('.shopping-review-title').text().trim(), $(this).closest('article').get(0).outerHTML)
			});
	    },
		'UserVideoListSecond': function() {
			$($('#userVideoSecond').contents().find('.scrap-btn')).on('click', function(){
				fncScrapArticle(5, $(this).siblings('.shopping-review-title').text().trim(), $(this).closest('article').get(0).outerHTML)
			});     
	    }
	};