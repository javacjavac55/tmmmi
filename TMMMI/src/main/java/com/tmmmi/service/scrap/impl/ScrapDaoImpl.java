package com.tmmmi.service.scrap.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tmmmi.common.Search;
import com.tmmmi.service.domain.Scrap;
import com.tmmmi.service.scrap.ScrapDao;

@Repository("scrapDaoImpl")
public class ScrapDaoImpl implements ScrapDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public ScrapDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addScrap(Scrap scrap) {
		// TODO Auto-generated method stub
		sqlSession.insert("ScrapMapper.addScrap", scrap);	
	}

	@Override
	public Scrap getScrap(int scrapNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ScrapMapper.getScrap", scrapNo);
	}

	@Override
	public List<Scrap> getScrapList(Search search, int userNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("userNo", userNo);
		
		return sqlSession.selectList("ScrapMapper.getScrapList", map);
		
	}	

	@Override
	public void updateScrap(Scrap scrap) {
		// TODO Auto-generated method stub
		sqlSession.update("ScrapMapper.updateScrap", scrap);		
	}

	@Override
	public void deleteScrap(int scrapNo)throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("ScrapMapper.deleteScrap", scrapNo);
	}
	
	@Override
	public int getTotalCount(int userNo) throws Exception{
		return sqlSession.selectOne("ScrapMapper.getTotalCount", userNo);
	}


}
