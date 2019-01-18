package com.tmmmi.service.content;

import com.tmmmi.service.domain.ContentSetting;

public interface ContentDao {
	
	public void getContent();
	
	public void getContentList(ContentSetting contentSetting);

}
