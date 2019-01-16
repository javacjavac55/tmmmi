package com.tmmmi.service.contentsetting.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tmmmi.service.contentsetting.ContentSettingDao;
import com.tmmmi.service.contentsetting.ContentSettingService;
import com.tmmmi.service.domain.ContentSetting;

@Service("contentSettingServiceImpl")
public class ContentSettingServiceImpl implements ContentSettingService {
	///Field
	@Autowired
	@Qualifier("contentSettingDaoImpl")
	private ContentSettingDao contentSettingDao;
	public void setContentSettingDao(ContentSettingDao contentSettingDao) {
		this.contentSettingDao = contentSettingDao;
	}
	
	///Constructor
	public ContentSettingServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addContentSetting(int userNo){
		contentSettingDao.addContentSetting(userNo);
	}

	@Override
	public ContentSetting getContentSetting(int userNo) {
		return contentSettingDao.getContentSetting(userNo);
	}

	@Override
	public void updateContentSetting(ContentSetting contentSetting) {
		contentSettingDao.updateContentSetting(contentSetting);
	}

}
