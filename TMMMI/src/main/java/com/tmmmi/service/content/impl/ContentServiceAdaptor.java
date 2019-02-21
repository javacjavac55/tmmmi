package com.tmmmi.service.content.impl;

import java.util.List;

import com.tmmmi.service.content.ContentService;
import com.tmmmi.service.domain.ContentMovie;
import com.tmmmi.service.domain.ContentSetting;
import com.tmmmi.service.domain.ContentShopping;
import com.tmmmi.service.domain.ContentSport;
import com.tmmmi.service.domain.ContentTasty;
import com.tmmmi.service.domain.ContentUserKeyword;

public abstract class ContentServiceAdaptor implements ContentService {
	//movie
	@Override
	public List<ContentMovie> getContentMovieBoxOfficeList(int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<ContentMovie> getContentMovieNewList(int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<ContentMovie> getContentMovieUpcomingList(int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<ContentMovie> getContentMovieReviewList(int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<ContentMovie> getContentMovieTrailerList(int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	//sport
	@Override
	public List<ContentSport> getContentSportKsoccerList(int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ContentSport> getContentSportWsoccerList(int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ContentSport> getContentSportKbaseballList(int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ContentSport> getContentSportWbaseballList(int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ContentSport> getContentSportBasketballList(int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ContentSport> getContentSportGeneralList(int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<ContentSport> getContentSportHighlightList(int index)throws Exception{
		return null;
	}
	
	@Override
	public ContentSport getContentSportHighlightVideo(ContentSport contentSport) throws Exception {
		return null;
	}
	
	//tasty
	public List<ContentTasty> getContentTastyList(ContentSetting contentSetting, int index)throws Exception{
		return null;
	}
	
	//shopping
	@Override
	public List<ContentShopping> getContentShoppingFirstList(ContentSetting contentSetting, int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<ContentShopping> getContentShoppingSecondList(ContentSetting contentSetting, int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<ContentShopping> getContentShoppingThirdList(ContentSetting contentSetting, int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<ContentShopping> getContentShoppingReviewList(ContentSetting contentSetting, int index, String pageToken) throws Exception{
		return null;
	}

	//keyword
	@Override
	public List<ContentUserKeyword> getContentUserKeywordFirstList(ContentSetting contentSetting, int index) throws Exception{
		return null;
	}
	
	@Override
	public List<ContentUserKeyword> getContentUserKeywordSecondList(ContentSetting contentSetting, int index) throws Exception{
		return null;
	}
	
	@Override
	public List<ContentUserKeyword> getContentUserKeywordThirdList(ContentSetting contentSetting, int index) throws Exception{
		return null;
	}
	
	@Override
	public List<ContentUserKeyword> getContentUserKeywordVideoFirstList(ContentSetting contentSetting, int index, String pageToken) throws Exception{
		return null;
	}
	
	@Override
	public List<ContentUserKeyword> getContentUserKeywordVideoSecondList(ContentSetting contentSetting, int index, String pageToken) throws Exception{
		return null;
	}
	
}
