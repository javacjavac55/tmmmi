package com.tmmmi.service.todo;

import com.tmmmi.service.domain.ToDo;

public interface ToDoDao {

	public void getToDoList();
	public void addToDo(ToDo toDo) throws Exception;
	public void deleteToDo();
	public void updateToDo(ToDo toDo) throws Exception;
	public void updateToDoCheck();
	public void getDayGraph();
	public void getMonthGraph();
	public void getWordCloud();
}
