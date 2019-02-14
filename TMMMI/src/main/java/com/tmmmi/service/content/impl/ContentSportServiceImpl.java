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
	public List<ContentSport> getContentKsoccerList(int index) throws Exception {
		// TODO Auto-generated method stub
		return contentSportDao.getContentKsoccerList(index);
	}
	@Override
	public List<ContentSport> getContentWsoccerList(int index) throws Exception {
		// TODO Auto-generated method stub
		return contentSportDao.getContentWsoccerList(index);	
	}
	@Override
	public List<ContentSport> getContentKbaseballList(int index) throws Exception {
		// TODO Auto-generated method stub
		return contentSportDao.getContentKbaseballList(index);	
	}
	@Override
	public List<ContentSport> getContentWbaseballList(int index) throws Exception {
		// TODO Auto-generated method stub
		return contentSportDao.getContentWbaseballList(index);	
	}
	@Override
	public List<ContentSport> getContentBasketballList(int index) throws Exception {
		// TODO Auto-generated method stub
		return contentSportDao.getContentBasketballList(index);	
	}
	@Override
	public List<ContentSport> getContentGeneralList(int index) throws Exception {
		// TODO Auto-generated method stub
		return contentSportDao.getContentGeneralList(index);	
	}
	
	@Override
	public List<ContentSport> getContentHighlightList(int index)throws Exception{
		return contentSportDao.getContentHighlightList(index);
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
