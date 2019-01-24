package com.tmmmi.service.content.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Service;

import com.tmmmi.service.content.ContentDao;

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
}
