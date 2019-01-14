package com.tmmmi.service.usercategory.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tmmmi.service.domain.UserCategory;
import com.tmmmi.service.usercategory.UserCategoryDao;

@Repository("userCategoryDaoImpl")
public class UserCategoryDaoImpl implements UserCategoryDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public UserCategoryDaoImpl() {
		
	}

	@Override
	public int addUserCategory(UserCategory userCategory) {
		return sqlSession.insert("UserCategoryMapper.addUserCategory", userCategory);
	}

	@Override
	public List<UserCategory> getUserCategoryList(int userNo) {
		return sqlSession.selectList("UserCategoryMapper.getUserCategoryList", userNo);
	}

	@Override
	public int updateUserCategory(UserCategory userCategory) {
		return sqlSession.update("UserCategoryMapper.updateUserCategory", userCategory);
	}

	@Override
	public int deleteUserCategory(UserCategory userCategory) {
		return sqlSession.delete("UserCategoryMapper.deleteUserCategory", userCategory);
	}
}
