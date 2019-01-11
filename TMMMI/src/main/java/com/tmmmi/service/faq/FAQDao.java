package com.tmmmi.service.faq;

import com.tmmmi.service.domain.FAQ;

public interface FAQDao {
	
	public void addFAQ() throws Exception ;
	
	public void getFAQList() throws Exception ;
	
	public void updateFAQ() throws Exception ;
	
	public void deleteFAQ() throws Exception ;
}
