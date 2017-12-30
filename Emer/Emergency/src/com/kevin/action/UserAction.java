package com.kevin.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.kevin.dao.pojo.User;
import com.kevin.service.iservice.UserService;
@Controller
@RequestMapping("/user")
public class UserAction {
	@Autowired
	private UserService userService;
	@ResponseBody
	@RequestMapping("/saveUser")
	public String save(User user){
		String msg=null;
		System.out.println(user);
		if("success"==findByUsernameUser(user)){
			//如果已存在改用户名的用户则不能保存
			msg="error";
		}else{
			boolean flag="success".equals(userService.save(user));
			System.out.println("saveUser:"+flag);
			msg=flag ? "success":"error";
		}
		return msg; 
	}
	@ResponseBody
	@RequestMapping("/deleteUser")
	public String delete(@RequestParam("ids")String ids){
		List<User> users=JSON.parseArray(ids,User.class);
		String msg="error";
		for(User a:users){
			msg=userService.delete(a);
		}
		return msg;
	}
	@ResponseBody
	@RequestMapping("/updateUser")
	public String update(User user){
		boolean flag="success".equals(userService.update(user));
		return flag ? "success":"error";
	}
	@ResponseBody
	@RequestMapping("/registryUser")
	public String registry(User user){
		boolean flag="success".equals(userService.save(user));
		return flag ? "success":"error";
	}
	@ResponseBody
	@RequestMapping("/loginUser")
	public String login(User user,HttpSession httpSession){
		httpSession.removeAttribute("user");
		String msg= userService.login(user) ? "success":"error";
		if(msg=="success"){
			User user_=userService.findByName(user.getUsername()).get(0);//获取带ID的UserBean
			httpSession.setAttribute("user", user_);
			System.out.println(user_.getUsername()+"登录成功！");
		}
		return msg;
	}
	@RequestMapping("/logoutUser")
	public String logoutAdmin(HttpSession httpSession){
		User user=(User)httpSession.getAttribute("user");
		httpSession.invalidate();
		System.out.println("用户"+user.getUsername()+"已退出登录！");
		return "redirect:/index.jsp";
	}
	@ResponseBody
	@RequestMapping("/findAllUsers")
	public String findAll(){
		String msg=null;
		List<User>users=userService.findAll();
		if(users !=null && users.size()>0){
			msg=JSON.toJSONString(users);
		}
		return msg;
	}
	@ResponseBody
	@RequestMapping("/findByNameUser")
	public String findByUsernameUser(User user){
		String msg="error";
		if(userService.findByName(user.getUsername()).size()>0){
			msg="success";
		}
		return msg;
	}
}
