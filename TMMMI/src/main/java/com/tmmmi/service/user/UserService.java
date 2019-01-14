package com.tmmmi.service.user;

import java.util.Map;

import com.tmmmi.service.domain.User;

public interface UserService {
	public void addUser(User user) throws Exception;
	public User getUser(int userNo) throws Exception;
	public User getUserId(String userId) throws Exception;
	public void updateUser(User user) throws Exception;
	public void deleteUser(int userNo) throws Exception;
	public Map<String, Object> getUserList() throws Exception;
	public void emailCheckDuplication();
	public boolean sendMail(String email, String authNum) throws Exception;
	public boolean checkDuplication(String userId) throws Exception;
}
