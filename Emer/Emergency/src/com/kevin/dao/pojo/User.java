package com.kevin.dao.pojo;

public class User {
	private int userId;
	private String username;
	private String password;
	private String phone;
	private String email;
	private int level;
	private String con1;
	private String con2;
	public User() {
		// TODO 自动生成的构造函数存根
	}
	public User(int userId, String username, String password, String phone, String email, int level) {
		super();
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.email = email;
		this.level = level;
	}
	public User(String username, String password, String phone, String email, int level) {
		super();
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.email = email;
		this.level = level;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", username=" + username + ", password=" + password + ", phone=" + phone
				+ ", email=" + email + ", level=" + level + "]";
	}
	
	
}
