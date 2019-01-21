package com.tmmmi.service.content;

import java.util.List;

import com.tmmmi.service.domain.ContentSetting;

public interface ContentService {
	
	public void getContent();
	
	public List<Object> getContentTastyList(ContentSetting contentSetting);
	
}
