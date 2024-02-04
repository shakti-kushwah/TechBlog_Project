package com.tech.blog.dataAccessObjects;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tech.blog.Entities.User;

public class UserDataAccessObject {
	private Connection con;

    public UserDataAccessObject(Connection con) {
        this.con = con;
    }

    //method to insert user to data base:
    public boolean saveUser(User user) {
        boolean f = false;
        try {
            //user -->database

            String query = "insert into user(name, email, password, gender, about) values (?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    
    
    // Get user email and password
    public User getUserByEmailAndPassword(String email, String password) {
    	User user = null;
    	
    	try {
    		String Query = "SELECT * FROM user WHERE email = ? AND password = ?";
    		PreparedStatement pstmt = con.prepareStatement(Query);
    		pstmt.setString(1, email);
    		pstmt.setString(2, password);
    		
    		// fire the query
    		 ResultSet rs = pstmt.executeQuery();
    		 if(rs.next()) {
    			 user = new User();
    			 
    			 // get data from database
    			 String name = rs.getString("name");
    			 // set to user object
    			 user.setName(name);
    			 
    			 user.setId(rs.getInt("id"));
    			 user.setEmail(rs.getString("email"));
    			 user.setPassword(rs.getString("password"));
    			 user.setGender(rs.getString("gender"));
    			 user.setAbout(rs.getString("about"));
    			 user.setDateTime(rs.getTimestamp("registerDate"));
    			 user.setProfile(rs.getString("profile"));
    		 }
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	
    	return user;
    }
    
    // Edit(Update) Profile
    public boolean updateUser(User user) {
    	boolean isQueryRun = false;
    	try {
    		String Query = "UPDATE user SET name=?, email=?, password=?, gender=?, about=?, profile=? WHERE id=?";
    		PreparedStatement pstmt = con.prepareStatement(Query);
    		pstmt.setString(1, user.getName());
    		pstmt.setString(2, user.getEmail());
    		pstmt.setString(3, user.getPassword());
    		pstmt.setString(4, user.getGender());
    		pstmt.setString(5, user.getAbout());
    		pstmt.setString(6, user.getProfile());
    		pstmt.setInt(7, user.getId());
    		
    		pstmt.executeUpdate();
    		isQueryRun = true;
    		
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	
    	return isQueryRun;
    }
    
    public User getUserByUserID(int userID) {
    	User user = null;
    	try {
    		String Query = "SELECT * FROM user WHERE id=?";
    		PreparedStatement pstmt = this.con.prepareStatement(Query);
    		pstmt.setInt(1, userID);
    		
    		// fire the query
	   		 ResultSet rs = pstmt.executeQuery();
	   		 if(rs.next()) {
	   			 user = new User();
	   			 
	   			 // get data from database
	   			 String name = rs.getString("name");
	   			 // set to user object
	   			 user.setName(name);
	   			 
	   			 user.setId(rs.getInt("id"));
	   			 user.setEmail(rs.getString("email"));
	   			 user.setPassword(rs.getString("password"));
	   			 user.setGender(rs.getString("gender"));
	   			 user.setAbout(rs.getString("about"));
	   			 user.setDateTime(rs.getTimestamp("registerDate"));
	   			 user.setProfile(rs.getString("profile"));
	   		 }
    		
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	
		return user;
    }
}   
