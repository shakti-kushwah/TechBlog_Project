package com.tech.blog.dataAccessObjects;

import java.sql.*;

public class LikeDAO {
	Connection con;
	
	public LikeDAO(Connection con) {
		super();
		this.con = con;
	}

	public boolean insertLike(int postId, int userId) {
		boolean f = false;
		try {
			String query = "INSERT INTO Likes(postId, userId) VALUES(?, ?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			
			// value set
			pstmt.setInt(1, postId);
			pstmt.setInt(2, userId);
			
			pstmt.executeUpdate();
			f = true;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public int countLikeOnPost(int postid) {
		int count = 0;
		String query = "SELECT COUNT(*) FROM Likes WHERE postId=?";
		try {
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setInt(1, postid);
			
			ResultSet set = pstmt.executeQuery();
			if(set.next()) {
				count = set.getInt("count(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public boolean isLikeByUser(int postId, int userId) {
		boolean f = false;
		try {
			String query = "SELECT * FROM Likes WHERE postId=? AND userId=?";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			
			// value set
			pstmt.setInt(1, postId);
			pstmt.setInt(2, userId);
			
			ResultSet set = pstmt.executeQuery();
			if(set.next()) {
				f = true;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean DeleteLike(int postId, int userId) {
		boolean f = false;
		try {
			String query = "DELETE  FROM Likes WHERE postId=? AND userId=?";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			
			// value set
			pstmt.setInt(1, postId);
			pstmt.setInt(2, userId);
			
			pstmt.executeUpdate();
			f = true;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
}
