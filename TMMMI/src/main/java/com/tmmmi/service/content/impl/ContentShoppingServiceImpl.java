package com.tmmmi.service.content.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Service;

import com.tmmmi.service.content.ContentDao;
import com.tmmmi.service.domain.ContentSetting;
import com.tmmmi.service.domain.ContentShopping;

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
	
	public List<ContentShopping> getContentShoppingFirstList(ContentSetting contentSetting, int index) throws Exception{
		return contentShoppingDao.getContentShoppingFirstList(contentSetting, index);
	}
	
	public List<ContentShopping> getContentShoppingSecondList(ContentSetting contentSetting, int index) throws Exception{
		return contentShoppingDao.getContentShoppingSecondList(contentSetting, index);
	}
	
	public List<ContentShopping> getContentShoppingThirdList(ContentSetting contentSetting, int index) throws Exception{
		return contentShoppingDao.getContentShoppingThirdList(contentSetting, index);
	}
	
	public List<ContentShopping> getContentShoppingReviewList(ContentSetting contentSetting, int index) throws Exception{
		return contentShoppingDao.getContentShoppingReviewList(contentSetting, index);
	}
	
}
