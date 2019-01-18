package com.tmmmi.service.qna.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tmmmi.common.Search;
import com.tmmmi.service.domain.QNA;
import com.tmmmi.service.qna.QNADao;

@Repository("qnaDaoImpl")
public class QNADaoImpl implements QNADao {

	//Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
		
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public QNADaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@Override
	public void addQNA(QNA qna) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("QNAMapper.addQNA", qna);
	}

	@Override
	public QNA getQNA(int userNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("QNAMapper.getQNA", userNo);
	}

	@Override
	public List<QNA> getQNAList(Search search, int userNo) throws Exception {
		// TODO Auto-generated method stub
		Map<String , Object>  map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("userNo",userNo);
		return sqlSession.selectList("QNAMapper.getQNAList", map);
	}

	@Override
	public void updateQNA(QNA qna) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("QNAMapper.updateQNA", qna);
	}

	@Override
	public void addQNAAnswer(QNA qna) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("QNAMapper.addQNAAnswer", qna);
	}

	@Override
	public void updateQNAAnswer(QNA qna) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("QNAMapper.updateQNAAnswer", qna);
	}

	@Override
	public int getTotalCount(int userNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("QNAMapper.getTotalCount", userNo);
	}

}
