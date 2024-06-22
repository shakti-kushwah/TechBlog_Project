<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page import="com.tech.blog.Entities.*" %>
<%@ page errorPage="Error_Page.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tech.blog.dataAccessObjects.*" %>
<%@ page import="com.tech.blog.helper.*" %>
<%@ page import="java.text.DateFormat" %>

<%
	User user = (User)session.getAttribute("currentUser");
	if(user == null) {
		response.sendRedirect("Login.jsp");
	}
%>

<%
	int postId = Integer.parseInt(request.getParameter("post_id"));
	PostDAO dao = new PostDAO(ConnectionProvider.getConnection());
	Post p = dao.getPostByPostID(postId);
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title><%= p.getPostTitle() %> || TechBlog</title>
		<link rel="stylesheet" href="CSS/style.css" type="text/css" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<style>
			.banner-background {
				clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
			}
			
			.post-title {
				font-weight : 200;
				font-size : 30px;
			}
			
			.post-content {
				font-weight : 100;
				font-size : 20px;
			}
			
			.post-date {
				font-style : italic;
				font-weight : bold;
			}
			
			.post-user-info {
				font-size : 20px;
			}
			
			.row-user {
				border : 1px solid #e2e2e2;
				padding-top : 15px;
			}
			
			.post-id {
				color: white;
			}
			
			body {
				background : url("images/backgroundimg.jpg");
				background-size : cover;
				background-attachment: fixed;
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
	                    <a class="nav-link" href="Profile.jsp"> <span class="fa fa-bell-o"></span>Learn Code <span class="sr-only">(current)</span></a>
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
	    
	    
	    <!--    Main Content of Body   -->
	    <div class="container">
	    	<div class="row my-4">
	    		<div class="col-md-8 offset-md-2">
	    			<div class="card">
	    				<div class="card-header text-white primary-background">
	    					<h4 class="post-title"><%= p.getPostTitle() %></h4>
	    				</div>
	    				
	    				<div class="card-body">
	    					<img class="card-img-top my-2 img-fluid" src="Blog_Pics/<%= p.getPostPic() %>" alt="Card image cap">
	    					<div class="row my-3 row-user">
	    						<div class="col-md-8">
	    							<%
	    								UserDataAccessObject userdao = new UserDataAccessObject(ConnectionProvider.getConnection());
	    							%>
	    							<p class="post-user-info"> <a href="#!"> <%= userdao.getUserByUserID(p.getUserID()).getName() %> </a> has posted : </p>
	    						</div>
	    						
	    						<div class="col-md-4">
	    							<p class="post-date"> <%= DateFormat.getDateTimeInstance().format(p.getPostDate()) %> </p>
	    						</div>
	    					</div>
	    					
	    					<p class="post-content"><%= p.getPostContent() %></p>
	    					<br>
	    					
	    					<div class="post-code">
	    						<pre><%= p.getPostCode() %></pre>
	    					</div>
	    				</div>
	    				
	    				<div class="card-footer text-center primary-background">
	    					<%
	    						LikeDAO likedao = new LikeDAO(ConnectionProvider.getConnection());
	    					%>
							<a href="#!" onclick="doLike(<%= p.getPostID() %>, <%= user.getId() %>)" class="btn btn-outline-light btn-sm">
								<i class="fa fa-thumbs-o-up">
									<span class="like-counter"> <%= likedao.countLikeOnPost(p.getPostID()) %></span>
								</i>
							</a>
							
							<a href="#!" class="btn btn-outline-light btn-sm">
								<i class="fa fa-commenting-o">
									<span>20</span>
								</i>
							</a>
						</div>
	    			</div>
	    		</div>
	    	</div>
	    </div>
	    
	    
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
		      				<img src="Profile_Pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%; max-width: 150px;" >
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
	    
		<h1 class="post-id"> Post ID : <%= postId %> </h1>
		
	</body>
</html>