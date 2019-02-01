package com.tmmmi.service.usercategory;

import java.util.List;

import com.tmmmi.service.domain.UserCategory;

public interface UserCategoryDao {
	public int addUserCategory(UserCategory userCategory);
	public UserCategory getUserCategory(UserCategory userCategory);
	public List<UserCategory> getUserCategoryList(int userNo);
	public int updateUserCategory(UserCategory userCategory);
	public int deleteUserCategory(UserCategory userCategory);
}
