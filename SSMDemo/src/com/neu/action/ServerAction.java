package com.neu.action;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neu.dao.pojo.TaotaoResult;
import com.neu.service.ServerService;
import com.neu.utils.JsonUtils;

@Controller
@RequestMapping("/serverService")
public class ServerAction {
	@Autowired
	private ServerService serverService;
	//1、用户端注册接口
	@RequestMapping("/userRegister")
	@ResponseBody
	public Object userRegister(String phone, String pwd, String captcha, String cid, String r_tel,@RequestParam(defaultValue="111.515700") Float lng,
			@RequestParam(defaultValue="36.109338")Float lat){
		String json=serverService.userRegister(phone, pwd, captcha, cid, r_tel, lng, lat);
		return JsonUtils.jsonToPojo(json,Object.class);
	}
	//2、服务端注册接口
	@RequestMapping("/register")
	@ResponseBody
	public Object register(String phone, String password, String captcha, String cid){
		String json=serverService.register(phone, password, captcha, cid);
		return JsonUtils.jsonToPojo(json,Object.class);
	}
	//3、短信发送接口
	@RequestMapping(value="/sendMessage",method = RequestMethod.GET)
	@ResponseBody
	public Object  sendMessage(String phone, @RequestParam(value="type",required=true) Integer type){//type必须要有//phone在前台验证
		String json=serverService.sendMessage(phone, type);
		return JsonUtils.jsonToPojo(json,Object.class);
	}
	//4、用户登录接口（短信登录）
	@RequestMapping("/userLogin")
	@ResponseBody
	public Object userLogin(String phone, String pwd, String captcha, String cid,HttpSession httpSession) {
		String json=serverService.userLogin(phone,  pwd, captcha, cid);
		Object json_obg=JsonUtils.jsonToPojo(json,Object.class);
		httpSession.setAttribute("userInfo", json);
		return json_obg;
	}
	//5、服务端登录
	@RequestMapping("/login")
	@ResponseBody
	public Object  login(String phone, String password, String cid){
		String json=serverService.login(phone,  password,  cid);
		return JsonUtils.jsonToPojo(json,Object.class);
	}
	
	//6、一级服务分类
	@RequestMapping(value="/firstService",method = RequestMethod.GET)
	@ResponseBody
	public Object firstService(){
		String json=serverService.firstService();
		return TaotaoResult.format(json);
	}
	//7、全部服务分类
	@RequestMapping(value="/getService",method = RequestMethod.GET)
	@ResponseBody
	public Object getService(){
		String json= serverService.getService();
		return TaotaoResult.format(json);
	}
	//8、提交服务订单
	@RequestMapping(value="/makeRequire")
	@ResponseBody
	public Object makeRequire(Integer uid, String service_items_id, String reward_contacts, String reward_tel,
			String reward_position, Float reward_destination_lng, Float reward_destination_lat, String reward_appoint,
			String reward_img, String reward_describe){
		String json=serverService.makeRequire(uid,service_items_id,reward_contacts,reward_tel,reward_position,reward_destination_lng,reward_destination_lat,reward_appoint,reward_img,reward_describe);
		return JsonUtils.jsonToPojo(json, Object.class);
	}
	//10、获取订单列表
	@RequestMapping(value="/order/{uid}/{utype}/{status}",method = RequestMethod.GET)
	@ResponseBody
	public Object order(@PathVariable Integer uid,@PathVariable Integer utype,@PathVariable Integer status, @RequestParam(defaultValue="1")Integer page,@RequestParam(defaultValue="30") Integer pagesize,@RequestParam(defaultValue="0") Float lng,@RequestParam(defaultValue="0") Float lat){
		String json=serverService.order(uid,  utype,  status,page,pagesize,lng,lat);
		return JsonUtils.jsonToPojo(json,Object.class);
	}
	//11、服务端获取订单详情
	@RequestMapping(value="/requireDetail3/{oid}",method = RequestMethod.GET)
	@ResponseBody
	public Object requireDetail3(@PathVariable Integer oid,@RequestParam(defaultValue="0") Float lng,@RequestParam(defaultValue="0") Float lat){
		String json=serverService.requireDetail3(oid,  lng,  lat);
		return JsonUtils.jsonToPojo(json,Object.class);
	}
	//12、用户端详情接口
	@RequestMapping(value="/requireDetail2/{id}",method = RequestMethod.GET)
	@ResponseBody
	public Object requireDetail2(@PathVariable Integer id) {
		String json=serverService.requireDetail2(id);
		return JsonUtils.jsonToPojo(json,Object.class);
	}
	//13、用户端App支付接口

	//14、获取用户账单接口
	@RequestMapping(value="/getAccountLogs/{uid}/{type}",method = RequestMethod.GET)
	@ResponseBody
	public Object getAccountLogs(@PathVariable Integer uid,@PathVariable Integer type,@RequestParam(defaultValue="1")Integer page,	@RequestParam(defaultValue="30") Integer pagesize){
		String json=serverService.getAccountLogs(uid,  type,  page,pagesize);
		return JsonUtils.jsonToPojo(json,Object.class);
	}
}
