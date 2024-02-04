<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Sorry! Something went wrong</title>
		<link rel="stylesheet" href="CSS/style.css" type="text/css" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<style>
			.banner-background {
				clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
			}
		</style>
	</head>
	
	<body>
		<div class="container text-center">
			<img src="images/computer.png" class="img-fluid mt-5" style="height: 300px; width: 300px;">
			<h3 class="dispaly-3">Sorry! Something went wrong........</h3>
			<%= exception %>
			<a href="index.jsp" class="btn primary-background btn-lg text-white mt-3"> Home </a>
		</div>
	</body>
</html>