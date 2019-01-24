package com.tmmmi.service.content.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Service;

import com.tmmmi.service.content.ContentDao;

@Service("contentTastyServiceImpl")
public class ContentTastyServiceImpl extends ContentServiceAdaptor {	
	///Field	
	@Autowired
	@Qualifier("contentTastyDaoImpl")
	private ContentDao contentTastyDao;
	public void setContentTastyDao(ContentDao contentTastyDao) {
		this.contentTastyDao = contentTastyDao;
	}
	
	//Constructor
	public ContentTastyServiceImpl() {
		System.out.println(this.getClass());
	}
	
}
