package com.tmmmi.service.user.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tmmmi.service.domain.User;
import com.tmmmi.service.user.UserDao;
import com.tmmmi.service.user.UserService;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {
	
	///Field
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	///Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addUser(User user) throws Exception {
		userDao.addUser(user);
	}

	@Override
	public User getUser(int userNo) throws Exception {
		return userDao.getUser(userNo);
	}

	@Override
	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
	}

	@Override
	public void deleteUser(int userNo) throws Exception{
		userDao.deleteUser(userNo);
	}

	@Override
	public Map<String, Object> getUserList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void emailCheckDuplication() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean checkDuplication(String userId) throws Exception {
		System.out.println("checkDuplication Ω√¿€");
		boolean result=true;
		User user=userDao.getUserId(userId);
		if(user != null) {
			result=false;
		}
		return result;
	}

	@Override
	public User getUserId(String userId) throws Exception {
		return userDao.getUserId(userId);
	}

}
