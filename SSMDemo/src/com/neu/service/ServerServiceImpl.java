package com.neu.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.neu.utils.HttpClientUtil;

@Service("serverService")
public class ServerServiceImpl implements ServerService{
	
	public ServerServiceImpl() {
	}
	//1、用户端注册接口
	@Override
	public String userRegister(String phone, String pwd, String captcha, String cid, String r_tel, Float lng,
			Float lat) {
		String url="http://lbs.lanbanshou.com/index.php/api/user/userRegister";
		Map<String,String> param=new HashMap<String,String>();
		param.put("phone",phone);
		param.put("pwd", pwd);
		param.put("captcha", captcha);
		param.put("cid", cid);
		param.put("r_tel", r_tel);
		param.put("lng", lng.toString());
		param.put("lat", lat.toString());
		String str=HttpClientUtil.doPost(url, param);
		return str;
	}
	//2、服务端注册接口
	@Override
	public String register(String phone, String password, String captcha, String cid) {
		String url="http://lbs.lanbanshou.com/index.php/api/servicer/register";
		Map<String,String> param=new HashMap<String,String>();
		param.put("phone",phone);
		param.put("password", password);
		param.put("captcha", captcha);
		param.put("cid", cid);
		String str=HttpClientUtil.doPost(url, param);
		return str;
	}
	//3、短信发送接口
	@Override
	public String sendMessage(String phone, Integer type) {
		String url="http://lbs.lanbanshou.com/index.php/api/sms/sendMessage";
		Map<String,String> param=new HashMap<String,String>();
		param.put("phone",phone);
		param.put("type", type.toString());
		String str=HttpClientUtil.doGet(url,param);
		return str;
	}
	//4、用户登录接口（短信登录）
	@Override
	public String userLogin(String phone, String pwd, String captcha, String cid) {
		// TODO Auto-generated method stub 
		String url="http://lbs.lanbanshou.com/index.php/api/user/userLogin";
		Map<String,String> param=new HashMap<String,String>();
		param.put("phone",phone);
		param.put("pwd", pwd);
		param.put("captcha", captcha);
		param.put("cid", cid);
		String str=HttpClientUtil.doPost(url, param);
		return str;
	}
	//5、服务端登录
	@Override
	public String login(String phone, String password, String cid) {
		// TODO Auto-generated method stub 
		String url="http://lbs.lanbanshou.com/index.php/api/servicer/login";
		Map<String,String> param=new HashMap<String,String>();
		param.put("phone",phone);
		param.put("password", password);
		param.put("cid", cid);
		String str=HttpClientUtil.doPost(url, param);
		return str;
	}
	//6、一级服务分类
	@Override
	public String firstService() {
		String url="http://lbs.lanbanshou.com/index.php/api/service/firstService";
		String str=HttpClientUtil.doGet(url);
		return str;
	}
	//7、全部服务分类
	@Override
	public String getService() {
		String url="http://lbs.lanbanshou.com/index.php/api/service/getService";
		String str=HttpClientUtil.doGet(url);
		return str;
	}
	//8、提交服务订单
	@Override
	public String makeRequire(Integer uid, String service_items_id, String reward_contacts, String reward_tel,
			String reward_position, Float reward_destination_lng, Float reward_destination_lat, String reward_appoint,
			String reward_img, String reward_describe) {
		String url="http://lbs.lanbanshou.com/index.php/api/order/makeRequire";
		Map<String,String> param=new HashMap<String,String>();
		param.put("uid",uid.toString());
		param.put("service_items_id",service_items_id);
		param.put("reward_contacts",reward_contacts);
		param.put("reward_tel",reward_tel);
		param.put("reward_position",reward_position);
		param.put("reward_destination_lng",reward_destination_lng.toString());
		param.put("reward_destination_lat",reward_destination_lat.toString());
		param.put("reward_appoint",reward_appoint);
		param.put("reward_img",reward_img);
		param.put("reward_describe",reward_describe);
		String str=HttpClientUtil.doPost(url);
		return str;
	}
	//10、获取订单列表
	@Override
	public String order(Integer uid, Integer utype, Integer status, Integer page, Integer pagesize, Float lng, Float lat) {
		String url="http://lbs.lanbanshou.com/index.php/api/order/order";
		Map<String,String> param=new HashMap<String,String>();
		param.put("uid",uid.toString() );
		param.put("utype", utype.toString());
		param.put("status", status.toString());
		param.put("page", page.toString());
		param.put("pagesize", pagesize.toString());
		param.put("lng", lng.toString());
		param.put("lat", lat.toString());
		String str=HttpClientUtil.doGet(url, param);
		return str;
	}
	//11、服务端获取订单详情
	@Override
	public String requireDetail3(Integer oid, Float lng, Float lat) {
		String url="http://lbs.lanbanshou.com/index.php/api/order/requireDetail3";
		Map<String,String> param=new HashMap<String,String>();
		param.put("oid",oid.toString() );
		param.put("lng", lng.toString());
		param.put("lat", lat.toString());
		String str=HttpClientUtil.doGet(url, param);
		return str;
	}
	//12、用户端详情接口
	@Override
	public String requireDetail2(Integer id) {
		// TODO Auto-generated method stub 
		String url="http://lbs.lanbanshou.com/index.php/api/order/requireDetail2";
		Map<String,String> param=new HashMap<String,String>();
		param.put("id",id.toString() );
		String str=HttpClientUtil.doGet(url, param);
		return str;
	}
	//13、用户端App支付接口(url地址可能有问题，改service,改impl,加action)
	@Override
	public String requireDetail2(Integer uid, Integer oid, Integer paytype, Integer is_integral) {
		String url="http://lbs.lanbanshou.com/index.php/api/order/requireDetail2";
		Map<String,String> param=new HashMap<String,String>();
		param.put("uid",uid.toString() );
		param.put("oid",oid.toString() );
		param.put("paytype",paytype.toString() );
		param.put("is_integral",is_integral.toString());
		String str=HttpClientUtil.doGet(url, param);
		return str;
	}
	//14、获取用户账单接口
	@Override
	public String getAccountLogs(Integer uid, Integer type, Integer page, Integer pagesize) {
		// TODO Auto-generated method stub 
		String url="http://lbs.lanbanshou.com/index.php/api/user/getAccountLogs";
		Map<String,String> param=new HashMap<String,String>();
		param.put("uid",uid.toString() );
		param.put("type",type.toString() );
		param.put("page",page.toString() );
		param.put("pagesize",pagesize.toString() );
		String str=HttpClientUtil.doGet(url, param);
		return str;
	}


}
