package com.tmmmi.service.scrap.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tmmmi.common.Search;
import com.tmmmi.service.domain.Scrap;
import com.tmmmi.service.scrap.ScrapCrawlDao;
import com.tmmmi.service.scrap.ScrapDao;
import com.tmmmi.service.scrap.ScrapService;

@Service("scrapServiceImpl")
public class ScrapServiceImpl implements ScrapService {
	
	@Autowired
	@Qualifier("scrapDaoImpl")
	private ScrapDao scrapDao;
	
	@Autowired
	@Qualifier("scrapCrawlDaoImpl")
	private ScrapCrawlDao scrapCrawlDao;
	
	public ScrapServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@Override
	public int addScrap(Scrap scrap)throws Exception {
		scrapCrawlDao.crawlScrap(scrap);
		return scrapDao.addScrap(scrap);
	}
	
	@Override
	public int addScrapLink(Scrap scrap)throws Exception {
		return scrapDao.addScrap(scrap);
	}

	@Override
	public Scrap getScrap(int scrapNo) throws Exception {
		// TODO Auto-generated method stub
		return scrapDao.getScrap(scrapNo);
	}

	@Override
	public Map<String, Object> getScrapList(Search search, int userNo)throws Exception {
		// TODO Auto-generated method stub
		List<Scrap> list = scrapDao.getScrapList(search, userNo);
		
		int totalCount = scrapDao.getTotalCount(userNo);
		
		System.out.println("totalcount:"+totalCount);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void updateScrap(Scrap scrap)throws Exception {
		// TODO Auto-generated method stub
		scrapDao.updateScrap(scrap);
	}

	@Override
	public void deleteScrap(int scrapNo) throws Exception{
		// TODO Auto-generated method stub
		scrapDao.deleteScrap(scrapNo);
		
	}

}
