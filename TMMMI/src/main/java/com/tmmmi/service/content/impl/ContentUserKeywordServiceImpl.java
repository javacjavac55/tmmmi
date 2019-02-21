package com.tmmmi.service.content.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Service;

import com.tmmmi.service.content.ContentDao;
import com.tmmmi.service.domain.ContentSetting;
import com.tmmmi.service.domain.ContentUserKeyword;

@Service("contentKeywordServiceImpl")
public class ContentUserKeywordServiceImpl extends ContentServiceAdaptor {	
	///Field	
	@Autowired
	@Qualifier("contentKeywordDaoImpl")
	private ContentDao contentUserKeywordDao;
	public void setContentUserKeywordDao(ContentDao contentUserKeywordDao) {
		this.contentUserKeywordDao = contentUserKeywordDao;
	}
	
	//Constructor
	public ContentUserKeywordServiceImpl() {
		System.out.println(this.getClass());
	}
	
	///Method
	public List<ContentUserKeyword> getContentUserKeywordFirstList(ContentSetting contentSetting, int index) throws Exception{
		return contentUserKeywordDao.getContentUserKeywordFirstList(contentSetting, index);
	}
	
	public List<ContentUserKeyword> getContentUserKeywordSecondList(ContentSetting contentSetting, int index) throws Exception{
		return contentUserKeywordDao.getContentUserKeywordSecondList(contentSetting, index);
	}
	
	public List<ContentUserKeyword> getContentUserKeywordThirdList(ContentSetting contentSetting, int index) throws Exception{
		return contentUserKeywordDao.getContentUserKeywordThirdList(contentSetting, index);
	}
	
	public List<ContentUserKeyword> getContentUserKeywordVideoFirstList(ContentSetting contentSetting, int index, String pageToken) throws Exception{
		return contentUserKeywordDao.getContentUserKeywordVideoFirstList(contentSetting, index, pageToken);
	}
	
	public List<ContentUserKeyword> getContentUserKeywordVideoSecondList(ContentSetting contentSetting, int index, String pageToken) throws Exception{
		return contentUserKeywordDao.getContentUserKeywordVideoSecondList(contentSetting, index, pageToken);
	}
	
}
