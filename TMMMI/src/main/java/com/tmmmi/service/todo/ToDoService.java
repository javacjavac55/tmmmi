package com.tmmmi.service.todo;

import java.util.Map;

import com.tmmmi.service.domain.ToDo;

public interface ToDoService {

	public Map<String, Object> getToDoList(int userNo) throws Exception;
	public void addToDo(ToDo toDo) throws Exception;
	public void deleteToDo(ToDo toDo) throws Exception;
	public void updateToDo(ToDo toDo) throws Exception;
	public void updateToDoComplete(ToDo toDo) throws Exception;
	public void getToDoDayGraph();
	public void getToDoMonthGraph();
	public void getToDoWordCloud();
}
