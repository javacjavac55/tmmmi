<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar navbar-fixed-top" style="  background-color:white;">

	<div class="container">
	       
	
		<a class="navbar-brand" href="/index.jsp" style="  color : black; ">TMI</a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div 	class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar �� �پ��ϰ� ����ϸ�.... -->
	             <ul class="nav navbar-nav">
	             
	           	<!-- ���� -->
	             <li class="dropdown">
	                   <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                        <span style="  color : black; ">�޷�</span>
	                        <span class="caret"></span>
	                    </a>
	                    <ul class="dropdown-menu">
	                        <li><a href="/common/color-picker.jsp"> �÷���Ŀ </a></li>         
	                        <li><a href="/calendar/addUserCategory.jsp">���� ī�װ�</a></li>    
							<li><a href="/calendar/getCalendarMonth">�� �޷�</a></li>    
							<li><a href="/calendar/getCalendarInterest">���ɻ� �޷�</a></li>    
	                     </ul>
	                </li>
	                 
	              <!-- ���� -->	         
		          <li class="dropdown">
	                   <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                        <span style="  color : black; ">ȸ��</span>
	                        <span class="caret"></span>
	                    </a>
	                    <ul class="dropdown-menu">
	                        <li><a href="/user/addUser.jsp">ȸ������</a></li>         
	                        <li><a href="/user/login.jsp">�α���</a></li>    
							<li><a href="/user/getUserList">ȸ�� ����Ʈ</a></li>    
							<li><a href="/user/searchUserId.jsp">���̵� ã��</a></li>    
	                     </ul>
	                </li>
	                 
	                 
	             <!-- �߿� -->
	             <li class="dropdown">
	                   <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                        <span style="  color : black; ">���̾</span>
	                        <span class="caret"></span>
	                    </a>
	                    <ul class="dropdown-menu">
	                        <li><a href="/diary/addDiary">���̾ ���</a></li>         
	                        <li><a href="/diary/listDiary">���̾ ����Ʈ</a></li>    
							<li><a href="/content/sportContent.jsp">������ ����Ʈ</a></li>    
	                     </ul>
	               </li>
	      
	             <!-- ���� -->
	             <li class="dropdown">
	                   <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                        <span style="  color : black; ">����</span>
	                        <span class="caret"></span>
	                    </a>
	                    <ul class="dropdown-menu">
	                        <li><a href="/todo/getToDoList">�� �� ����Ʈ</a></li>         
	                        <li><a href="/content/tastyContent.jsp">�����������ڽ�</a></li>    
	                     </ul>
	               </li>
	               
	             <!-- ���� -->
	             <li class="dropdown">
	                   <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                        <span style="  color : black; ">FAQ</span>
	                        <span class="caret"></span>
	                    </a>
	                    <ul class="dropdown-menu">
	                        <li><a href="/faq/getFAQList">FAQ ����Ʈ</a></li>         
	                        <li><a href="/qna/getQNAList">QNA ����Ʈ</a></li>  
	                        <li><a href="/widget/getWeather3.jsp">���� </a></li>  
	 
	                     </ul>
	               </li>
	            
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>
