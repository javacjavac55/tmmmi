package com.tmmmi.service.content;

import java.util.List;

import com.tmmmi.service.domain.ContentSetting;

public interface ContentDao {
	
	public void getContent();

	public List<Object> getContentList(ContentSetting contentSetting);


}
