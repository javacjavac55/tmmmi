package com.tmmmi.service.user;

import java.util.Map;

import com.tmmmi.common.Search;
import com.tmmmi.service.domain.User;

public interface UserService {
	public void addUser(User user) throws Exception;
	public User getUser(int userNo) throws Exception;
	public User getUserId(String userId) throws Exception;
	public void updateUser(User user) throws Exception;
	public void withdrawUser(User user) throws Exception;
	public void cancleUser(User user) throws Exception;
	public Map<String, Object> getUserList(Search search) throws Exception;
	public boolean sendMail(String email, String authNum) throws Exception;
	public boolean checkDuplication(String userId) throws Exception;
	public boolean emailCheckDuplication(String email);
	public User searchUserId(User user);
	public void searchUserPw(User user);
}
