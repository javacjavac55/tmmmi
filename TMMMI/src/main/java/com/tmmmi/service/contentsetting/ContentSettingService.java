package com.tmmmi.service.contentsetting;

import com.tmmmi.service.domain.ContentSetting;

public interface ContentSettingService {
	public void addContentSetting(int userNo);
	public ContentSetting getContentSetting(int userNo);
	public void updateContentSetting(ContentSetting contentSetting);
}
