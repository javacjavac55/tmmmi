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
import com.tmmmi.service.domain.UserCategory;

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
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("search", search);
		map.put("userNo", userNo);
		
		List<Diary> re= sqlSession.selectList("DiaryMapper.getDiaryList", map);
		
		for(Diary image: re) {
			//
			
			String detail = image.getDiaryDetail();
			//System.out.println("다이어리 내용"+image.getDiaryDetail());
			
			if(detail.contains("img")==true) {
				detail = detail.split("src=")[1].split("style")[0];
				detail = "<img src="+detail+" style=\"width:100%\">";
			}
			else {
				detail = "<img src=/images/diaryImage/49760081.jpg>";
				//<img src= /diary/imageDiary/ 312321.j[g]>
			}
			//System.out.println("이미지파일"+ detail);
			
			//System.out.println("이미지파일origin"+ detail);
			
			image.setDiaryDetail(detail);
			//
		}		
		
		return re;
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
	public int getTotalCount(Search search, int userNo) throws Exception{
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("search", search);
		map.put("userNo", userNo);
		
		return sqlSession.selectOne("DiaryMapper.getTotalCount", map);
		
		
	}

}
