package com.tmmmi.service.faq;

import java.util.Map;

import com.tmmmi.common.Search;
import com.tmmmi.service.domain.FAQ;

public interface FAQService {
	
	public void addFAQ(FAQ faq)  throws Exception;
	
	public Map<String,Object> getFAQList(Search search) throws Exception;
	
	public void updateFAQ(FAQ faq) throws Exception;
	
	public FAQ getFAQ(int FAQNo) throws Exception;
	
	public void deleteFAQ(FAQ faq) throws Exception;
}
