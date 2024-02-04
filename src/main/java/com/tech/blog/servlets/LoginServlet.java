package com.tech.blog.servlets;

import com.tech.blog.dataAccessObjects.*;
import com.tech.blog.Entities.Message;
import com.tech.blog.Entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
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
	            
	            //	login 
	            //	fetch username and password from request
	            String userEmail = request.getParameter("email");
	            String userPassword = request.getParameter("password");

	            UserDataAccessObject dao = new UserDataAccessObject(ConnectionProvider.getConnection());

	            User u = dao.getUserByEmailAndPassword(userEmail, userPassword);

	            if (u == null) {
	                // login.................
	            	//	      error       ///
	            	// out.println("Invalid Details..try again");
	                Message msg = new Message("Invalid Details! try with another", "error", "alert-danger");
	                HttpSession s = request.getSession();
	                s.setAttribute("msg", msg);

	                response.sendRedirect("Login.jsp");
	            } else {
	                //......
//	                login success
	                HttpSession s = request.getSession();
	                s.setAttribute("currentUser", u);
	                response.sendRedirect("Profile.jsp");

	            }

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
