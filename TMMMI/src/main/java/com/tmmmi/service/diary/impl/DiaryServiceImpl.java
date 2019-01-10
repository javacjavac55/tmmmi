package com.tmmmi.service.diary.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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
	public void getDiaryList() {
		// TODO Auto-generated method stub
		
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
