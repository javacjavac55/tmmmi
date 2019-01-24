package com.tmmmi.service.content.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Service;

import com.tmmmi.service.content.ContentDao;
import com.tmmmi.service.content.ContentService;
import com.tmmmi.service.domain.ContentSetting;

@Service("contentServiceImpl")
public class ContentServiceImpl implements ContentService {	
	///Field
	@Autowired
	@Qualifier("contentSportDaoImpl")
	private ContentDao contentSportDao;
	public void setContentSportDao(ContentDao contentSportDao) {
		this.contentSportDao = contentSportDao;
	}
	
	@Autowired
	@Qualifier("contentTastyDaoNaverImpl")
	private ContentDao contentTastyDao;
	public void setContentTastyDao(ContentDao contentTastyDao) {
		this.contentTastyDao = contentTastyDao;
	}
	//Constructor
	public ContentServiceImpl() {
		System.out.println(this.getClass());
	}
	
	//Method
	@Override
	public void getContent() {
		
	}

	@Override
	public List<Object> getContentTastyList(ContentSetting contentSetting) throws Exception{
		System.out.println("getContentList Á¢±Ù");
		return contentTastyDao.getContentList(contentSetting);
	}

	@Override
	public List<Object> getContentSportList(ContentSetting contentSetting, int index) throws Exception {
		// TODO Auto-generated method stub
		return contentSportDao.getContentList(contentSetting, index);
	}
}
