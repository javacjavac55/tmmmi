package com.tmmmi.service.user;

import java.util.List;

import com.tmmmi.common.Search;
import com.tmmmi.service.domain.User;

public interface UserDao {
	public void addUser(User user) throws Exception;
	public User getUser(int userNo) throws Exception;
	public User getUserId(String userId) throws Exception;
	public void updateUser(User user) throws Exception;
	public void withdrawUser(User user) throws Exception;
	public List<User> getUserList(Search search) throws Exception;
	public User emailCheckDuplication(String email);
	public int getTotalCount(Search search) throws Exception;
	public User searchUserId(User user);
	public void searchUserPw(User user);
}