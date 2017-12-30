package com.kevin.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class PageAction {
	
	@RequestMapping("/n_bk/")
	public String page(){
		return "n_bk/bk_index";
	}
	@RequestMapping("/n_bk/{page}")
	public String  showPage(@PathVariable String page){
		return "n_bk/"+page;
	}
	@RequestMapping("/noPermission")
	public String noPermission(){
		return "noPermission";
	}
}
