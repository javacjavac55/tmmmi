package com.tmmmi.service.content.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Service;

import com.tmmmi.service.content.ContentDao;

@Service("contentShoppingServiceImpl")
public class ContentShoppingServiceImpl extends ContentServiceAdaptor {	
	///Field
	@Autowired
	@Qualifier("contentShoppingDaoImpl")
	private ContentDao contentShoppingDao;
	public void setContentShoppingDao(ContentDao contentShoppingDao) {
		this.contentShoppingDao = contentShoppingDao;
	}
	
	//Constructor
	public ContentShoppingServiceImpl() {
		System.out.println(this.getClass());
	}
		
}
