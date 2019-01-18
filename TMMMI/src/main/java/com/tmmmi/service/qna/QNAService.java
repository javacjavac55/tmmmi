package com.tmmmi.service.qna;

import java.util.Map;

import com.tmmmi.common.Search;
import com.tmmmi.service.domain.QNA;

public interface QNAService {
	
	public void addQNA(QNA qna) throws Exception;
	
	public QNA getQNA(int userNo) throws Exception;
	
	public Map<String,Object> getQNAList(Search search, int userNo) throws Exception;
	
	public Map<String,Object> getAdminQNAList(Search search) throws Exception;
	
	public void updateQNA(QNA qna) throws Exception;
	
	public void addQNAAnswer(QNA qna) throws Exception;
	
	public void updateQNAAnswer(QNA qna) throws Exception;
	
}
