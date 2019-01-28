package com.tmmmi.service.user.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tmmmi.service.domain.User;
import com.tmmmi.service.user.KakaoDao;
import com.tmmmi.service.user.KakaoService;

@Service("kakaoServiceImpl")
public class KakaoServiceImpl implements KakaoService{
	
	@Autowired
	@Qualifier("kakaoDaoImpl")
	private KakaoDao kakaoDao;

	@Override
	public String getAuthorizationUrl(HttpSession session) {
		return kakaoDao.getAuthorizationUrl(session);
	}

	@Override
	public User getAccessToken(HttpSession session, String code) throws Exception {
		return kakaoDao.getAccessToken(session, code);
	}

	@Override
	public User getUserProfile(User user) throws Exception {
		return kakaoDao.getUserProfile(user);
	}
	
	

}
