package com.tmmmi.service.diary;

import com.tmmmi.service.domain.Diary;

public interface DiaryService {
	
	public void addDiary(Diary diary) throws Exception;
	
	public Diary getDiary(int diaryNo) throws Exception;
	
	public void getDiaryList();
	
	public void updateDiary(Diary diary) throws Exception;
	
	public void deleteDiary(int diaryNo) throws Exception;
}
