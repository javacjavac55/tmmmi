package com.tmmmi.service.contentsetting.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tmmmi.service.contentsetting.ContentSettingDao;
import com.tmmmi.service.domain.ContentSetting;

@Repository("contentSettingDaoImpl")
public class ContentSettingDaoImpl implements ContentSettingDao {
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public ContentSettingDaoImpl() {
		System.out.println(this.getClass());
	}
	
	///Method
	@Override
	public void addContentSetting(ContentSetting contentSetting) {
		sqlSession.insert("ContentSettingMapper.addContentSetting", contentSetting);
		sqlSession.insert("ContentSettingMapper.addShoppingKeyword", contentSetting);
		sqlSession.insert("ContentSettingMapper.addUserKeyword", contentSetting);
		sqlSession.insert("ContentSettingMapper.addSortSection", contentSetting);
	}
	
	@Override
	public ContentSetting getContentSetting(int userNo) {
		return sqlSession.selectOne("ContentSettingMapper.getContentSetting", userNo);
	}

	@Override
	public void updateContentSetting(ContentSetting contentSetting) {
		sqlSession.update("ContentSettingMapper.updateContentSetting", contentSetting);
		sqlSession.update("ContentSettingMapper.updateShoppingKeyword", contentSetting);
		sqlSession.update("ContentSettingMapper.updateUserKeyword", contentSetting);
		sqlSession.update("ContentSettingMapper.updateSortSection", contentSetting);
	}


}
