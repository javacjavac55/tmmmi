<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<!-- CSS Files -->
<<<<<<< HEAD
    <link href="/css/template/material-kit.css" rel="stylesheet" />
</head>
=======
    <link href="/css/template/material-kit.css" rel="stylesheet" />
    <link href="/css/template/demo.css" rel="stylesheet" />

>>>>>>> refs/remotes/origin/master
 
<div class="container text-center">
		 
		<nav>
		  <ul class="pagination" style="margin-left:35%">
		  
		  	<!--  <<== 좌측 nav -->
		  	<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
		   	 	<li class="page-item disabled">
		    </c:if>
		    <c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
		    	<li class="page-item">
		    </c:if>
		      <a class="page-link" href="javascript:fncGetList('${ resultPage.currentPage-1}')"  tabindex="-1">Previous</a>
		    </li>
		    
		    <!--  가운데 -->
		    <c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
		    
				<c:if test="${ resultPage.currentPage == i }">
				    <li class="page-item active" style="margin-left;:8px;">
				      <a class="page-link" href="javascript:fncGetList('${ i }');"> ${ i }<span class="sr-only">(current)</span></a>
				    </li>
			    </c:if>
			    
			    <c:if test="${ resultPage.currentPage != i}">	
			    	<li class="page-item" style="margin-left:12px; margin-right:10px; margin-top:2px">
				    	<a href="javascript:fncGetList('${ i }');">${ i }</a>
					</li>
				</c:if>
			</c:forEach> 
		    
		   	<!-- 오른쪽 -->
		   	<c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
		    	<li class="page-item disabled">
		    </c:if>
			<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
				<li class="page-item">
			</c:if>
		      <a class="page-link" href="javascript:fncGetList('${resultPage.endUnitPage+1}')">Next</a>
		    </li>
		  </ul>
		</nav>
</div>
 
