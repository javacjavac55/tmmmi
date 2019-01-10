package com.tmmmi.service.user;

import java.util.List;

import com.tmmmi.service.domain.User;

public interface UserDao {
	public void addUser(User user) throws Exception;
	public User getUser(int userNo) throws Exception;
	public User getUser(String userId) throws Exception;
	public void updateUser(User user) throws Exception;
	public void deleteUser(int userNo) throws Exception;
	public List<User> getUserList() throws Exception;
	public void emailCheckDuplication();
}
