package com.tmmmi.service.faq;

import java.util.List;

import com.tmmmi.common.Search;
import com.tmmmi.service.domain.FAQ;

public interface FAQDao {
	
	public void addFAQ(FAQ faq) throws Exception ;
	
	public List<FAQ> getFAQList(Search search) throws Exception ;
	
	public void updateFAQ(FAQ faq) throws Exception ;

	public FAQ getFAQ(int FAQNo) throws Exception;
	
	public void deleteFAQ() throws Exception ;
	
	public int getTotalCount(Search search) throws Exception;
}
