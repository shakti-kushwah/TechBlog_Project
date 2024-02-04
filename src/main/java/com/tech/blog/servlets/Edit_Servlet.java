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

import com.tech.blog.Entities.Message;
import com.tech.blog.Entities.User;
import com.tech.blog.dataAccessObjects.UserDataAccessObject;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.addAndDeleteFilesInProfile;

/**
 * Servlet implementation class Edit_Servlet
 */
@MultipartConfig
public class Edit_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            
            
            // Fetch All Data
            String userName = request.getParameter("user_name");
            String userEmail = request.getParameter("user_email");
            String userPass = request.getParameter("user_password");
            String userAbout = request.getParameter("user_about");
            
            Part part = request.getPart("image");
            String imgName = part.getSubmittedFileName();
            
            // Get the user from the Session
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            user.setName(userName);
            user.setEmail(userEmail);
            user.setPassword(userPass);
            user.setAbout(userAbout);
            String oldFile = user.getProfile();
            user.setProfile(imgName);
            
            // Update Database
            UserDataAccessObject dao = new UserDataAccessObject(ConnectionProvider.getConnection());
            boolean ans = dao.updateUser(user);
            
            if(ans == true) {
            	
            	String path = request.getServletContext().getRealPath("/") + "Profile_Pics" + File.separator + user.getProfile();
            	
            	// Delete profile image
            	String OldFilePath = request.getServletContext().getRealPath("/") + "Profile_Pics" + File.separator + oldFile;
            	if(!oldFile.equals("default.png")) {
            		addAndDeleteFilesInProfile.deleteFile(OldFilePath);
            	}	
            	
            	// Save profile image
            	if(addAndDeleteFilesInProfile.saveFile(part.getInputStream(), path)) {
            		out.println("Profile Updated to Database.....");
            		
            		Message msg = new Message("Profile Details Updated.....", "success", "alert-success");
	                s.setAttribute("msg", msg);
	                
            	} else {
                    out.println("Not saved to Database");
                    Message msg = new Message("Something went wrong to save.....", "error", "alert-error");
                    s.setAttribute("msg", msg);
                }
            	
            } else {
            	out.println("Not Updated to Database");
            	
            	Message msg = new Message("Something went wrong.....", "error", "alert-error");
                s.setAttribute("msg", msg);
            }
            
            response.sendRedirect("Profile.jsp");
            
            
            out.println("</body>");
            out.println("</html>");
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
