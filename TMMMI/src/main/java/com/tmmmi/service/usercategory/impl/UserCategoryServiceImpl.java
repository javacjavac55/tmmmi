package com.tmmmi.service.usercategory.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tmmmi.service.domain.UserCategory;
import com.tmmmi.service.usercategory.UserCategoryDao;
import com.tmmmi.service.usercategory.UserCategoryService;

@Service("userCategoryServiceImpl")
public class UserCategoryServiceImpl implements UserCategoryService {
	
	@Autowired
	@Qualifier("userCategoryDaoImpl")
	private UserCategoryDao userCategoryDao;
	public void setUserCategoryDao(UserCategoryDao userCategoryDao) {
		this.userCategoryDao = userCategoryDao;
	}
	
	public UserCategoryServiceImpl() {
		
	}

	@Override
	public int addUserCategory(UserCategory userCategory) {
		return userCategoryDao.addUserCategory(userCategory);
	}

	@Override
	public List<UserCategory> getUserCategoryList(int userNo) {
		return userCategoryDao.getUserCategoryList(userNo);
	}

	@Override
	public int updateUserCategory(UserCategory userCategory) {
		return userCategoryDao.updateUserCategory(userCategory);
	}

	@Override
	public int deleteUserCategory(UserCategory userCategory) {
		return userCategoryDao.deleteUserCategory(userCategory);
	}
}
