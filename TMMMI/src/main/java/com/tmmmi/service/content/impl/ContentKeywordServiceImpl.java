package com.tmmmi.service.content.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Service;

import com.tmmmi.service.content.ContentDao;

@Service("contentKeywordServiceImpl")
public class ContentKeywordServiceImpl extends ContentServiceAdaptor {	
	///Field	
	@Autowired
	@Qualifier("contentKeywordDaoImpl")
	private ContentDao contentKeywordDao;
	public void setContentKeywordDao(ContentDao contentKeywordDao) {
		this.contentKeywordDao = contentKeywordDao;
	}
	
	//Constructor
	public ContentKeywordServiceImpl() {
		System.out.println(this.getClass());
	}
	
}
