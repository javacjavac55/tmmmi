package com.tmmmi.service.diary.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tmmmi.common.Search;
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
		System.out.println(this.getClass());
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
	public List<Diary> getDiaryList(Search search, int userNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("search", search);
		map.put("userNo", userNo);
		
		return sqlSession.selectList("DiaryMapper.getDiaryList", map);
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
	public int getTotalCount(int userNo) throws Exception{
		return sqlSession.selectOne("DiaryMapper.getTotalCount", userNo);
	}

}
