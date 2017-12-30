package com.kevin.action;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.kevin.dao.pojo.Admin;
import com.kevin.service.iservice.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminAction {
	@Autowired
	private AdminService adminService;
	@ResponseBody
	@RequestMapping("/saveAdmin")
	public String save(Admin admin){
		boolean flag="success".equals(adminService.save(admin));
		return flag ? "success":"error";
	}
	@ResponseBody
	@RequestMapping("/deleteAdmin")
	public String delete(@RequestParam("ids")String ids){
		List<Admin> admins=JSON.parseArray(ids,Admin.class);
		String msg="error";
		for(Admin a:admins){
			msg=adminService.delete(a);
		}
		return msg;
	}
	@ResponseBody
	@RequestMapping("/updateAdmin")
	public String update(Admin admin){
		boolean flag="success".equals(adminService.update(admin));
		return flag ? "success":"error";
	}
	@ResponseBody
	@RequestMapping("/findAllAdmins")
	public String findAll(){
		String msg=null;
		List<Admin>admins=adminService.findAll();
		if(admins !=null && admins.size()>0){
			msg=JSON.toJSONString(admins);
		}
		return msg;
	}

	@RequestMapping("/loginAdmin")
	public String loginAdmin(Admin admin,HttpSession httpSession){
		httpSession.setAttribute("admin", admin.getUsername());
		//return adminService.login(admin) ?  new ModelAndView(new RedirectView("/emergency/background/bk_index.jsp")):new ModelAndView(new RedirectView("/emergency/front/admin_login.jsp"));
		return adminService.login(admin) ? "n_bk/bk_index":"redirect:/index.jsp";
	}
	@RequestMapping("/logoutAdmin")
	public String logoutAdmin(HttpSession httpSession){
		String admin_name=(String)httpSession.getAttribute("admin");
		httpSession.invalidate();
		System.out.println(admin_name+"已退出登录！");
		return "redirect:/index.jsp";
	}
	@ResponseBody
	@RequestMapping("/admin_login")
	public String admin_login(Admin admin){
		return adminService.login(admin) ?"success":"error";
	}
	@ResponseBody
	@RequestMapping("/findByNameAdmin")
	public String findByUsername(Admin admin){
		String msg="error";
		if(adminService.findByName(admin.getUsername()).size()>0){
			msg="success";
		}
		System.out.println(msg);
		return msg;
	}

}
