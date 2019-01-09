package com.tmmmi.service.todo;

public interface ToDoService {

	public void getToDoList();
	public void addToDo();
	public void deleteToDo();
	public void updateToDo();
	public void updateToDoCheck();
	public void getToDoDayGraph();
	public void getToDoMonthGraph();
	public void getToDoWordCloud();
}
