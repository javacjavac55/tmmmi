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
		if (userCategoryDao.getUserCategory(userCategory) != null) {
			return -1;
		}
		if (userCategoryDao.addUserCategory(userCategory) == 1) {
			return userCategoryDao.getUserCategory(userCategory).getUserCategoryNo();
		} else {
			return -1;
		}
	}

	@Override
	public List<UserCategory> getUserCategoryList(int userNo) {
		return userCategoryDao.getUserCategoryList(userNo);
	}
	
	@Override
	public List<UserCategory> getInterestCategoryList() {
		return userCategoryDao.getUserCategoryList(101);
	}

	@Override
	public int updateUserCategory(UserCategory userCategory) {
		if (userCategoryDao.getUserCategory(userCategory) != null) {
			return -1;
		}
		if (userCategoryDao.updateUserCategory(userCategory) == 1) {
			return 1;
		} else {
			return -1;
		}
	}

	@Override
	public int deleteUserCategory(UserCategory userCategory) {
		return userCategoryDao.deleteUserCategory(userCategory);
	}

	@Override
	public UserCategory getUserCategoryByNo(int userCategoryNo) {
		// TODO Auto-generated method stub
		return userCategoryDao.getUserCategoryByNo(userCategoryNo);
	}
}
