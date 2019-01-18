package com.tmmmi.service.content.impl;

import org.springframework.stereotype.Service;

import com.tmmmi.service.content.ContentDao;
import com.tmmmi.service.content.ContentService;
import com.tmmmi.service.domain.ContentSetting;

@Service("contentServiceImpl")
public class ContentServiceImpl implements ContentService {
	
	private ContentDao contentDao;

	
	//Constructor
	public ContentServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	//Method
	@Override
	public void getContent() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getContentList(ContentSetting contentSetting) {
		System.out.println("getContentList Á¢±Ù");
		contentDao.getContentList(contentSetting);
	}

}
