package com.tmmmi.web;

import java.text.SimpleDateFormat;
import java.time.Year;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.service.domain.ToDo;
import com.tmmmi.service.todo.ToDoService;
import com.tmmmi.service.user.UserService;

@Controller
@RequestMapping("/todo/*")
public class ToDoController {
	
	///Field
	@Autowired
	@Qualifier("toDoServiceImpl")
	private ToDoService toDoService;
	
	@Qualifier("UserServiceImpl")
	private UserService userService;
	
	///Constructor
	public ToDoController() {
	}
	
	///Method
	@RequestMapping(value="/addToDo", method=RequestMethod.POST)
	public ModelAndView addToDo(@ModelAttribute("todo") ToDo toDo, HttpSession session) throws Exception{
		System.out.println("/addToDo ����");
		System.out.println(toDo);
		int userNo = (int)session.getAttribute("userNo");
		toDo.setUserNo(userNo);
		toDoService.addToDo(toDo);
		System.out.println("/addToDo �Ϸ�");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/todo/getToDoList");
		return modelAndView;
	}
	@RequestMapping(value="/updateToDo", method=RequestMethod.POST)
	public ModelAndView updateToDo(@ModelAttribute("todo") ToDo toDo, HttpSession session) throws Exception{
		System.out.println("/updateToDo ����");
		System.out.println(toDo);
		int userNo = (int)session.getAttribute("userNo");
		toDo.setUserNo(userNo);
		toDoService.updateToDo(toDo);
		System.out.println("/updateToDo �Ϸ�");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/todo/getToDoList");
		return modelAndView;
	}
	@RequestMapping(value="/getToDoList", method=RequestMethod.GET)
	public ModelAndView getToDoList(HttpSession session) throws Exception{
		System.out.println("/getToDoListGET ����");
		int userNo = (int)session.getAttribute("userNo");
		
		//���� ��¥ ���
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd");
		String mTime = mSimpleDateFormat.format( new Date());
		java.sql.Date targetDate = java.sql.Date.valueOf(mTime);
		System.out.println ("targetDate : "+targetDate);
		
		Map<String, Object> todomap = new HashMap<String, Object>();
		todomap.put("userNo", userNo);
		todomap.put("targetDate", targetDate);
		System.out.println(todomap);
	
		//Business Logic
		List<ToDo> todolist = toDoService.getToDoList(todomap);
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("todolist"+todolist);
		modelAndView.setViewName("/todo/listToDo.jsp");
		modelAndView.addObject("todolist",todolist);
		modelAndView.addObject("targetDate",targetDate);
		System.out.println(modelAndView);
		return modelAndView;
		}
		
	@RequestMapping(value="/getToDoList", method=RequestMethod.POST)
	public ModelAndView getToDoList(@RequestBody String dayinput, HttpSession session) throws Exception{
		System.out.println("/getToDoListPOST ����");
		System.out.println(dayinput.split("=")[1]);
		int userNo = (int)session.getAttribute("userNo");
		
		java.sql.Date targetDate1 = java.sql.Date.valueOf(dayinput.split("=")[1]);
		System.out.println ("targetDate : "+targetDate1);
		
		Map<String, Object> todomap = new HashMap<String, Object>();
		todomap.put("userNo", userNo);
		todomap.put("targetDate", targetDate1);
		
		//Business Logic
		List<ToDo> todolist = toDoService.getToDoList(todomap);
		/*List<ToDo>nextlist=toDoService.getToDoList(nextToDoMap);*/
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("todolist"+todolist);
		SimpleDateFormat mSimpleDateFormat2 = new SimpleDateFormat ( "yyyy-MM-dd");
		Date tDate = mSimpleDateFormat2.parse(dayinput.split("=")[1]);
		System.out.println(tDate);
		
		modelAndView.setViewName("/todo/listToDo.jsp");
		modelAndView.addObject("targetDate", targetDate1);
		modelAndView.addObject("todolist",todolist);
		modelAndView.addObject("displaydate", tDate);
		System.out.println(modelAndView);
		return modelAndView;
		}
	
	public void getToDoDayGraph() {}
	
	@RequestMapping(value="/getToDoMonthGraph", method=RequestMethod.GET)
	public ModelAndView getToDoMonthGraph(HttpSession session) throws Exception {
		System.out.println("/getToDoMonthGraph ����");
		int userNo = (int)session.getAttribute("userNo");
		
		//���� ��¥ ���
		int year = Year.now().getValue();
		String transYear = Integer.toString(year);
		String startDate = transYear+"-01-01";
		String lastDate= transYear+"-12-31";
		java.sql.Date startDate1 = java.sql.Date.valueOf(startDate);
		java.sql.Date lastDate1 = java.sql.Date.valueOf(lastDate);
		
		Map<String, Object> todomap = new HashMap<String, Object>();
		todomap.put("userNo", userNo);
		todomap.put("startDate", startDate1);
		todomap.put("lastDate", lastDate1);
		System.out.println(todomap);
		
		//Business Logic
		List<ToDo> todoMonth = toDoService.getToDoMonthGraph(todomap);
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("todoMonth"+todoMonth);
		modelAndView.setViewName("/todo/getToDoMonthGraph.jsp");
		modelAndView.addObject("todoMonth",todoMonth);
		return modelAndView;
	}
	@RequestMapping(value="/getToDoWordCloud", method=RequestMethod.GET)
	public ModelAndView getToDoWordCloud(HttpSession session) throws Exception {
	
	int userNo = (int)session.getAttribute("userNo");
	int wordCount = 0;
	//���� �⵵ ���
	int year = Year.now().getValue();
	String transYear = Integer.toString(year);
	String startDate = transYear+"-01-01";
	String lastDate= transYear+"-12-31";
	java.sql.Date startDate1 = java.sql.Date.valueOf(startDate);
	java.sql.Date lastDate1 = java.sql.Date.valueOf(lastDate);
	
	Map<String, Object> todomap = new HashMap<String, Object>();
	todomap.put("userNo", userNo);
	todomap.put("startDate", startDate1);
	todomap.put("lastDate", lastDate1);
	System.out.println("todomap:"+todomap);
	
	//Business Logic
	List<ToDo> getWordList = toDoService.getToDoWordCloud(todomap);
	List<Words> wordList = new ArrayList<Words>();
	for (int i = 0; i < getWordList.size(); i++) {
		/*StringTokenizer st = new StringTokenizer(getWordList.get(i).getToDoDetail());
		while(st.hasMoreTokens()) { 
			//while������ �ܾ� ������ŭ �����°Ŵ�. �� ��쿡�� 4���� ��. (for���� ����ص� ��ŷ)
			String token = st.nextToken(); //��ū�� �ϳ��� �������� ��
			System.out.println(token); //������ ��ū ���
			wordCount = st.countTokens();
	        System.out.println("�ܾ��� ����: " + wordCount);
		}*/
	Words words = new Words();
	words.setText(getWordList.get(i).getToDoDetail());
	words.setWeight(wordCount);
	wordList.add(words);
	}
	System.out.println(wordList);
	ModelAndView modelAndView = new ModelAndView();
	modelAndView.setViewName("/todo/getToDoWordCloud.jsp");
	modelAndView.addObject("wordList", wordList);
	return modelAndView;
	}
	
}

class Words {
	///Field
	private String text;
	private int weight;
	///Constructor
	public Words() {
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	@Override
	public String toString() {
		return "{text:'" + text + "', weight:" + weight + "}";
	}
	
}
