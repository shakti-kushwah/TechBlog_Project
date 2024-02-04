package com.tech.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import com.tech.blog.Entities.Post;
import com.tech.blog.Entities.User;
import com.tech.blog.dataAccessObjects.PostDAO;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.addAndDeleteFilesInProfile;

@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {           
            
        	int catID = Integer.parseInt(request.getParameter("cat_id"));
            String postTitle = request.getParameter("post_Title");
            String postContent = request.getParameter("post_Content");
            String postCode = request.getParameter("post_Code");
            Part postPic = request.getPart("post_Pic");
            
            // using session getting current user id
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");
            user.getId();
            
            // out.println("your post title is " + postTitle);
            // out.println("your post picture is " + postPic.getSubmittedFileName());
            
            Post p = new Post(postTitle, postContent, postCode, postPic.getSubmittedFileName(), null, catID, user.getId());
            PostDAO dao = new PostDAO(ConnectionProvider.getConnection());
            if (dao.savePost(p)) {

                String path = request.getServletContext().getRealPath("/") + "Blog_Pics" + File.separator + postPic.getSubmittedFileName();
                addAndDeleteFilesInProfile.saveFile(postPic.getInputStream(), path);
                out.println("done");
            } else {
                out.println("error");
            }
        }
    }
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
