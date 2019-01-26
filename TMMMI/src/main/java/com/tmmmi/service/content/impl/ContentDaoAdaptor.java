package com.tmmmi.service.content.impl;

import java.util.List;

import com.tmmmi.service.content.ContentDao;
import com.tmmmi.service.domain.ContentSetting;

public abstract class ContentDaoAdaptor implements ContentDao {
	//movie
	public List<Object> getBoxOfficeList(ContentSetting contentSetting, int index) throws Exception {
		// TODO Auto-generated method stub
				return null;
	}
	
	//sport
	@Override
	public List<Object> getContentKsoccerList(ContentSetting contentSetting, int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> getContentWsoccerList(ContentSetting contentSetting, int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> getContentKbaseballList(ContentSetting contentSetting, int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> getContentWbaseballList(ContentSetting contentSetting, int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> getContentBasketballList(ContentSetting contentSetting, int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> getContentGeneralList(ContentSetting contentSetting, int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Object> getContentHighlightList(ContentSetting contentSetting, int index) throws Exception{
		return null;
	}

	//tasty
	public List<Object> getContentTastyList(ContentSetting contentSetting, int index) throws Exception{
		return null;
	}
	
	//shopping
	@Override
	public List<Object> getContentShoppingFirstList(ContentSetting contentSetting, int index) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	//keyword
}
