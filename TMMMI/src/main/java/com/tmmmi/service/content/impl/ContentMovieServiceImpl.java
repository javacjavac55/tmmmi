package com.tmmmi.service.content.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Service;

import com.tmmmi.service.content.ContentDao;
import com.tmmmi.service.domain.ContentSetting;

@Service("contentMovieServiceImpl")
public class ContentMovieServiceImpl extends ContentServiceAdaptor {	
	///Field
	@Autowired
	@Qualifier("contentMovieDaoImpl")
	private ContentDao contentMovieDao;
	public void setContentMovieDao(ContentDao contentMovieDao) {
		this.contentMovieDao = contentMovieDao;
	}
	
	//Constructor
	public ContentMovieServiceImpl() {
		System.out.println(this.getClass());
	}
	
	public List<Object> getBoxOfficeList(ContentSetting contentSetting, int index) throws Exception {
		return contentMovieDao.getBoxOfficeList(contentSetting, index);
	}
	
	public List<Object> getNewMovieList(ContentSetting contentSetting, int index) throws Exception {
		return contentMovieDao.getNewMovieList(contentSetting, index);
	}
	
	public List<Object> getUpcomingMovieList(ContentSetting contentSetting, int index) throws Exception {
		return contentMovieDao.getUpcomingMovieList(contentSetting, index);
	}
	
	public List<Object> getMovieReviewList(ContentSetting contentSetting, int index) throws Exception {
		return contentMovieDao.getMovieReviewList(contentSetting, index);
	}
}
