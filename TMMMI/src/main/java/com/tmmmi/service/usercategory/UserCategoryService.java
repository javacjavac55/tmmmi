package com.tmmmi.service.usercategory;

import java.util.List;

import com.tmmmi.service.domain.UserCategory;

public interface UserCategoryService {
	public int addUserCategory(UserCategory userCategory);
	public List<UserCategory> getUserCategoryList(int userNo);
	public List<UserCategory> getInterestCategoryList();
	public int updateUserCategory(UserCategory userCategory);
	public int deleteUserCategory(UserCategory userCategory);
	
}
