package com.tmmmi.service.content;

import java.util.List;
import java.util.Map;

import com.tmmmi.service.domain.ContentSetting;

public interface ContentDao {
	
	public void getContent();
	
	public Map<String,List> getContentList(ContentSetting contentSetting);

}
