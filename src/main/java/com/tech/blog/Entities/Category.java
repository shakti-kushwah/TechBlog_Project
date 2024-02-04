package com.tech.blog.Entities;

public class Category {
	private int catID;
	private String name;
	private String desciption;
	
	public Category(int catID, String name, String desciption) {
		this.catID = catID;
		this.name = name;
		this.desciption = desciption;
	}

	public Category() {
		
	}

	public Category(String name, String desciption) {
		this.name = name;
		this.desciption = desciption;
	}

	public int getCatID() {
		return catID;
	}

	public void setCatID(int catID) {
		this.catID = catID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesciption() {
		return desciption;
	}

	public void setDesciption(String desciption) {
		this.desciption = desciption;
	}
	
	
}
