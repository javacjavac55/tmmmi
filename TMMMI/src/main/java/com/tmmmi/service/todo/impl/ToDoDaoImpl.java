package com.tmmmi.service.todo.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tmmmi.service.domain.ToDo;
import com.tmmmi.service.todo.ToDoDao;

@Repository("toDoDaoImpl")
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
		System.out.println("getToDoList Dao����");
		return sqlSession.selectList("TodoMapper.getTodoList", todomap);
	}

	@Override
	public void addToDo(ToDo toDo) throws Exception{
		System.out.println("addToDoDao ����");
		System.out.println(toDo);
		sqlSession.insert("TodoMapper.addTodo", toDo);
	}

	@Override
	public void deleteToDo(ToDo toDo) throws Exception{
		System.out.println("deleteToDoDao ����");
		System.out.println(toDo);
		sqlSession.delete("TodoMapper.deleteTodo", toDo);
	}

	@Override
	public void updateToDo(ToDo toDo) throws Exception {
		System.out.println("updateToDoDao ����");
		System.out.println(toDo);
		sqlSession.update("TodoMapper.updateTodo",toDo);
	}

	@Override
	public void updateToDoComplete(ToDo toDo) throws Exception {
		System.out.println("updateToDoCompleteDao ����");
		System.out.println(toDo);
		sqlSession.insert("TodoMapper.addTodoComplete", toDo);
	}
	
	@Override
	public void deleteToDoComplete(ToDo toDo) throws Exception {
		System.out.println("deleteToDoComplete ����");
		System.out.println(toDo);
		sqlSession.delete("TodoMapper.deleteTodoComplete", toDo);
	}
	
	@Override
	public ToDo getToDo(ToDo toDo) throws Exception {
		System.out.println(this.getClass()+"����");
		System.out.println("getToDo : "+toDo);
		
		return sqlSession.selectOne("TodoMapper.getTodo", toDo);
	}
	
	@Override
	public ToDo getToDoOne(ToDo toDo) throws Exception{
		return sqlSession.selectOne("TodoMapper.getTodoOne", toDo);
	}

	@Override
	public List<ToDo> getMonthGraph(Map<String, Object> todomap) throws Exception {
		System.out.println("getMonthGraphDao ����");
		System.out.println(todomap);
		System.out.println(sqlSession.selectList("TodoMapper.getMonthList", todomap));
		return sqlSession.selectList("TodoMapper.getMonthList", todomap);
	}
}
