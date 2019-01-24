package com.tmmmi.service.content;

import java.util.List;

import com.tmmmi.service.domain.ContentSetting;

public interface ContentDao {
	
	public void getContent() throws Exception;

	public List<Object> getContentList(ContentSetting contentSetting) throws Exception;

}
