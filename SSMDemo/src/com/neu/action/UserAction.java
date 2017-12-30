package com.neu.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.neu.dao.pojo.User;
import com.neu.service.UserService;

@Controller
public class UserAction {
	
	@Autowired
	private UserService userService;

	@RequestMapping("saveUser")
	public String save(User user) {
		boolean flag = "success".equals(userService.save(user));
		return flag ? "redirect:findAllUsers" : "error";
	}

	@RequestMapping("deleteUser")
	public String delete(User user) {
		boolean flag = "success".equals(userService.delete(user));
		return flag ? "redirect:findAllUsers" : "error";
	}

	@RequestMapping("updateUser")
	public String update(User user) {
		boolean flag = "success".equals(userService.update(user));
		return flag ? "redirect:findAllUsers" : "error";
	}

	@RequestMapping("registryUser")
	public String registry(User user) {
		boolean flag = "success".equals(userService.save(user));
		return flag ? "redirect:index.jsp" : "error";
	}

	@RequestMapping("loginUser")
	public String login(User user) {
		return userService.login(user) ? "redirect:findAllUsers" : "error";
	}

	@RequestMapping(value="findAllUsers",method=RequestMethod.GET)
	public String findAll(Map<String, Object> request) {
		List<User> users = userService.findAll();
		if (users != null && users.size() > 0) {
			request.put("users", users);
			return "user_main";
		} else {
			return "error";
		}
	}

	@RequestMapping("findByIdUser")
	public String findById(@RequestParam Integer id, Map<String, Object> request) {
		User user = userService.findById(id);
		if (user != null) {
			List<User> users = new ArrayList<User>();
			users.add(user);
			request.put("users", users);
			return "user_main";
		} else {
			return "error";
		}
	}
	@RequestMapping("findByNameUser")
	public String findByName(@RequestParam String ename, Map<String, Object> request) {
		List<User> users = userService.findByName(ename);
		if (users != null && users.size() > 0) {
			request.put("users", users);
			return "user_main";
		} else {
			return "error";
		}
	}

}
