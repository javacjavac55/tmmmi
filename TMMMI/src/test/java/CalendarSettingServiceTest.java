import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tmmmi.service.calendarsetting.CalendarSettingService;
import com.tmmmi.service.domain.CalendarSetting;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)

//==> Meta-Data 를 다양하게 Wiring 하자...
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })

public class CalendarSettingServiceTest {
	@Autowired
	@Qualifier("calendarSettingServiceImpl")
	private CalendarSettingService calendarSettingService;
	
	//@Test
	public void testAddCalendarSetting() throws Exception{
		CalendarSetting calendarSetting = new CalendarSetting();
		calendarSetting.setCalendarStartDay(1);
		calendarSetting.setUserNo(1);
		
		calendarSettingService.addCalendarSetting(calendarSetting);
		
		calendarSetting = calendarSettingService.getCalendarSetting(1);
		
		Assert.assertEquals(0, calendarSetting.getShowMovie());
	}
	
	//@Test
	public void testGetCalendarSetting() throws Exception{
		
		CalendarSetting calendarSetting = calendarSettingService.getCalendarSetting(1);
		
		Assert.assertEquals(0, calendarSetting.getShowMovie());
	}
	
	@Test
	public void testUpdateCalendarSetting() throws Exception{
		CalendarSetting calendarSetting = new CalendarSetting();
		calendarSetting.setUserNo(1);
		calendarSetting.setShowMovie(0);
		
		calendarSettingService.updateCalendarSetting(calendarSetting);
		calendarSetting = calendarSettingService.getCalendarSetting(1);
		
		Assert.assertEquals(0, calendarSetting.getShowMovie());
	}

}
