package com.tmmmi.service.todo;

import java.util.Map;

import com.tmmmi.service.domain.ToDo;

public interface ToDoDao {

	public Map<String, Object> getToDoList(Map<String, Object> todomap) throws Exception;
	public void addToDo(ToDo toDo) throws Exception;
	public void deleteToDo(ToDo toDo) throws Exception;
	public void updateToDo(ToDo toDo) throws Exception;
	public void updateToDoComplete(ToDo toDo) throws Exception;
	public void deleteToDoComplete(ToDo toDo) throws Exception;
	public void getDayGraph();
	public void getMonthGraph();
	public void getWordCloud();
}
