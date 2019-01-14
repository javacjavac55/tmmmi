package com.tmmmi.service.usersetting.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tmmmi.service.domain.UserSetting;
import com.tmmmi.service.usersetting.UserSettingDao;

@Repository("userSettingDaoImpl")
public class UserSettingDaoImpl implements UserSettingDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public UserSettingDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addUserSetting(UserSetting userSetting) {
		sqlSession.insert("UserSettingMapper.addUserSetting", userSetting);
	}

	@Override
	public UserSetting getUserSetting(int userNo) {
		return sqlSession.selectOne("UserSettingMapper.getUserSetting", userNo);
	}

	@Override
	public void updateUserSetting(UserSetting userSetting) {
		sqlSession.update("UserSettingMapper.updateUserSetting", userSetting);
	}

}
