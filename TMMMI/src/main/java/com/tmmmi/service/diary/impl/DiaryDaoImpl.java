package com.tmmmi.service.diary.impl;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tmmmi.service.diary.DiaryDao;
import com.tmmmi.service.domain.Diary;

@Repository("diaryDaoImpl")
public class DiaryDaoImpl implements DiaryDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession	 = sqlSession;
	}
	
	public DiaryDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void addDiary(Diary diary)throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("DiaryMapper.addDiary", diary);
		
	}

	@Override
	public Diary getDiary(int diaryNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("DiaryMapper.getDiary", diaryNo);
	}

	@Override
	public void getDiaryList() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateDiary(Diary diary)throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("DiaryMapper.updateDiary", diary);
	}

	@Override
	public void deleteDiary(int diaryNo)throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("DiaryMapper.deleteDiary", diaryNo);
	}
	
	@Override
	public void getTotalCount() {
		
	}

}
