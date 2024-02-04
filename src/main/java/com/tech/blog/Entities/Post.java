package com.tech.blog.Entities;

import java.sql.Timestamp;

public class Post {
	private int postID;
	private String postTitle;
	private String postContent;
	private String postCode;
	private String postPic;
	private Timestamp postDate;
	private int catID;
	private int userID;

	public Post(int postID, String postTitle, String postContent, String postCode, String postPic, Timestamp postDate, int catID, int userID) {
		this.postID = postID;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postCode = postCode;
		this.postPic = postPic;
		this.postDate = postDate;
		this.catID = catID;
		this.setUserID(userID);
	}

	public Post() {
		
	}

	public Post(String postTitle, String postContent, String postCode, String postPic, Timestamp postDate, int catID, int userID) {
		super();
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postCode = postCode;
		this.postPic = postPic;
		this.postDate = postDate;
		this.catID = catID;
		this.setUserID(userID);
	}

	public int getPostID() {
		return postID;
	}

	public void setPostID(int postID) {
		this.postID = postID;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getPostPic() {
		return postPic;
	}

	public void setPostPic(String postPic) {
		this.postPic = postPic;
	}

	public Timestamp getPostDate() {
		return postDate;
	}

	public void setPostDate(Timestamp postDate) {
		this.postDate = postDate;
	}

	public int getCatID() {
		return catID;
	}

	public void setCatID(int catID) {
		this.catID = catID;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}
}
