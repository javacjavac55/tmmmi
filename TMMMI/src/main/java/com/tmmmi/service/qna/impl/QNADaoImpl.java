package com.tmmmi.service.qna.impl;

import java.util.List;

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
	public List<QNA> getQNAList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("QNAMapper.getQNAList", search);
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
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("FAQMapper.getTotalCount", search);
	}

}
