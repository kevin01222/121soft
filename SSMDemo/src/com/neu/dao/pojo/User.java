package com.neu.dao.pojo;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class User implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String username;
	private String password;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regtime;

	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(String username, String password, Date regtime) {
		super();
		this.username = username;
		this.password = password;
		this.regtime = regtime;
	}

	public User(int id, String username, String password, Date regtime) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.regtime = regtime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public Date getRegtime() {
		return regtime;
	}

	public void setRegtime(Date regtime) {
		this.regtime = regtime;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", regtime=" + regtime + "]";
	}

}
