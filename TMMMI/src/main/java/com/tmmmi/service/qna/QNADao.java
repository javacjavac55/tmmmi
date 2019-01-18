package com.tmmmi.service.qna;

import java.util.List;

import com.tmmmi.common.Search;
import com.tmmmi.service.domain.QNA;

public interface QNADao {
	
	public void addQNA(QNA qna) throws Exception ;
		
	public List<QNA> getQNAList(Search search, int userNo) throws Exception ;
	
	public List<QNA> getAdminQNAList(Search search) throws Exception ;
	
	public int getTotalCount(int userNo) throws Exception;
	
	public int getAdminTotalCount(Search search) throws Exception;
	
	public void updateQNA(QNA qna) throws Exception ;
	
	public QNA getQNA(int userNo) throws Exception ;
	
	public void addQNAAnswer(QNA qna) throws Exception ;
	
	public void updateQNAAnswer(QNA qna) throws Exception ;
}
