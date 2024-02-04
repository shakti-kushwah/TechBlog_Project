<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Register Page</title>
		<link rel="stylesheet" href="CSS/style.css" type="text/css" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
	
	<body class="primary-background">
		<!--   Navbar  -->
		<%@ include file="Navbar.jsp" %>
		
		<main class="d-flex align-items-center" style="height:120vh">
			<div class="container">
				<div class="row">
					<div class="col-md-6 offset-md-3">
						<div class="card">
							<div class="card-header primary-background text-white text-center">
								<span class="fa fa-user-circle fa-3x"></span>
								<p>Register here</p>
							</div>
							
							<div class="card-body">
								<form id="register-form" action="RegisterServlet" method="POST">
									<div class="form-group">
										 <label for="user_name">User Name</label>
										 <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name">
									 </div>
									 <div class="form-group">
										 <label for="exampleInputEmail1">Email address</label>
										 <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
										 <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
									 </div>
									 <div class="form-group">
									     <label for="exampleInputPassword1">Password</label>
									     <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
									 </div>
									 
									 <div class="form-check">
									     <label class="gender mr-3" for="gender">Select Gender</label>
									     <input type="radio" id="gender" name="gender" value="male"> Male
									     <input type="radio" id="gender" name="gender" value="female"> Female									     
									 </div>
									 
									 <div class="form-group">
									 	<textarea name="about" class="form-control" id="" rows="3" placeholder="Enter Something about yourself"></textarea>
									 </div>
									 
									 <div class="form-check">
									     <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
									     <label class="form-check-label" for="exampleCheck1">agree terms and conditions</label>
									 </div>
									 <br>
									 <div class="container text-center" id="loader" style="display: none;">
									 	<span class="fa fa-refresh fa-spin fa-4x"></span>
									 	<h4>Please Wait......</h4>
									 </div>
									 <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	
	
		<!--   JavaScripts  -->
		<script src="Javascript/script.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	    
        <script>
            $(document).ready(function () {
                console.log("loaded........")

                // Using jQuery
                $('#register-form').on('submit', function (event) {
                	
                	// It will not go to servlet using preventDefault() 
                    event.preventDefault();

                    let form = new FormData(this);

                    $("#submit-btn").hide();
                    $("#loader").show();
                    
                    //send register servlet:
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)

                            $("#submit-btn").show();
                            $("#loader").hide();

                            if (data.trim() === 'done') {

                                swal("Registered successfully..We are going to redirect to login page")
                                        .then((value) => {
                                            window.location = "Login.jsp"
                                        });
                            } else {
                                swal(data);
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#submit-btn").show();
                            $("#loader").hide();
                            swal("something went wrong..try again");

                        },
                        processData: false,
                        contentType: false

                    });
                });
            });
        </script>
	</body>
</html>