package com.tmmmi.service.user.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tmmmi.common.Search;
import com.tmmmi.service.domain.User;
import com.tmmmi.service.user.UserDao;

@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao {
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public UserDaoImpl() {
		System.out.println(this.getClass());
	}
	
	///Method
	@Override
	public void addUser(User user) throws Exception {
		sqlSession.insert("UserMapper.addUser", user);
		sqlSession.insert("UserSetting.addUserSetting", user.getUserNo());
		sqlSession.insert("ContentSettingMapper.addContentSetting", user.getUserNo());
		sqlSession.insert("ContentSettingMapper.addShoppingKeyword", user.getUserNo());
		sqlSession.insert("ContentSettingMapper.addUserKeyword", user.getUserNo());
		sqlSession.insert("ContentSettingMapper.addSortSection", user.getUserNo());
	}

	@Override
	public User getUser(int userNo) throws Exception {
		return sqlSession.selectOne("UserMapper.getUser", userNo);
	}
	
	@Override
	public User getUserId(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.getUserId", userId);
	}

	@Override
	public void updateUser(User user) throws Exception {
		sqlSession.update("UserMapper.updateUser", user);
	}

	@Override
	public List<User> getUserList(Search search) throws Exception {
		return sqlSession.selectList("UserMapper.getUserList", search);
	}
	
	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("UserMapper.getTotalCount", search);
	}
	
	@Override
	public void withdrawUser(User user) throws Exception {
		sqlSession.update("UserMapper.withdrawUser", user);
	}
	
	@Override
	public User searchUserId(User user) {
		return sqlSession.selectOne("UserMapper.searchUserId", user);
	}
	@Override
	public User searchUserPw(User user) {
		return sqlSession.selectOne("UserMapper.searchUserPw", user);
	}
	
	@Override
	public User emailCheckDuplication(String email) {
		return sqlSession.selectOne("UserMapper.getUserEmail", email);
	}
	


}
