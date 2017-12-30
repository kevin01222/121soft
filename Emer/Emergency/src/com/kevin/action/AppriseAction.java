package com.kevin.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.kevin.dao.pojo.Apprise;
import com.kevin.dao.pojo.Info;
import com.kevin.dao.pojo.User;
import com.kevin.service.iservice.AppriseService;

@Controller
@RequestMapping("/apprise")
public class AppriseAction {
	@Autowired
	private AppriseService appriseService;
	
/*	@InitBinder
	protected void initBinder(HttpServletRequest request,ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(
				Date.class, 
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),true));
	}*/
	@ResponseBody
	@RequestMapping("/saveApprise")
	public String save(Apprise apprise){
		System.out.println("/saveAppriseAction="+apprise);
		boolean flag="success".equals(appriseService.save(apprise));
		return flag ? "success":"error";
	}
	@ResponseBody
	@RequestMapping("/deleteApprise")
	public String delete(@RequestParam("ids")String ids){
		List<Apprise> apprises=JSON.parseArray(ids,Apprise.class);
		String msg="error";
		for(Apprise a:apprises){
			msg=appriseService.delete(a);
		}
		return msg;
	}
	@RequestMapping("/deleteApprise_")
	public String deleteApprise_(Apprise apprise) {
		boolean flag = "success".equals(appriseService.delete(apprise));
		return flag ? "redirect:n_bk/findAllApprises_" : "error";
	}
	@ResponseBody
	@RequestMapping("/updateApprise")
	public String update(Apprise apprise){
		boolean flag="success".equals(appriseService.update(apprise));
		return flag ? "success":"error";
	}
	@RequestMapping("updateApprise_")
	public String update_(Apprise apprise){
		boolean flag="success".equals(appriseService.update(apprise));
		return flag ? "redirect:n_bk/findAllApprises_":"error";
	}
	@ResponseBody
	@RequestMapping("/findAllApprises")
	public String findAll(){
		String msg=null;
		List<Apprise>apprises=appriseService.findAll();
		for(Apprise a:apprises)System.out.println("侧apprise:"+a);
		if(apprises !=null && apprises.size()>0){
			msg=JSON.toJSONString(apprises,SerializerFeature.DisableCircularReferenceDetect);
		}
		//System.out.println("哈哈："+msg);
		return msg;
	}
	@RequestMapping("/n_bk/findAllApprises_")
	public String findAll(Map<String, Object> request) {
		List<Apprise>apprises=appriseService.findAll();
		//System.out.println(apprises);
		if (apprises != null && apprises.size() > 0) {
			request.put("apprises", apprises);
			return "/n_bk/bk_apprise_main";
		} else {
			return "/n_bk/bk_no_data";
		}
	}
	
	@RequestMapping("/n_bk/findByIdApprises_")
	public String findByIdApprises(Map<String,Object >request,@RequestParam Integer id){
		Apprise apprise=appriseService.findById(id);
		if (apprise != null) {
			List<Apprise> apprises=new ArrayList<Apprise>();
			apprises.add(apprise);
			request.put("apprises", apprises);
			return "/n_bk/bk_apprise_main";
		} else {
			return "/n_bk/bk_no_data";
		}
	}
	@ResponseBody
	@RequestMapping("/findByInfoIdApprises")
	public String findBuyInfoIdApprises(@RequestParam Integer infoId){
		String msg=null;
		List<Apprise>apprises=appriseService.findByInfoId(infoId);
		if(apprises !=null && apprises.size()>0){
			msg=JSON.toJSONString(apprises,SerializerFeature.DisableCircularReferenceDetect);
		}
		return msg;
	}
	@RequestMapping("/n_bk/findByInfoIdApprises_")
	public String findByInfoIdApprises_(Map<String,Object >request,@RequestParam Integer infoId){
		List<Apprise>apprises=appriseService.findByInfoId(infoId);
		if (apprises != null && apprises.size() > 0) {
			request.put("apprises", apprises);
			return "/n_bk/bk_apprise_main";
		} else {
			return "/n_bk/bk_no_data";
		}
	}
	@RequestMapping("/n_bk/findByUserIdApprises_")
	public String findByUserIdApprises(Map<String,Object >request,@RequestParam Integer userId){
		List<Apprise>apprises=appriseService.findByUserId(userId);
		if (apprises != null && apprises.size() > 0) {
			request.put("apprises", apprises);
			return "/n_bk/bk_apprise_main";
		} else {
			return "/n_bk/bk_no_data";
		}
	}
	@RequestMapping("/n_bk/findByUserNameApprises_")
	public String findByUserNameApprise(Map<String ,Object>request,@RequestParam String idname){
		List<Apprise> apprises=appriseService.findByUserName(idname);
		if (apprises != null && apprises.size() > 0) {
			request.put("apprises", apprises);
			return "/n_bk/bk_apprise_main";
		} else {
			return "/n_bk/bk_no_data";
		}
	}
	@RequestMapping("/n_bk/findByInfoTitleApprises_")
	public String findByInfoTitleApprise(Map<String ,Object>request,@RequestParam String idtitle){
		List<Apprise> apprises=appriseService.findByInfoTitle(idtitle);
		if (apprises != null && apprises.size() > 0) {
			request.put("apprises", apprises);
			return "/n_bk/bk_apprise_main";
		} else {
			return "/n_bk/bk_no_data";
		}
	}

	@RequestMapping("/n_bk/findByConnectionApprises_")
	public String findByAppriseInfoApprise(Map<String,Object>request,@RequestParam String username, @RequestParam String title,@RequestParam String appriseInfo,@RequestParam String time1,@RequestParam String time2){
		String time_1=time1.replace("T"," ");
		String time_2=time2.replace("T"," ");
		Apprise apprise=new Apprise();
		User user=new User();
		user.setUsername(username);
		Info info=new Info();
		info.setTitle(title);
		
		apprise.setUser(user);
		apprise.setInfo(info);
		apprise.setAppriseInfo(appriseInfo);
		apprise.setStart_time(time_1);
		apprise.setEnd_time(time_2);
		List<Apprise> apprises=appriseService.findByConnection(apprise);
		if(apprises!=null && apprises.size()>0){
			request.put("apprises", apprises);
			return "/n_bk/bk_apprise_main";
		}else{
			return "/n_bk/bk_no_data";
		}
		
	}
}
