package com.kevin.dao.pojo;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;


public class Info {
	private int id;
	private String content;
	private String title;
	private String place;
	private String time;
	private String type;
	private User user;
	private String state;
	private String video;
	private String audio;
	private String description;
	private String start_time;
	private String end_time;
	//状态
	public static String INFO_STATE_PUBLIC="1";
	public static String INFO_STATE_STOP="0";
	
	//信息分类
	public static String INFO_TYPE_ZRZH="zrzh";//自然灾害
	public static String INFO_TYPE_SGZN="sgzn";//事故灾难
	public static String INFO_TYPE_GGWSSJ="ggwssj";//公共卫生事件
	public static String INFO_TYPE_SHAQSJ="shaqsj";//社会安全事件
	public static Map<String,String>INFO_TYPE_MAP;
	static{
		INFO_TYPE_MAP=new HashMap<String,String>();
		INFO_TYPE_MAP.put(INFO_TYPE_ZRZH, "自然灾害");
		INFO_TYPE_MAP.put(INFO_TYPE_SGZN, "事故灾难");
		INFO_TYPE_MAP.put(INFO_TYPE_GGWSSJ, "公共卫生事件");
		INFO_TYPE_MAP.put(INFO_TYPE_SHAQSJ, "社会安全事件");
		
	}
	
	public Info() {
		// TODO 自动生成的构造函数存根
	}
	
	public Info(String content, String title, String place, String time, String type, User user, String state,
			String video, String audio, String description) {
		super();
		this.content = content;
		this.title = title;
		this.place = place;
		if(time==null||time==""){
			this.time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		}else{
			this.time = time;
		}
		this.type = type;
		this.user = user;
		this.state = state;
		this.video = video;
		this.audio = audio;
		this.description = description;
	}

	public Info(String content, String title, String place, String time, String type, User user,String state,String video,String audio, String description,String start_time,String end_time) {
		super();
		this.content = content;
		this.title = title;
		this.place = place;
		if(time==null||time==""){
			this.time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		}else{
			this.time = time;
		}
		this.type = type;
		this.user = user;
		this.state=state;
		this.setVideo(video);
		this.setAudio(audio);
		this.description=description;
		this.setStart_time(start_time);
		this.setEnd_time(end_time);
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
//	@JsonSerialize(using = CustomDateSerializer.class)
	public String getTime() {
		if(time==""||time==null){
			return null;
		}else if(time.length()>19){
			return time.substring(0,19);
		}else{
			return time;
		}
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public  User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public String getAudio() {
		return audio;
	}
	public void setAudio(String audio) {
		this.audio = audio;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	@Override
	public String toString() {
		return "Info [id=" + id + ", content=" + content + ", title=" + title + ", place=" + place + ", time=" + time
				+ ", type=" + type + ", user=" + user + ", state=" + state + ", video=" + video + ", audio=" + audio
				+ ", description=" + description + ", start_time=" + start_time + ", end_time=" + end_time + "]";
	}
	
}
