package com.tmmmi.service.diary;

import java.util.Map;

import com.tmmmi.common.Search;
import com.tmmmi.service.domain.Diary;

public interface DiaryService {
	
	public void addDiary(Diary diary) throws Exception;
	
	public Diary getDiary(int diaryNo) throws Exception;
	
	public Map<String, Object> getDiaryList(Search search, int userNo) throws Exception;
	
	public void updateDiary(Diary diary) throws Exception;
	
	public void deleteDiary(int diaryNo) throws Exception;
}
