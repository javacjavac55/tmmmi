package com.tmmmi.service.diary.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tmmmi.common.Search;
import com.tmmmi.service.diary.DiaryDao;
import com.tmmmi.service.diary.DiaryService;
import com.tmmmi.service.domain.Diary;

@Service("diaryServiceImpl")
public class DiaryServiceImpl implements DiaryService {
	
	@Autowired
	@Qualifier("diaryDaoImpl")
	private DiaryDao diaryDao;
	
	public DiaryServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@Override
	public void addDiary(Diary diary)throws Exception {
		// TODO Auto-generated method stub
		diaryDao.addDiary(diary);
		
	}

	@Override
	public Diary getDiary(int diaryNo) throws Exception{
		// TODO Auto-generated method stub
		return diaryDao.getDiary(diaryNo);
	}

	@Override
	public Map<String, Object> getDiaryList(Search search, int userNo)throws Exception {
		// TODO Auto-generated method stub
		List<Diary> list=diaryDao.getDiaryList(search, userNo);
		int totalCount = diaryDao.getTotalCount(userNo);
		System.out.println("totalcount:"+totalCount);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	

	@Override
	public void updateDiary(Diary diary) throws Exception {
		// TODO Auto-generated method stub
		diaryDao.updateDiary(diary);
	}

	@Override
	public void deleteDiary(int diaryNo) throws Exception {
		// TODO Auto-generated method stub
		diaryDao.deleteDiary(diaryNo);
	}

}
