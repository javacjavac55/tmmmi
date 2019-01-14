package com.tmmmi.service.usersetting;

import com.tmmmi.service.domain.UserSetting;

public interface UserSettingDao {
	public void addUserSetting(UserSetting userSetting);
	public UserSetting getUserSetting(int userNo);
	public void updateUserSetting(UserSetting userSetting);
}
