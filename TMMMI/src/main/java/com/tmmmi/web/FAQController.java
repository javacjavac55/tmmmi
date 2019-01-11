package com.tmmmi.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tmmmi.service.domain.FAQ;
import com.tmmmi.service.faq.FAQService;

public class FAQController {
	

	private FAQService faqService;
	
	public FAQController() {
		// TODO Auto-generated constructor stub

	}

	public void addFAQ() throws Exception {
	
	}
	
	public void getFAQList() {}
	public void updateFAQ() {}
	public void deleteFAQ() {}
	
}
