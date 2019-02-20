package com.tmmmi.common.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/*
 * FileName : LogonCheckInterceptor.java
 *  �� Controller ȣ���� interceptor �� ���� ��ó��/��ó��/�Ϸ�ó���� ����
 *  	- preHandle() : Controller ȣ���� ��ó��   
 * 			(true return ==> Controller ȣ�� / false return ==> Controller ��ȣ�� ) 
 *  	- postHandle() : Controller ȣ�� �� ��ó��
 *    	- afterCompletion() : view ������ ó��
 *    
 *    ==> �α����� ȸ���̸� Controller ȣ�� : true return
 *    ==> �� �α����� ȸ���̸� Controller �� ȣ�� : false return
 */
public class LogonCheckInterceptor extends HandlerInterceptorAdapter {

	///Field
	
	///Constructor
	public LogonCheckInterceptor(){
		System.out.println("\nCommon :: "+this.getClass()+"\n");		
	}
	
	///Method
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		System.out.println("\n[ LogonCheckInterceptor start........]");
		
		//==> �α��� ����Ȯ��
		HttpSession session = request.getSession(true);
		String userNo = String.valueOf(session.getAttribute("userNo"));
		System.out.println("userNo : "+userNo);

		if( session.getAttribute("userNo") != null )  {
			System.out.println("userNo ����");
			String uri = request.getRequestURI();
			
			if(		uri.indexOf("addUser") != -1 ||	uri.indexOf("login") != -1 		|| 
					uri.indexOf("checkDuplication") != -1 ){
				response.sendRedirect(request.getContextPath()+"../index.jsp");
				System.out.println("[ �α��� ����.. �α��� �� ���ʿ� �� �䱸.... ]");
				System.out.println("[ LogonCheckInterceptor end........]\n");
				return false;
			}
			
			System.out.println("[ �α��� ���� ... ]");
			System.out.println("[ LogonCheckInterceptor end........]\n");
			return true;
		}else{ //==> �� �α����� ȭ���̶��...
			System.out.println("userNo ����");
			String uri = request.getRequestURI();
			
			if(	uri.indexOf("addSNSUser") != -1 || uri.indexOf("addUser") != -1 ||	uri.indexOf("login") != -1 		|| 
					uri.indexOf("checkDuplication") != -1 ){
				System.out.println("[ �α� �õ� ���� .... ]");
				System.out.println("[ LogonCheckInterceptor end........]\n");
				return true;
			}
			
			response.sendRedirect(request.getContextPath()+"../index.jsp");
			System.out.println("[ �α��� ���� ... ]");
			System.out.println("[ LogonCheckInterceptor end........]\n");
			return false;
		}
	}
}//end of class