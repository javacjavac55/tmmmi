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
	         
	         	<!-- Tool Bar 를 다양하게 사용하면.... -->
	             <ul class="nav navbar-nav">
	             
	           	<!-- 도형 -->
	             <li class="dropdown">
	                   <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                        <span style="  color : black; ">달력</span>
	                        <span class="caret"></span>
	                    </a>
	                    <ul class="dropdown-menu">
	                        <li><a href="/common/color-picker.jsp"> 컬러픽커 </a></li>         
	                        <li><a href="/calendar/addUserCategory.jsp">유저 카테고리</a></li>    
							<li><a href="/calendar/getCalendarMonth">월 달력</a></li>    
							<li><a href="/calendar/getCalendarInterest">관심사 달력</a></li>    
	                     </ul>
	                </li>
	                 
	              <!-- 지영 -->	         
		          <li class="dropdown">
	                   <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                        <span style="  color : black; ">회원</span>
	                        <span class="caret"></span>
	                    </a>
	                    <ul class="dropdown-menu">
	                        <li><a href="/user/addUser.jsp">회원가입</a></li>         
	                        <li><a href="/user/login.jsp">로그인</a></li>    
							<li><a href="/user/getUserList">회원 리스트</a></li>    
							<li><a href="/user/searchUserId.jsp">아이디 찾기</a></li>    
	                     </ul>
	                </li>
	                 
	                 
	             <!-- 중열 -->
	             <li class="dropdown">
	                   <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                        <span style="  color : black; ">다이어리</span>
	                        <span class="caret"></span>
	                    </a>
	                    <ul class="dropdown-menu">
	                        <li><a href="/diary/addDiary.jsp">다이어리 등록</a></li>         
	                        <li><a href="/diary/listDiary">다이어리 리스트</a></li>    
							<li><a href="/content/sportContent">스포츠 리스트</a></li>    
	                     </ul>
	               </li>
	      
	             <!-- 명훈 -->
	             <li class="dropdown">
	                   <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                        <span style="  color : black; ">할일</span>
	                        <span class="caret"></span>
	                    </a>
	                    <ul class="dropdown-menu">
	                        <li><a href="/todo/getToDoList">할 일 리스트</a></li>         
	                        <li><a href="/content/tastyContent.jsp">맛집컨텐츠박스</a></li>    
	                     </ul>
	               </li>
	               
	             <!-- 지슬 -->
	             <li class="dropdown">
	                   <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                        <span style="  color : black; ">FAQ</span>
	                        <span class="caret"></span>
	                    </a>
	                    <ul class="dropdown-menu">
	                        <li><a href="/faq/getFAQList">FAQ 리스트</a></li>         
	                        <li><a href="/qna/getQNAList">QNA 리스트</a></li>  
	                        <li><a href="/widget/getWeather3.jsp">날씨 </a></li>  
	 
	                     </ul>
	               </li>
	            
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>
