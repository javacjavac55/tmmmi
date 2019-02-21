package com.tmmmi.service.content.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Service;

import com.tmmmi.service.content.ContentDao;
import com.tmmmi.service.domain.ContentSetting;
import com.tmmmi.service.domain.ContentTasty;

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
	public ContentTastyServiceImpl(){
		System.out.println(this.getClass());
	}
	
	///Method
	public List<ContentTasty> getContentTastyList(ContentSetting contentSetting, int index) throws Exception {
		
		return contentTastyDao.getContentTastyList(contentSetting, index);
	}
}
