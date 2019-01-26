package com.tmmmi.service.content;

import java.util.List;

import com.tmmmi.service.domain.ContentSetting;

public interface ContentDao {
	//movie
	public List<Object> getBoxOfficeList(ContentSetting contentSetting, int index) throws Exception;
	
	public List<Object> getNewMovieList(ContentSetting contentSetting, int index) throws Exception;
	
	//sport
	public List<Object> getContentKsoccerList(ContentSetting contentSetting , int index) throws Exception;
	
	public List<Object> getContentWsoccerList(ContentSetting contentSetting , int index) throws Exception;
	
	public List<Object> getContentKbaseballList(ContentSetting contentSetting , int index) throws Exception;
	
	public List<Object> getContentWbaseballList(ContentSetting contentSetting , int index) throws Exception;
	
	public List<Object> getContentBasketballList(ContentSetting contentSetting , int index) throws Exception;
	
	public List<Object> getContentGeneralList(ContentSetting contentSetting , int index) throws Exception;
	
	public List<Object> getContentHighlightList(ContentSetting contentSetting, int index) throws Exception;
	//tasty
	
	//shopping
	public List<Object> getContentShoppingFirstList(ContentSetting contentSetting, int index) throws Exception;
	
	//keyword
}
