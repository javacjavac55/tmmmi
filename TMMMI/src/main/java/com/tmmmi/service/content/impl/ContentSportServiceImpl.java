package com.tmmmi.service.content.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Service;

import com.tmmmi.service.content.ContentDao;
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
	public List<ContentSport> getContentSportKsoccerList(int index) throws Exception {
		// TODO Auto-generated method stub
		return contentSportDao.getContentSportKsoccerList(index);
	}
	@Override
	public List<ContentSport> getContentSportWsoccerList(int index) throws Exception {
		// TODO Auto-generated method stub
		return contentSportDao.getContentSportWsoccerList(index);	
	}
	@Override
	public List<ContentSport> getContentSportKbaseballList(int index) throws Exception {
		// TODO Auto-generated method stub
		return contentSportDao.getContentSportKbaseballList(index);	
	}
	@Override
	public List<ContentSport> getContentSportWbaseballList(int index) throws Exception {
		// TODO Auto-generated method stub
		return contentSportDao.getContentSportWbaseballList(index);	
	}
	@Override
	public List<ContentSport> getContentSportBasketballList(int index) throws Exception {
		// TODO Auto-generated method stub
		return contentSportDao.getContentSportBasketballList(index);	
	}
	@Override
	public List<ContentSport> getContentSportGeneralList(int index) throws Exception {
		// TODO Auto-generated method stub
		return contentSportDao.getContentSportGeneralList(index);	
	}
	
	@Override
	public List<ContentSport> getContentSportHighlightList(int index) throws Exception{
		return contentSportDao.getContentSportHighlightList(index);
	}
	
	@Override
	public ContentSport getContentSportHighlightVideo(ContentSport contentSport) throws Exception {
		return contentSportDao.getContentSportHighlightVideo(contentSport);
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
