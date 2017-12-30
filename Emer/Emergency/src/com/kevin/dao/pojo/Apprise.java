package com.kevin.dao.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Apprise {
	private int id;
	private User user;
	private Info info;
	private String appriseInfo;
	private String time;
	private String start_time;
	private String end_time;
	private String state;
	public Apprise() {
		// TODO 自动生成的构造函数存根
	}

	public Apprise(User user, Info info, String appriseInfo,String state) {
		super();
		this.user = user;
		this.info = info;
		this.appriseInfo = appriseInfo;
		this.time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		this.state=state;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Info getInfo() {
		return info;
	}
	public void setInfo(Info info) {
		this.info = info;
	}
	public String getAppriseInfo() {
		return appriseInfo;
	}
	public void setAppriseInfo(String appriseInfo) {
		this.appriseInfo = appriseInfo;
	}
	public String getTime() {
		return time.substring(0,19);
	}
	public void setTime(String time) {
		this.time = time;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "Apprise [id=" + id + ", user=" + user + ", info=" + info + ", appriseInfo=" + appriseInfo + ", time="
				+ time  + ", state=" + state + "]";
	}

	
}
