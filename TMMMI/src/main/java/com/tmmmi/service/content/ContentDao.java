package com.tmmmi.service.content;

import java.util.List;

import com.tmmmi.service.domain.ContentMovie;
import com.tmmmi.service.domain.ContentSetting;
import com.tmmmi.service.domain.ContentShopping;
import com.tmmmi.service.domain.ContentSport;
import com.tmmmi.service.domain.ContentTasty;
import com.tmmmi.service.domain.ContentUserKeyword;

public interface ContentDao {
	//movie
	public List<ContentMovie> getBoxOfficeList(int index) throws Exception;
	
	public List<ContentMovie> getNewMovieList(int index) throws Exception;
	
	public List<ContentMovie> getUpcomingMovieList(int index) throws Exception;
	
	public List<ContentMovie> getMovieReviewList(int index) throws Exception;
	
	public List<ContentMovie> getMovieTrailerList(int index) throws Exception;
	
	//sport
	public List<ContentSport> getContentKsoccerList(int index) throws Exception;
	
	public List<ContentSport> getContentWsoccerList(int index) throws Exception;
	
	public List<ContentSport> getContentKbaseballList(int index) throws Exception;
	
	public List<ContentSport> getContentWbaseballList(int index) throws Exception;
	
	public List<ContentSport> getContentBasketballList(int index) throws Exception;
	
	public List<ContentSport> getContentGeneralList(int index) throws Exception;
	
	public List<ContentSport> getContentHighlightList(int index) throws Exception;
	
	public ContentSport getContentHighlightVideo(ContentSport sport) throws Exception;
	
	//tasty
	public List<ContentTasty> getContentTastyList(ContentSetting contentSetting, int index) throws Exception;
	
	//shopping
	public List<ContentShopping> getContentShoppingFirstList(ContentSetting contentSetting, int index) throws Exception;
	
	public List<ContentShopping> getContentShoppingSecondList(ContentSetting contentSetting, int index) throws Exception;
	
	public List<ContentShopping> getContentShoppingThirdList(ContentSetting contentSetting, int index) throws Exception;
	
	public List<ContentShopping> getContentShoppingReviewList(ContentSetting contentSetting, int index, String pageToken) throws Exception;

	//keyword
	public List<ContentUserKeyword> getContentUserKeywordFirstList(ContentSetting contentSetting, int index) throws Exception;
	
	public List<ContentUserKeyword> getContentUserKeywordSecondList(ContentSetting contentSetting, int index) throws Exception;
	
	public List<ContentUserKeyword> getContentUserKeywordThirdList(ContentSetting contentSetting, int index) throws Exception;
	
	public List<ContentUserKeyword> getContentUserKeywordVideoFirstList(ContentSetting contentSetting, int index, String pageToken) throws Exception;
	
	public List<ContentUserKeyword> getContentUserKeywordVideoSecondList(ContentSetting contentSetting, int index, String pageToken) throws Exception;
}
