package com.tmmmi.service.content.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Service;

import com.tmmmi.service.content.ContentDao;
import com.tmmmi.service.domain.ContentSetting;
import com.tmmmi.service.domain.ContentSport;

@Service("contentSportServiceImpl")
public class ContentSportServiceImpl extends ContentServiceAdaptor {	
	///Field
	@Autowired
	@Qualifier("contentSportDaoImpl")
	private ContentDao contentSportDao;
	public void setContentSportDao(ContentDao contentSportDao) {
		this.contentSportDao = contentSportDao;
	}
	
	//Constructor
	public ContentSportServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public List<Object> getContentKsoccerList(ContentSetting contentSetting, int index) throws Exception {
		// TODO Auto-generated method stub
		return contentSportDao.getContentKsoccerList(contentSetting, index);
	}
	@Override
	public List<Object> getContentWsoccerList(ContentSetting contentSetting, int index) throws Exception {
		// TODO Auto-generated method stub
		return contentSportDao.getContentWsoccerList(contentSetting, index);	
	}
	@Override
	public List<Object> getContentKbaseballList(ContentSetting contentSetting, int index) throws Exception {
		// TODO Auto-generated method stub
		return contentSportDao.getContentKbaseballList(contentSetting, index);	
	}
	@Override
	public List<Object> getContentWbaseballList(ContentSetting contentSetting, int index) throws Exception {
		// TODO Auto-generated method stub
		return contentSportDao.getContentWbaseballList(contentSetting, index);	
	}
	@Override
	public List<Object> getContentBasketballList(ContentSetting contentSetting, int index) throws Exception {
		// TODO Auto-generated method stub
		return contentSportDao.getContentBasketballList(contentSetting, index);	
	}
	@Override
	public List<Object> getContentGeneralList(ContentSetting contentSetting, int index) throws Exception {
		// TODO Auto-generated method stub
		return contentSportDao.getContentGeneralList(contentSetting, index);	
	}
	
	@Override
	public List<Object> getContentHighlightList(ContentSetting contentSetting, int index)throws Exception{
		return contentSportDao.getContentHighlightList(contentSetting, index);
	}
	
	@Override
	public ContentSport getContentHighlightVideo(ContentSport contentSport) throws Exception {
		return contentSportDao.getContentHighlightVideo(contentSport);
	}
	
	/*//Method
	@Override
	public Map<String, Object> getContentMap(ContentSetting contentSetting, int index) throws Exception {
		Map<String, Object> contentMap = new HashMap<String, Object>();
		contentMap.put("contentMovieList", contentMovieDao.getContentMap(contentSetting, index));
		contentMap.put("contentSportList", contentSportDao.getContentMap(contentSetting, index));
		contentMap.put("contentTastyList", contentTastyDao.getContentMap(contentSetting, index));
		contentMap.put("contentShoppingList", contentShoppingDao.getContentMap(contentSetting, index));
		contentMap.put("contentKeywordList", contentKeywordDao.getContentMap(contentSetting, index));
		return contentMap;
	}*/
	
		
}
