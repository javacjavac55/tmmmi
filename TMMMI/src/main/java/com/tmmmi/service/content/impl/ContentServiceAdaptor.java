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
	public List<ContentMovie> getBoxOfficeList(int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<ContentMovie> getNewMovieList(int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<ContentMovie> getUpcomingMovieList(int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<ContentMovie> getMovieReviewList(int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<ContentMovie> getMovieTrailerList(int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	//sport
	@Override
	public List<ContentSport> getContentKsoccerList(int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ContentSport> getContentWsoccerList(int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ContentSport> getContentKbaseballList(int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ContentSport> getContentWbaseballList(int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ContentSport> getContentBasketballList(int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ContentSport> getContentGeneralList(int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<ContentSport> getContentHighlightList(int index)throws Exception{
		return null;
	}
	
	@Override
	public ContentSport getContentHighlightVideo(ContentSport contentSport) throws Exception {
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
