package com.tmmmi.service.content.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Service;

import com.tmmmi.service.content.ContentDao;
import com.tmmmi.service.domain.ContentMovie;

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
	
	public List<ContentMovie> getContentMovieBoxOfficeList(int index) throws Exception {
		return contentMovieDao.getContentMovieBoxOfficeList(index);
	}
	
	public List<ContentMovie> getContentMovieNewList(int index) throws Exception {
		return contentMovieDao.getContentMovieNewList(index);
	}
	
	public List<ContentMovie> getContentMovieUpcomingList(int index) throws Exception {
		return contentMovieDao.getContentMovieUpcomingList(index);
	}
	
	public List<ContentMovie> getContentMovieReviewList(int index) throws Exception {
		return contentMovieDao.getContentMovieReviewList(index);
	}
	
	public List<ContentMovie> getContentMovieTrailerList(int index) throws Exception {
		return contentMovieDao.getContentMovieTrailerList(index);
	}
}
