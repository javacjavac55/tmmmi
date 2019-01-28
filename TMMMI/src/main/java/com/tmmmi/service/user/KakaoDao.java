package com.tmmmi.service.user;

import javax.servlet.http.HttpSession;

import com.tmmmi.service.domain.User;

public interface KakaoDao {
	
	public String getAuthorizationUrl(HttpSession session);
	
	public User getAccessToken(HttpSession session,String code)throws Exception;
	
	public User getUserProfile(User user)throws Exception;
}
