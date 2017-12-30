package com.neu.service;

public interface ServerService {
	//1、用户端注册接口
	String userRegister(String phone,String pwd,String captcha,String cid,String r_tel,Float lng,Float lat);//用户端注册
	//2、服务端注册接口
	String register(String phone,String password,String captcha,String cid);//服务端注册
	//3、短信发送接口
	String sendMessage(String phone,Integer type);//get
	//4、用户登录接口（短信登录）
	String userLogin(String phone,String pwd,String captcha,String cid);
	//5、服务端登录
	String login(String phone,String password,String cid);
	//6、一级服务分类
	String firstService();
	//7、全部服务分类
	String getService();
	//8、提交服务订单
	String makeRequire(Integer uid,String service_items_id,String reward_contacts,String reward_tel,String reward_position,Float reward_destination_lng,Float reward_destination_lat,String reward_appoint,String reward_img,String reward_describe);
	//9
	//
	//10、获取订单列表
	String order(Integer uid,Integer utype,Integer status,Integer page,Integer pagesize ,Float lng ,Float lat);
	//11、服务端获取订单详情
	String requireDetail3(Integer oid,Float lng,Float lat);
	//12、用户端详情接口
	String requireDetail2(Integer id);
	//13、用户端App支付接口
	String requireDetail2(Integer uid,Integer oid,Integer paytype,Integer is_integral);
	//14、获取用户账单接口
	String getAccountLogs(Integer uid,Integer type,Integer page,Integer pagesize);
}
