package com.tmmmi.service.scrap;

import java.util.List;

import com.tmmmi.common.Search;
import com.tmmmi.service.domain.Scrap;

public interface ScrapDao {
	public void addScrap(Scrap scrap) throws Exception;
	
	public Scrap getScrap(int scrapNo) throws Exception;
	
	public List<Scrap> getScrapList(Search search, int userNo) throws Exception;
	
	public void updateScrap(Scrap scrap) throws Exception;
	
	public void deleteScrap(int scrapNo) throws Exception;
	
	public int getTotalCount(int userNo)throws Exception;
	
}