package com.tmmmi.service.todo.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tmmmi.service.domain.ToDo;
import com.tmmmi.service.todo.ToDoDao;
import com.tmmmi.service.todo.ToDoService;

@Service("toDoServiceImpl")
public class ToDoServiceImpl implements ToDoService {
	
	///Field
	@Autowired
	@Qualifier("toDoDaoImpl")
	private ToDoDao toDoDao;
	 public void setToDoDao(ToDoDao toDoDao) {
		 this.toDoDao = toDoDao;
	 }
	
	public ToDoServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public List<ToDo> getToDoList(Map<String, Object> todomap) throws Exception{
		
		List<ToDo> toDoList = toDoDao.getToDoList(todomap);
		
		return toDoList;
	}

	@Override
	public void addToDo(ToDo toDo) throws Exception {
		toDoDao.addToDo(toDo);
	}

	@Override
	public void deleteToDo(ToDo toDo)throws Exception {
		toDoDao.deleteToDo(toDo);
	}

	@Override
	public void updateToDo(ToDo toDo) throws Exception {
		toDoDao.updateToDo(toDo);
		
	}

	@Override
	public void updateToDoComplete(ToDo toDo) throws Exception{
		toDoDao.updateToDoComplete(toDo);
	}
	
	@Override
	public void deleteToDoComplete(ToDo toDo) throws Exception {
		toDoDao.deleteToDoComplete(toDo);
	}
	@Override
	public ToDo getToDo(ToDo toDo) throws Exception {
		return toDoDao.getToDo(toDo);
	}
	@Override
	public ToDo getToDoOne(ToDo toDo) throws Exception{
		return toDoDao.getToDoOne(toDo);
	}
	@Override
	public void getToDoDayGraph(Map<String, Object> todomap) throws Exception {
		
	}

	@Override
	public List<ToDo> getToDoMonthGraph(Map<String, Object> todomap) throws Exception {
		System.out.println("getToDoMonthGraphServiceImpl Á¢±Ù");
		List<ToDo> todoMonth = toDoDao.getMonthGraph(todomap);
		System.out.println(todoMonth);
		return todoMonth;
	}

	@Override
	public List<ToDo> getToDoWordCloud(Map<String, Object> todomap) throws Exception {
		System.out.println("getToDoWordCloudDao");
		List<ToDo>todoWordCloud = toDoDao.getWordCloud(todomap);
		return todoWordCloud;
	}
}
