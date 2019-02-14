package com.tmmmi.service.content.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Service;

import com.tmmmi.service.content.ContentDao;
import com.tmmmi.service.domain.ContentMovie;
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
	
	public List<ContentMovie> getBoxOfficeList(int index) throws Exception {
		return contentMovieDao.getBoxOfficeList(index);
	}
	
	public List<ContentMovie> getNewMovieList(int index) throws Exception {
		return contentMovieDao.getNewMovieList(index);
	}
	
	public List<ContentMovie> getUpcomingMovieList(int index) throws Exception {
		return contentMovieDao.getUpcomingMovieList(index);
	}
	
	public List<ContentMovie> getMovieReviewList(int index) throws Exception {
		return contentMovieDao.getMovieReviewList(index);
	}
	
	public List<ContentMovie> getMovieTrailerList(int index) throws Exception {
		return contentMovieDao.getMovieTrailerList(index);
	}
}
