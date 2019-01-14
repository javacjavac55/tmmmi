package com.tmmmi.service.usersetting.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tmmmi.service.domain.UserSetting;
import com.tmmmi.service.usersetting.UserSettingDao;
import com.tmmmi.service.usersetting.UserSettingService;

@Service("userSettingServiceImpl")
public class UserSettingServiceImpl implements UserSettingService {
	
	///Field
	@Autowired
	@Qualifier("userSettingDaoImpl")
	private UserSettingDao userSettingDao;
	public void setUserSettingDao(UserSettingDao userSettingDao) {
		this.userSettingDao = userSettingDao;
	}
	
	///Constructor
	public UserSettingServiceImpl() {
		System.out.println(this.getClass());
	}
	
	///Method
	@Override
	public void addUserSetting(UserSetting userSetting) {
		userSettingDao.addUserSetting(userSetting);
	}

	@Override
	public UserSetting getUserSetting(int userNo) {
		return userSettingDao.getUserSetting(userNo);
	}

	@Override
	public void updateUserSetting(UserSetting userSetting) {
		userSettingDao.updateUserSetting(userSetting);
	}

}
