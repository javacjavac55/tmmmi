import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tmmmi.common.Search;
import com.tmmmi.service.domain.User;
import com.tmmmi.service.user.UserService;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)

//==> Meta-Data �� �پ��ϰ� Wiring ����...
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
										"classpath:config/context-aspect.xml",
										"classpath:config/context-mybatis.xml",
										"classpath:config/context-transaction.xml" })


public class UserServiceTest {
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	//@Test
	public void testAddUser() throws Exception{
			
		User user = new User();
		user.setUserId("tAddUser");
		user.setPassword("kkkk");
		user.setEmail("a@a.com");
		user.setEmailCheck(1);
		user.setUserName("��ȣ");
		
		userService.addUser(user);
		user = userService.getUserId("tAddUser");
		
		Assert.assertEquals("kkkk", user.getPassword());
	}
	
	//@Test
	public void testGetUser() throws Exception{
		User user = userService.getUser(33);
		
		Assert.assertEquals("tAddUser", user.getUserId());
	}
	
	@Test
	public void testUpdateUser() throws Exception{
		User user = userService.getUser(28);
		user.setRole(1);
		System.out.println("��ȣ"+user);
		userService.updateUser(user);
		
		user = userService.getUserId("adminc");
		Assert.assertEquals(1, user.getRole());
	}
	
	//@Test
	public void testGetUserList() throws Exception{
		Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	Map<String,Object> map = userService.getUserList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
		//==> console Ȯ��
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = userService.getUserList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console Ȯ��
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	}
	
	//@Test
	public void testWithdrawUser() throws Exception{
		User user = new User();
		user.setUserNo(1);
		user.setWithdrawCheck(1);
		
		userService.withdrawUser(user);
		user = userService.getUser(1);
		
		Assert.assertEquals(1, user.getWithdrawCheck());
	}

}
