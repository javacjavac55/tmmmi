package com.tmmmi.service.todo.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tmmmi.service.domain.ToDo;
import com.tmmmi.service.todo.ToDoDao;

@Repository("ToDoDaoImpl")
public class ToDoDaoImpl implements ToDoDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlsession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public ToDoDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void getToDoList() {
	}

	@Override
	public void addToDo(ToDo toDo) throws Exception{
		System.out.println("addToDoDao Á¢±Ù");
		System.out.println(toDo);
		sqlSession.insert("TodoMapper.addTodo", toDo);
	}

	@Override
	public void deleteToDo() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateToDo() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateToDoCheck() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getDayGraph() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getMonthGraph() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getWordCloud() {
		// TODO Auto-generated method stub
		
	}

}
