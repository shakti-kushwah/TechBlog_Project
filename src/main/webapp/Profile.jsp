<%@ page import="com.tech.blog.Entities.*" %>
<%@ page errorPage="Error_Page.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tech.blog.dataAccessObjects.*" %>
<%@ page import="com.tech.blog.helper.*" %>

<%
	User user = (User)session.getAttribute("currentUser");
	if(user == null) {
		response.sendRedirect("Login.jsp");
	}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Profile Page</title>
		<link rel="stylesheet" href="CSS/style.css" type="text/css" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<style>
			.banner-background {
				clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
			}
			
			body {
				background : url("images/backgroundimg.jpg");
				background-size : cover;
				background-attechment : fixed;
			}
		</style>
	</head>
	
	<body>
		<!-- Navbar -->
	    <nav class="navbar navbar-expand-lg navbar-dark primary-background">
	        <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk"></span> TechBlog </a>
	        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
	            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	            <span class="navbar-toggler-icon"></span>
	        </button>
	
	        <div class="collapse navbar-collapse" id="navbarSupportedContent">
	            <ul class="navbar-nav mr-auto">
	                <li class="nav-item active">
	                    <a class="nav-link" href="#"> <span class="fa fa-bell-o"></span>Learn Code <span class="sr-only">(current)</span></a>
	                </li>
	
	                <li class="nav-item dropdown">
        				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                        <span class="fa fa-check-square-o"></span>
	                        Categories
	                    </a>
	
	                    <div class="dropdown-menu">
	                        <a class="dropdown-item" href="#">Programming Language</a>
	                        <a class="dropdown-item" href="#">Project Implementation</a>
	                        <div class="dropdown-divider"></div>
	                        <a class="dropdown-item" href="#">Data Structure</a>
	                    </div>
	                </li>
	                
	                <li class="nav-item">
	                    <a class="nav-link" href="#"> <span class="fa fa-address-card-o"></span>Contact us</a>
	                </li>
	                
	                <li class="nav-item">
	                    <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"> <span class="fa fa-asterisk"></span>Do Post</a>
	                </li>
	            </ul>
	
	            <ul class="navbar-nav mr-right">
	    			<li class="nav-item">
	             		<a class="nav-link" href="#!" data-toggle="modal" data-target="#profileModal"> <span class="fa fa-user-circle"></span><%= user.getName() %></a>
	        		</li>
	    			<li class="nav-item">
	        	 		<a class="nav-link" href="LogoutServlet"> <span class="fa fa-user-plus"></span> Logout </a>
	        		</li>
	    		</ul>
	        </div>
	    </nav>
	    
	    <%
			Message m = (Message) session.getAttribute("msg");
			if (m != null) {
		%>
									
		<div class="alert <%= m.getCssClass() %>" role="alert">
		<%= m.getContent() %>		
		</div>
									
		<%
			session.removeAttribute("msg");		
			}
		%>
	    
	    
	    
	    <!--   main body of the page   -->
	    <main>
		    <div class="container">
		    	<div class="row mt-4">
		    	
		    	 	<!-- first  column -->
		    	 	<div class="col-md-4">
		    	 	
		    	 		<!--  Categories  -->
		    	 		<div class="list-group">
						  	<a href="#" onclick="getPosts(0)" class="c-link list-group-item list-group-item-action active" aria-current="true">
						    	All Posts
						  	</a>
						  	
						  	<!--   Categories   -->
						  	<%
						  		PostDAO dao = new PostDAO(ConnectionProvider.getConnection());
						  		ArrayList<Category> lists = dao.getAllCategories();
						  		for(Category cc : lists){
						  	%>
						  		<a href="#" onclick="getPosts(<%= cc.getCatID() %>, this)" class="c-link list-group-item list-group-item-action"><%= cc.getName() %></a>
						  	<%
						  		}
						  	%>
						</div>
		    	 	</div>
		    	 	
		    	 	<!--  second column  -->
		    	 	<div class="col-md-8">
		    	 		<!-- Posts -->
		    	 		<div class="container text-center" id="loader">
		    	 			<i class="fa fa-refresh fa-4x fa-spin"></i>
		    	 			<h3 class="mt-2">Loading.....</h3>
		    	 		</div>
		    	 		
		    	 		<div class="container-fluid" id="post-container">

                        </div>
		    	 	</div>
		    	</div>
		    </div>
	    </main>
	    
	    
	
		<!--    Modal    -->
		<div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  	<div class="modal-dialog" role="document">
		    	<div class="modal-content">
		      		<div class="modal-header primary-background text-white text-center">
		        		<h5 class="modal-title" id="exampleModalLabel"> TechBlog </h5>
		        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          			<span aria-hidden="true">&times;</span>
		        		</button>
		      		</div>
		      		<div class="modal-body">
		      			<div class="container text-center">
		      				<img src="Profile_Pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%;max-width: 150px;" >
		      				<br>
		      				<h5 class="modal-title" id="exampleModalLabel"> <%= user.getName() %> </h5>
		      				
		      				
		      				<!--   profile - Details   -->
		      				<div id="profile-details">
		      					<table class="table">
									  <tbody>
										   <tr>
												<th scope="row">ID : </th>
												<td> <%= user.getId() %> </td>
										    </tr>
										    <tr>
											      <th scope="row"> Email : </th>
											      <td> <%= user.getEmail() %> </td>
										    </tr>
										    <tr>
											      <th scope="row"> Gender : </th>
											      <td> <%= user.getGender() %> </td>
										    </tr>
										    <tr>
											      <th scope="row"> Status : </th>
											      <td> <%= user.getAbout() %> </td>
										    </tr>
										    <tr>
											      <th scope="row"> Registered Date : </th>
											      <td> <%= user.getDateTime().toString() %> </td>
										    </tr>
									  </tbody>
								</table>
		      				</div>
		      				
		      				
		      				<!--    profile- edit  -->
		      				<div id="profile-edit" style="display: none">
		      					<h1 class="mt-2">Please Edit Carefully</h1>
		      					
		      					<form action="Edit_Servlet" method="POST" enctype="multipart/form-data">
		      						<table class="table">
		      							<tr>
		      								<td> ID </td>
		      								<td> <%= user.getId() %> </td>
		      							</tr>
		      							<tr>
		      								<td> Name </td>
		      								<td> <input class="form-control" type="text" name="user_name" value="<%= user.getName() %>"> </td>
		      							</tr>
		      							<tr>
		      								<td> Email </td>
		      								<td> <input class="form-control" type="email" name="user_email" value="<%= user.getEmail() %>"> </td>
		      							</tr>
		      							<tr>
		      								<td> Password </td>
		      								<td> <input class="form-control" type="password" name="user_password" value="<%= user.getPassword() %>"> </td>
		      							</tr>
		      							<tr>
		      								<td> Gender </td>
		      								<td> <%= user.getGender().toUpperCase() %> </td>
		      							</tr>
		      							<tr>
		      								<td> About </td>
		      								<td>
		      									<textarea class="form-control" name="user_about" row="3"> <%= user.getAbout() %> </textarea> 
		      								</td>
		      							</tr>
		      							<tr>
		      								<td> New Profile </td>
		      								<td> <input class="form-control" type="file" name="image"> </td>
		      							</tr>
		      						</table>
		      						
		      						<div class="container">
		      							<button type="submit" class="btn btn-outline-primary"> Save </button>
		      						</div>
		      					</form>
		      				</div>
		      				
		      			</div>
		      		</div>
		      		<div class="modal-footer">
		        		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        		<button id="edit-profile-btn" type="button" class="btn btn-primary">EDIT</button>
		      		</div>
		    	</div>
		  	</div>
		</div>
		
		
		<!--add post modal-->
        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details..</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    
                    <div class="modal-body">

                        <form id="add-post-form" action="AddPostServlet" method="post">

                            <div class="form-group">
                                <select class="form-control" name="cat_id">
                                    <option selected disabled>---Select Category---</option>

                                    <%
                                        PostDAO postd = new PostDAO(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCatID() %>"><%= c.getName()%></option>

                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <input name="post_Title" type="text" placeholder="Enter post Title" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <textarea name="post_Content" class="form-control" style="height: 200px;" placeholder="Enter your content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="post_Code" class="form-control" style="height: 200px;" placeholder="Enter your program (if any)"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select your pic..</label>
                                <br>
                                <input type="file" name="post_Pic"  >
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--END add post modal-->
		      		
		      		
	    <!--    javaScript   -->
	    <script src="Javascript/script.js" type="text/javascript"></script>
		<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	    
	    
	    <script>
	    	$(document).ready(function() {
	    		let editStatus = false;
	    		
	    		$('#edit-profile-btn').click(function() {
	    			// alert('button clicked');
	    			if(editStatus == false) {
	    				$('#profile-details').hide();
		    			$('#profile-edit').show();
		    			editStatus = true;
		    			
		    			$(this).text('Back');
		    			
	    			} else {
	    				$('#profile-details').show();
		    			$('#profile-edit').hide();
		    			editStatus = false;
		    			
		    			$(this).text('Edit');
	    			}
	    		})
	    	});
	    </script>
	    
	    
	    <!--now add post javaScript-->
        <script>
            $(document).ready(function (e) {
                
                $("#add-post-form").on("submit", function (event) {
                    //this code gets called when form is submitted....
                    event.preventDefault();
                    console.log("you have clicked on submit..")
                    let form = new FormData(this);

                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success ..
                            console.log(data);
                            if (data.trim() == 'done')
                            {
                                swal("Good job!", "saved successfully", "success");
                            } else
                            {
                                swal("Error!!", "Something went wrong try again...", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
                            swal("Error!!", "Something went wrong try again...", "Errors");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>
        

		<!--   Loading Post using ajax    --> 
		<script>
			function getPosts(catId, temp) {
				$('#loader').show();
				$('#post-container').hide();
				
				$(".c-link").removeClass('active')
				
				$.ajax({
					url : "Load_Posts.jsp",
					
					// send catId to the server by catID
					data : {catID : catId},
					success : function (data, textStatus, jqXHR) {
						console.log(data);
						$('#loader').hide();
						$('#post-container').show();
						$('#post-container').html(data);
						$(temp).addClass('active');
					}
				})
			}
			
			$(document).ready(function(e) {
				let allPostReference = $('.c-link')[0];
				getPosts(0, allPostReference);
			})
		</script>
	</body>
</html>