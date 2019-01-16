package com.tmmmi.service.contentsetting;

import com.tmmmi.service.domain.ContentSetting;

public interface ContentSettingDao {
	public void addContentSetting(int userNo);
	public ContentSetting getContentSetting(int userNo);
	public void updateContentSetting(ContentSetting contentSetting);
}
