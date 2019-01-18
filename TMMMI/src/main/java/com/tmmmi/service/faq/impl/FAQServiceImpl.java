package com.tmmmi.service.faq.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tmmmi.common.Search;
import com.tmmmi.service.domain.FAQ;
import com.tmmmi.service.faq.FAQDao;
import com.tmmmi.service.faq.FAQService;

@Service("faqServiceImpl")
public class FAQServiceImpl implements FAQService {
	
	@Autowired
	@Qualifier("faqDaoImpl")
	private FAQDao faqDao;
	
	public void setFAQDao(FAQDao faqDao) {
		this.faqDao = faqDao;
	}
	
	public FAQServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@Override
	public void addFAQ(FAQ faq) throws Exception {
		// TODO Auto-generated method stub
		faqDao.addFAQ(faq);
	}

	@Override
	public Map<String, Object> getFAQList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<FAQ> list = faqDao.getFAQList(search);
		int totalCount = faqDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		return map;
	}

	@Override
	public void updateFAQ(FAQ faq) throws Exception {
		// TODO Auto-generated method stub
		faqDao.updateFAQ(faq);
	}

	@Override
	public void deleteFAQ(FAQ faq )throws Exception {
		// TODO Auto-generated method stub
		faqDao.deleteFAQ(faq);
	}

	@Override
	public FAQ getFAQ(int FAQNo) throws Exception {
		// TODO Auto-generated method stub
		return faqDao.getFAQ(FAQNo);
	}

}
