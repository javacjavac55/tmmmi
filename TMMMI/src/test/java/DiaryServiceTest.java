import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tmmmi.common.Search;
import com.tmmmi.service.diary.DiaryService;
import com.tmmmi.service.domain.Diary;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
		"classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml" })

public class DiaryServiceTest {
	
	@Autowired
	@Qualifier("diaryServiceImpl")
	private DiaryService diaryService;
	
	//@Test
	public void testAddDiary() throws Exception {
		
		Diary diary= new Diary();		
		diary.setUserNo(777);
		diary.setDiaryTitle("ºü¿°");
		diary.setDiaryDetail("·ê·ê¶ö¶ó");
		diary.setUserCategoryNo(2);		
		
		diaryService.addDiary(diary);
		
		

		//==> console È®ÀÎ
		//System.out.println(user);
		
		//==> API È®ÀÎ
		Assert.assertEquals(777, diary.getUserNo());
		Assert.assertEquals("ºü¿°", diary.getDiaryTitle());
		Assert.assertEquals("·ê·ê¶ö¶ó", diary.getDiaryDetail());
		Assert.assertEquals(2, diary.getUserCategoryNo());
		
	}
	//@Test
		public void testGetDiary() throws Exception {
			
		Diary diary= new Diary();		
			//==> ÇÊ¿äÇÏ´Ù¸é...
//				user.setUserId("testUserId");
//				user.setUserName("testUserName");
//				user.setPassword("testPasswd");
//				user.setSsn("1111112222222");
//				user.setPhone("111-2222-3333");
//				user.setAddr("°æ±âµµ");
//				user.setEmail("test@test.com");
			
		diary = diaryService.getDiary(2);

			//==> console È®ÀÎ
			//System.out.println(user);
			
			//==> API È®ÀÎ
		Assert.assertEquals(0, diary.getUserNo());
		Assert.assertEquals("213", diary.getDiaryTitle());
		Assert.assertEquals("		    213123", diary.getDiaryDetail());
		Assert.assertEquals(123, diary.getUserCategoryNo());

			/*Assert.assertNotNull(userService.getUser("user02"));
			Assert.assertNotNull(userService.getUser("user05"));*/
		}
	
	//@Test
		 public void testUpdateDiary() throws Exception{
			 
			Diary diary =diaryService.getDiary(2);
			Assert.assertNotNull(diary);
			
			Assert.assertEquals(0, diary.getUserNo());
			Assert.assertEquals("1234", diary.getDiaryTitle());
			Assert.assertEquals("¶ó¶ó¶ó", diary.getDiaryDetail());
			Assert.assertEquals(1, diary.getUserCategoryNo());

			diary.setUserCategoryNo(789);
			diary.setDiaryTitle("777-7777-7777");
			diary.setDiaryDetail("change");
			
			
			diaryService.updateDiary(diary);
			
			diary = diaryService.getDiary(2);
			Assert.assertNotNull(diary);
			
			//==> console È®ÀÎ
			//System.out.println(user);
				
			//==> API È®ÀÎ
			Assert.assertEquals("change", diary.getDiaryDetail());
			Assert.assertEquals("777-7777-7777", diary.getDiaryTitle());
			Assert.assertEquals(789, diary.getUserCategoryNo());			
		 }
		//@Test
			public void testDeleteEDiary() throws Exception {
				
			Diary diary= new Diary();		
				//==> ÇÊ¿äÇÏ´Ù¸é...
//					user.setUserId("testUserId");
//					user.setUserName("testUserName");
//					user.setPassword("testPasswd");
//					user.setSsn("1111112222222");
//					user.setPhone("111-2222-3333");
//					user.setAddr("°æ±âµµ");
//					user.setEmail("test@test.com");
				
			diary = diaryService.getDiary(7);
			
			Assert.assertEquals("ºü¿°", diary.getDiaryTitle());
			Assert.assertEquals("·ê·ê¶ö¶ó", diary.getDiaryDetail());
			Assert.assertEquals(2, diary.getUserCategoryNo());
			
			diaryService.deleteDiary(7);
			

				/*Assert.assertNotNull(userService.getUser("user02"));
				Assert.assertNotNull(userService.getUser("user05"));*/
			}
		@Test
		 public void testGetDiaryListAll() throws Exception{
			 
		 	Search search = new Search();
		 	search.setCurrentPage(1);
		 	search.setPageSize(3);


		 	System.out.println("dd"+search.getStartRowNum());
		 	System.out.println(search.getEndRowNum());
		 	int userNo = 13000; 
		 	Map<String,Object> map = diaryService.getDiaryList(search, userNo);
		 	
		 	List<Object> list = (List<Object>)map.get("list");
		 	Assert.assertEquals(1, list.size());
		 	
			//==> console È®ÀÎ
		 	//System.out.println(list);
		 	
		 	Integer totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 	
		 	System.out.println("=======================================");
		 	
		 	search.setCurrentPage(1);
		 	search.setPageSize(3);
		 	map = diaryService.getDiaryList(search, userNo);
		 	
		 	list = (List<Object>)map.get("list");
		 	/*Assert.assertEquals(3, list.size());*/
		 	
		 	//==> console È®ÀÎ
		 	//System.out.println(list);
		 	
		 	totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 }
}
