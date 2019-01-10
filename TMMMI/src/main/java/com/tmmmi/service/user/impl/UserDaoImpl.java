package com.tmmmi.service.user.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

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
	}

	@Override
	public User getUser(int userNo) throws Exception {
		return sqlSession.selectOne("UserMapper.getUser", userNo);
	}
	
	@Override
	public User getUser(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.getUserId", userId);
	}

	@Override
	public void updateUser(User user) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUser(int user_no) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<User> getUserList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void emailCheckDuplication() {
		// TODO Auto-generated method stub
		
	}


}
