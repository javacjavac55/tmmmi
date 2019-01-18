package com.tmmmi.service.todo.impl;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<ToDo> getToDoList(Map<String, Object> todomap) throws Exception {
		System.out.println("getToDoList Dao立辟");
		return sqlSession.selectList("TodoMapper.getTodoList", todomap);
	}

	@Override
	public void addToDo(ToDo toDo) throws Exception{
		System.out.println("addToDoDao 立辟");
		System.out.println(toDo);
		sqlSession.insert("TodoMapper.addTodo", toDo);
	}

	@Override
	public void deleteToDo(ToDo toDo) throws Exception{
		System.out.println("deleteToDoDao 立辟");
		System.out.println(toDo);
		sqlSession.delete("TodoMapper.deleteTodo", toDo);
	}

	@Override
	public void updateToDo(ToDo toDo) throws Exception {
		System.out.println("updateToDoDao 立辟");
		System.out.println(toDo);
		sqlSession.update("TodoMapper.updateTodo",toDo);
	}

	@Override
	public void updateToDoComplete(ToDo toDo) throws Exception {
		System.out.println("updateToDoCompleteDao 立辟");
		System.out.println(toDo);
		sqlSession.insert("TodoMapper.addTodoComplete", toDo);
	}
	
	@Override
	public void deleteToDoComplete(ToDo toDo) throws Exception {
		System.out.println("deleteToDoComplete 立辟");
		System.out.println(toDo);
		sqlSession.delete("TodoMapper.deleteTodoComplete", toDo);
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
