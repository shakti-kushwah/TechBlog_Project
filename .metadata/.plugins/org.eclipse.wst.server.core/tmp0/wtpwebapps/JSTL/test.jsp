<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Test Page</title>
	</head>
	<body>
		<h1> This is Test Page of Tags Page </h1>
		<c:out value="${bookname}"></c:out>
	</body>
</html>