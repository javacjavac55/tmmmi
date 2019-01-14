package com.tmmmi.service.diary;

import java.util.List;

import com.tmmmi.common.Search;
import com.tmmmi.service.domain.Diary;

public interface DiaryDao {
	
	public void addDiary(Diary diary) throws Exception;
	
	public Diary getDiary(int diaryNo)throws Exception;
	
	public List<Diary> getDiaryList(Search search, int userNo) throws Exception;
	
	public void updateDiary(Diary diary) throws Exception;
	
	public void deleteDiary(int diaryNo) throws Exception;
	
	public int getTotalCount(int userNo)throws Exception;
}
