package com.tmmmi.service.content;

import java.util.List;

import com.tmmmi.service.domain.ContentMovie;
import com.tmmmi.service.domain.ContentSetting;
import com.tmmmi.service.domain.ContentShopping;
import com.tmmmi.service.domain.ContentSport;
import com.tmmmi.service.domain.ContentTasty;
import com.tmmmi.service.domain.ContentUserKeyword;

public interface ContentService {
	//movie
	public List<ContentMovie> getContentMovieBoxOfficeList(int index) throws Exception;
	
	public List<ContentMovie> getContentMovieNewList(int index) throws Exception;
	
	public List<ContentMovie> getContentMovieUpcomingList(int index) throws Exception;
	
	public List<ContentMovie> getContentMovieReviewList(int index) throws Exception;
	
	public List<ContentMovie> getContentMovieTrailerList(int index) throws Exception;
	
	//sport
	public List<ContentSport> getContentSportKsoccerList(int index) throws Exception;
	
	public List<ContentSport> getContentSportWsoccerList(int index) throws Exception;
	
	public List<ContentSport> getContentSportKbaseballList(int index) throws Exception;
	
	public List<ContentSport> getContentSportWbaseballList(int index) throws Exception;
	
	public List<ContentSport> getContentSportBasketballList(int index) throws Exception;
	
	public List<ContentSport> getContentSportGeneralList(int index) throws Exception;
	
	public List<ContentSport> getContentSportHighlightList(int index) throws Exception;
	
	public ContentSport getContentSportHighlightVideo(ContentSport sport) throws Exception;
	
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
