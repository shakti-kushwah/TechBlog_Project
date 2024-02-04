package com.tech.blog.dataAccessObjects;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.Entities.Category;
import com.tech.blog.Entities.Post;

public class PostDAO {
	Connection con;

	public PostDAO(Connection con) {
		this.con = con;
	}
	
	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> list = new ArrayList<>();
		
		try {
			String query = "SELECT * FROM Categories";
			Statement stmt = this.con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				int catid = rs.getInt("catId");
				String name = rs.getString("name");
				String description = rs.getString("description");
				
				Category c = new Category(catid, name, description);
				list.add(c);
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// save post in database
	public boolean savePost(Post p) {
		boolean flag = false;
		
		try {
			String q = "INSERT INTO Posts(postTitle, postContent, postCode, postPic, catID, userID) VALUES(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setString(1, p.getPostTitle());
			pstmt.setString(2, p.getPostContent());
			pstmt.setString(3, p.getPostCode());
			pstmt.setString(4, p.getPostPic());
			pstmt.setInt(5, p.getCatID());
			pstmt.setInt(6, p.getUserID());
			
			pstmt.executeUpdate();
			
			flag = true;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	// Get all the posts
	public List<Post> getAllPosts() {
		List<Post> list = new ArrayList<>();
		
		// fetch all the posts
		try {
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM Posts ORDER BY postID DESC");
			ResultSet set = pstmt.executeQuery();
			while(set.next()) {
				int postId = set.getInt("postID");
				String postTitle = set.getString("postTitle");
	            String postContent = set.getString("postContent");
	            String postCode = set.getString("postCode");
	            String postPic = set.getString("postPic");
	            Timestamp date = set.getTimestamp("postDate");
	            int catId = set.getInt("catID");
	            int userId = set.getInt("userID");
	            Post post = new Post(postId, postTitle, postContent, postCode, postPic, date, catId, userId);
	            
	            list.add(post);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Post> getPostByCatID(int catId) {
		List<Post> list = new ArrayList<>();
		
		// fetch all the posts by id
		try {
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM Posts WHERE catID = ?");
			pstmt.setInt(1, catId);
			ResultSet set = pstmt.executeQuery();
			
			while(set.next()) {
				int postId = set.getInt("postID");
				String postTitle = set.getString("postTitle");
	            String postContent = set.getString("postContent");
	            String postCode = set.getString("postCode");
	            String postPic = set.getString("postPic");
	            Timestamp date = set.getTimestamp("postDate");
	            int userId = set.getInt("userID");
	            Post post = new Post(postId, postTitle, postContent, postCode, postPic, date, catId, userId);
	            
	            list.add(post);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	public Post getPostByPostID(int postId) {
		Post post = null;
		String q = "SELECT * FROM Posts WHERE postID=?";
		try {
			PreparedStatement pstmt = this.con.prepareStatement(q);
			pstmt.setInt(1, postId);
			
			ResultSet set = pstmt.executeQuery();
			if(set.next()) {
				int pId = set.getInt("postID");
				String postTitle = set.getString("postTitle");
	            String postContent = set.getString("postContent");
	            String postCode = set.getString("postCode");
	            String postPic = set.getString("postPic");
	            Timestamp date = set.getTimestamp("postDate");
	            int catId = set.getInt("catID");
	            int userId = set.getInt("userID");
	            post = new Post(pId, postTitle, postContent, postCode, postPic, date, catId, userId);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return post;
	}
}
