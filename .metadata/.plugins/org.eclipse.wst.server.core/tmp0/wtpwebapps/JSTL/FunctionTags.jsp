<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Function Tags</title>
</head>
<body>
	<h1> This is Function Tags </h1>
	<c:set var="name" value="TECHSOFT INDIA"></c:set>
	<c:out value="${name }"></c:out>
	
	<h2>Length of name is : <c:out value="${fn:length(name)}"></c:out></h2>
	<c:out value="${fn:toLowerCase(name)}"></c:out>
	<br>
	<c:out value="${fn:toUpperCase(name)}"></c:out>
	<br>
	<c:out value="${fn:contains(name, 'INDIA')}"></c:out>
</body>
</html>