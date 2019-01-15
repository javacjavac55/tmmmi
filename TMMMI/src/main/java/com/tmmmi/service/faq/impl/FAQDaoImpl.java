package com.tmmmi.service.faq.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tmmmi.common.Search;
import com.tmmmi.service.domain.FAQ;
import com.tmmmi.service.faq.FAQDao;

@Repository("faqDaoImpl")
public class FAQDaoImpl implements FAQDao {
	
	//Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	//Constructor
	public FAQDaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@Override
	public void addFAQ(FAQ faq) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("FAQMapper.addFAQ", faq);
	}

	@Override
	public List<FAQ> getFAQList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("FAQMapper.getFAQList", search);
	}

	@Override
	public void updateFAQ(FAQ faq)throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("FAQMapper.updateFAQ", faq);
	}

	@Override
	public void deleteFAQ() throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	public int getTotalCount(Search search) throws Exception{
		return sqlSession.selectOne("FAQMapper.getTotalCount", search);
	}

	@Override
	public FAQ getFAQ(int FAQNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("FAQMapper.getFAQ", FAQNo);
	}

}
