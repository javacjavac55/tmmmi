package com.tmmmi.service.todo.test;

import java.sql.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tmmmi.service.domain.ToDo;
import com.tmmmi.service.todo.ToDoService;
import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml",
																			"classpath:config/context-aspect.xml",
																			"classpath:config/context-mybatis.xml",
																			"classpath:config/context-transaction.xml"})
public class TodoServiceTset {
	
	@Autowired
	@Qualifier("ToDoServiceImpl") 
	private ToDoService toDoService;
	
	public TodoServiceTset() {
		}
	@Test
	public void testUpdateTodo() throws Exception{
		
		Date start1 = Date.valueOf("2019-01-03");
		Date End1=Date.valueOf("2019-01-09");
		ToDo todo = new ToDo();
		todo.setToDoDetail("¾ÆÄ§¹ä ¼öÁ¤");
		todo.setToDoStartDate(start1);
		todo.setToDoEndDate(End1);
		todo.setToDoNo(1);
		todo.setUserNo(7);
		
		toDoService.updateToDo(todo);
		
		Assert.assertEquals("¾ÆÄ§¹ä ¼öÁ¤", todo.getToDoDetail());
	}

}
