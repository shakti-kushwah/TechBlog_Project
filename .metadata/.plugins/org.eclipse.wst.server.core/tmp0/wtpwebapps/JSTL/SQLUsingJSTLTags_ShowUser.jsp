<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Access Datatbase using Tags</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	</head>
	<body>
		<h1> All User are :  </h1>
		<sql:setDataSource driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/JSTLTags;" user="root" password="shakti7723" var="datasrc"/>
		<sql:query dataSource="${datasrc}" var="resultSet"> SELECT * FROM userInfo; </sql:query>
		<div class="container">
			<table class="table">
				<tr>
					<td> User ID </td>
					<td> User Name </td>
					<td> User Email </td>
				</tr>
				
				<c:forEach items="${resultSet.rows}" var="row"></c:forEach>
				<tr>
					<td> <c:out value="row.id"></c:out></td>
					<td> <c:out value="row.name"></c:out></td>
					<td> <c:out value="row.email"></c:out></td>
				</tr>
			</table>
		</div>		
	</body>
</html>