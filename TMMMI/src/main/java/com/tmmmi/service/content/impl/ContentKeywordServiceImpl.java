package com.tmmmi.service.content.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Service;

import com.tmmmi.service.content.ContentDao;
import com.tmmmi.service.domain.ContentSetting;
import com.tmmmi.service.domain.ContentUserKeyword;

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
	
	///Method
	public List<ContentUserKeyword> getContentUserKeywordFirstList(ContentSetting contentSetting, int index) throws Exception{
		return contentKeywordDao.getContentUserKeywordFirstList(contentSetting, index);
	}
	
	public List<ContentUserKeyword> getContentUserKeywordSecondList(ContentSetting contentSetting, int index) throws Exception{
		return contentKeywordDao.getContentUserKeywordSecondList(contentSetting, index);
	}
	
	public List<ContentUserKeyword> getContentUserKeywordThirdList(ContentSetting contentSetting, int index) throws Exception{
		return contentKeywordDao.getContentUserKeywordThirdList(contentSetting, index);
	}
	
	public List<ContentUserKeyword> getContentUserKeywordVideoFirstList(ContentSetting contentSetting, int index) throws Exception{
		return contentKeywordDao.getContentUserKeywordVideoFirstList(contentSetting, index);
	}
	
	public List<ContentUserKeyword> getContentUserKeywordVideoSecondList(ContentSetting contentSetting, int index) throws Exception{
		return contentKeywordDao.getContentUserKeywordVideoSecondList(contentSetting, index);
	}
	
}
