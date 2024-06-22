<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page import="com.tech.blog.dataAccessObjects.*" %>
<%@ page import="com.tech.blog.Entities.*" %>
<%@ page import="com.tech.blog.helper.*" %>
<%@ page import="java.util.List" %>

<div class="row">
	<%
		User u = (User)session.getAttribute("currentUser");
	
		Thread.sleep(1000);
		PostDAO dao = new PostDAO(ConnectionProvider.getConnection());
	
		// fetch catID here from profile/Loading Post using ajax/data
		int catId = Integer.parseInt(request.getParameter("catID"));
		List<Post> posts = null;
		
		if(catId == 0) {
			posts = dao.getAllPosts();
		} else {
			posts = dao.getPostByCatID(catId);
		}
		
		if(posts.size() == 0) {
			out.println("<h3 class='display-3 text-center'>No Posts in this Category..</h3>");
			return;
		}
		
		for(Post p : posts) {
	%>	
		
		<div class="col-md-6 mt-2">
			<div class="card">
				<img class="card-img-top text-align: center ml-4" src="Blog_Pics/<%= p.getPostPic() %>" alt="Card image cap" style="width:300px; height:300px;" >
				<div class="card-body">
					<b> <%= p.getPostTitle() %> </b>
					<p> <%= p.getPostContent() %> </p>
				</div>
				
				<div>
					<div class="card-footer text-center primary-background text-center">
						<% 
                    		LikeDAO ld = new LikeDAO(ConnectionProvider.getConnection());
               			 %>

                		<a href="#!" onclick="doLike(<%= p.getPostID()%>,<%= u.getId()%>)" class="btn btn-outline-light btn-sm"> 
                			<i class="fa fa-thumbs-o-up"></i> 
                			<span class="like-counter"><%= ld.countLikeOnPost(p.getPostID())%></span>  
                		</a>
						
						<a href="Show_Blog_Page.jsp?post_id=<%= p.getPostID() %>" class="btn btn-outline-light btn-sm">Read More</a>
						
						<a href="#!" class="btn btn-outline-light btn-sm">
							<i class="fa fa-commenting-o">
								<span>20</span>
							</i>
						</a>
					</div>
				</div>
			</div>
		</div>	
	<%		
		}
	%>
</div>