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
	private ContentDao contentDao;
	
	public void setContentServiceDao(ContentDao contentDao) {
		this.contentDao = contentDao;
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
	public List<Object> getContentTastyList(ContentSetting contentSetting, int index) throws Exception{
		System.out.println("getContentList Á¢±Ù");
		return contentDao.getContentList(contentSetting, index);
	}

	@Override
	public List<Object> getContentSportList(ContentSetting contentSetting, int index) throws Exception {
		// TODO Auto-generated method stub
		return contentDao.getContentList(contentSetting, index);
	}
}
