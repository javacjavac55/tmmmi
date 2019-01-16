package com.tmmmi.service.todo;

import java.util.List;

import com.tmmmi.service.domain.ToDo;

public interface ToDoDao {

	public List<ToDo> getToDoList(int userNo) throws Exception;
	public void addToDo(ToDo toDo) throws Exception;
	public void deleteToDo(ToDo toDo) throws Exception;
	public void updateToDo(ToDo toDo) throws Exception;
	public void updateToDoComplete(ToDo toDo) throws Exception;
	public void getDayGraph();
	public void getMonthGraph();
	public void getWordCloud();
}
