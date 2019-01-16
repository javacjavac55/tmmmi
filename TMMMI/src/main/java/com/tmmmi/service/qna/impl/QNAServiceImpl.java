package com.tmmmi.service.qna.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tmmmi.common.Search;
import com.tmmmi.service.domain.FAQ;
import com.tmmmi.service.domain.QNA;
import com.tmmmi.service.qna.QNADao;
import com.tmmmi.service.qna.QNAService;

@Service("qnaServiceImpl")
public class QNAServiceImpl implements QNAService {
	
	@Autowired
	@Qualifier("qnaDaoImpl")
	private QNADao qnaDao;

	public void setQNADao(QNADao qnaDao) {
		this.qnaDao = qnaDao;
	}
	
	public QNAServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@Override
	public void addQNA(QNA qna) throws Exception {
		// TODO Auto-generated method stub
		qnaDao.addQNA(qna);
	}

	@Override
	public QNA getQNA(int userNo) throws Exception {
		// TODO Auto-generated method stub
		return qnaDao.getQNA(userNo);
	}

	@Override
	public Map<String, Object>  getQNAList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<QNA> list = qnaDao.getQNAList(search);
		int totalCount = qnaDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		return map;
	}

	@Override
	public void updateQNA(QNA qna) throws Exception {
		// TODO Auto-generated method stub
		qnaDao.updateQNA(qna);
	}

	@Override
	public void addQNAAnswer(QNA qna) throws Exception {
		// TODO Auto-generated method stub
		qnaDao.addQNAAnswer(qna);
	}

	@Override
	public void updateQNAAnswer(QNA qna) throws Exception {
		// TODO Auto-generated method stub
		qnaDao.updateQNAAnswer(qna);
	}

}
