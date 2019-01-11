package com.tmmmi.service.faq.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tmmmi.service.domain.FAQ;
import com.tmmmi.service.faq.FAQDao;

public class FAQDaoImpl implements FAQDao {
	
	//Field
	private SqlSession sqlSession;


	//Constructor
	public FAQDaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@Override
	public void addFAQ() throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public void getFAQList() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateFAQ() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFAQ() {
		// TODO Auto-generated method stub
		
	}

}
