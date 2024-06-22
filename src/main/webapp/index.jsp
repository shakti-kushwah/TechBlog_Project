<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>TechBlog</title>
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
		<!--   Navbar    -->
		<%@ include file="Navbar.jsp" %>
		
		<!--   banner    -->
		<div class="container-fluid p-0 m-0">
			<div class="jumbotron primary-background text-white banner-background">
				<div class="container">
					<h3 class="display-3"> Welcome to TechBlog</h3>
					<h3> Tech Blog </h3>
					<p>
						Welcome to technical blog, world of technology A computer is a device that accepts information (in the form of digitalized data) and manipulates 
			            it for some result based on a program, software, or sequence of instructions on how the data 
			            is to be processed.
			        </p>
			        
			        <p>
			        	Complex computers include the means for storing data (including the program, 
			            which is also a form of data) for some necessary duration. A program may be invariable
			            and built into the computer hardware. Today's computers have both kinds of programming.
			        </p>
			        
			        <button class="btn btn-outline-light btn-lg"> <span class="fa fa-user-plus"></span> Start! Its Free</button>
			        <a href="Login.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle fa-spin"></span> Login</a>
				</div>
			</div>
		</div>
		
		<!--    Cards    -->
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="card"">
				        <div class="card-body">
				            <h5 class="card-title">Java Programming Language</h5>
				            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's
				                content.</p>
				            <a href="#" class="btn primary-background text-white">Read More</a>
				        </div>
    				</div>
				</div>
				
				<div class="col-md-4">
					<div class="card">
				        <div class="card-body">
				            <h5 class="card-title">Java Programming Language</h5>
				            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's
				                content.</p>
				            <a href="#" class="btn primary-background text-white">Read More</a>
				        </div>
    				</div>
				</div>
				
				<div class="col-md-4">
					<div class="card"">
				        <div class="card-body">
				            <h5 class="card-title">Java Programming Language</h5>
				            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's
				                content.</p>
				            <a href="#" class="btn primary-background text-white">Read More</a>
				        </div>
    				</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-4">
					<div class="card"">
				        <div class="card-body">
				            <h5 class="card-title">Java Programming Language</h5>
				            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's
				                content.</p>
				            <a href="#" class="btn primary-background text-white">Read More</a>
				        </div>
    				</div>
				</div>
				
				<div class="col-md-4">
					<div class="card"">
				        <div class="card-body">
				            <h5 class="card-title">Java Programming Language</h5>
				            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				            <a href="#" class="btn primary-background text-white">Read More</a>
				        </div>
    				</div>
				</div>
				
				<div class="col-md-4">
					<div class="card"">
				        <div class="card-body">
				            <h5 class="card-title">Java Programming Language</h5>
				            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				            <a href="#" class="btn primary-background text-white">Read More</a>
				        </div>
    				</div>
				</div>
			</div>
		</div>

		
		<script src="Javascript/script.js" type="text/javascript"></script>
		<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	</body>
</html>