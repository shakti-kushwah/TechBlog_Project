<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Tags</title>
</head>
<body>
	<h1> This is JSTL Tags </h1>
	
	<!--   Set and Out Tag   -->
	<c:set var="bookname" value="Java" scope="application"></c:set> 
	<c:out value="${bookname}"></c:out> 
	<br> 
	<c:set var="i" value="2003" scope="application"></c:set> 
	<c:out value="${i}"></c:out>  
	<br>
	
	
	<!--   Remove Tag   -->
	<c:remove var="bookname"/>
	<c:out value="${bookname}">book name is removed!</c:out>   
	<hr>
	
	
	<!--   if Tag   -->
	<c:if test="${i == 2003}">
		<h2> Yes! i is equal to 2003 and condition true </h2>
	</c:if>
	
	<c:if test="${i < 2003}">
		<h2> No! i is not less then 2003 and condition false </h2>
	</c:if>
	<hr>
	
	
	<!--    Switch Tag    -->
	<c:choose>
		<c:when test="${i > 0}">
			<h2> This is first case </h2>
			<h3> i is greater than zero </h3>
		</c:when>
		<c:when test="${i < 0}">
			<h2> This is second case </h2>
			<h3> i is less than zero </h3>
		</c:when>
		<c:otherwise>
			<h1> Default Case....    otherwise </h1>
			<h1> Number is Zero </h1>
		</c:otherwise>
	</c:choose>
	<hr>
	
	
	<!--   ForEach Tag - for repeating and traversing   -->
	<c:forEach var="j" begin="1" end="10">
		<h3> Value of j is <c:out value="${j}"></c:out></h3>
	</c:forEach>
	
	
	
	<!--    Re-Direct Tag : automatic open another page  -->
	<!--   <c:redirect url="https://www.google.com"></c:redirect>     -->
	
	
	<c:url var="myURL" value="https://www.google.com/search">
		<c:param name="q" value="onlyjavatech"></c:param>
	</c:url>
	<c:out value="${myURL}"></c:out>
	<c:redirect url="${myURL}"></c:redirect>
	
	
	
</body>
</html>