package com.tmmmi.service.todo;

public interface ToDoDao {

	public void getToDoList();
	public void addToDo();
	public void deleteToDo();
	public void updateToDo();
	public void updateToDoCheck();
	public void getDayGraph();
	public void getMonthGraph();
	public void getWordCloud();
}
