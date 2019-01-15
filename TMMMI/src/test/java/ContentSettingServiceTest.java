import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tmmmi.service.contentsetting.ContentSettingService;
import com.tmmmi.service.domain.ContentSetting;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
		"classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml" })
public class ContentSettingServiceTest {
	@Autowired
	@Qualifier("contentSettingServiceImpl")
	private ContentSettingService contentSettingService;
	
	//@Test
	public void testAddContentSetting() throws Exception{
		ContentSetting contentSetting = new ContentSetting();
		contentSetting.setUserNo(1);
		
		contentSettingService.addContentSetting(contentSetting);
		
	}
	
	//@Test
	public void testGetContentSetting() throws Exception{
		ContentSetting contentSetting = contentSettingService.getContentSetting(1);
		System.out.println(contentSetting);
		Assert.assertEquals(1, contentSetting.getUserNo());
	}
	
	@Test
	public void testUpdateContentSetting() throws Exception{
		ContentSetting contentSetting = new ContentSetting();
		contentSetting.setUserNo(1);
		contentSetting.setTastyKeyword("서울");
		contentSettingService.updateContentSetting(contentSetting);
		
		contentSetting = contentSettingService.getContentSetting(1);
		Assert.assertEquals("서울", contentSetting.getTastyKeyword());
	}
}
