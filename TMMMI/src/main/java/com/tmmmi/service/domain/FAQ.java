package com.tmmmi.service.domain;

import java.sql.Date;

public class FAQ {
	
	private int FAQNo;
	private int FAQCategory;
	private String FAQTitle;
	private String FAQDetail;
	private Date FAQDate;
	
	public FAQ() {
		// TODO Auto-generated constructor stub
	}

	public int getFAQNo() {
		return FAQNo;
	}

	public void setFAQNo(int fAQNo) {
		FAQNo = fAQNo;
	}

	public int getFAQCategory() {
		return FAQCategory;
	}

	public void setFAQCategory(int fAQCategory) {
		FAQCategory = fAQCategory;
	}

	public String getFAQTitle() {
		return FAQTitle;
	}

	public void setFAQTitle(String fAQTitle) {
		FAQTitle = fAQTitle;
	}

	public String getFAQDetail() {
		return FAQDetail;
	}

	public void setFAQDetail(String fAQDetail) {
		FAQDetail = fAQDetail;
	}

	public Date getFAQDate() {
		return FAQDate;
	}

	public void setFAQDate(Date fAQDate) {
		FAQDate = fAQDate;
	}

}
