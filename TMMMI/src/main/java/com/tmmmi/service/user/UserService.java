package com.tmmmi.service.user;

import java.util.Map;

import com.tmmmi.service.domain.User;

public interface UserService {
	public void addUser(User user) throws Exception;
	public User getUser(int userNo) throws Exception;
	public User getUser(String userId) throws Exception;
	public void updateUser(User user) throws Exception;
	public void deleteUser(int userNo);
	public Map<String, Object> getUserList() throws Exception;
	public void emailCheckDuplication();
	public boolean checkDuplication(String userId) throws Exception;
}
