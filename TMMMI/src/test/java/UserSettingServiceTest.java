import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tmmmi.service.domain.UserSetting;
import com.tmmmi.service.usersetting.UserSettingService;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)

//==> Meta-Data 를 다양하게 Wiring 하자...
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })
public class UserSettingServiceTest {
	@Autowired
	@Qualifier("userSettingServiceImpl")
	private UserSettingService userSettingService;
	
	//@Test
	public void testAddUserSetting() throws Exception{
		UserSetting userSetting = new UserSetting();
		userSetting.setUserNo(1);
		System.out.println("userSetting.getUserNo: "+userSetting.getUserNo());
		System.out.println("userSetting.getMainColorModeNo: "+userSetting.getMainColorModeNo());
		userSettingService.addUserSetting(userSetting);
		
		userSetting = userSettingService.getUserSetting(1);
		
		Assert.assertEquals(0, userSetting.getMainColorModeNo());
	}
	
	//@Test
	public void testGetUserSetting() throws Exception{
		UserSetting userSetting = userSettingService.getUserSetting(1);
		
		Assert.assertEquals(1, userSetting.getUserNo());
	}
	
	@Test
	public void testUpdateUserSetting() throws Exception{
		
		UserSetting userSetting = new UserSetting();
		userSetting.setUserNo(1);
		userSetting.setMainColorModeNo(1);
		userSetting.setMenuFontColor("#000000");
		
		userSettingService.updateUserSetting(userSetting);
		
		userSetting = userSettingService.getUserSetting(1);
		System.out.println("userSetting.getMainColorModeNo: "+userSetting.getMainColorModeNo());
		Assert.assertEquals(1, userSetting.getMainColorModeNo());
	}

}
