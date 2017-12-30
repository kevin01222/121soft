package com.kevin.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.kevin.dao.pojo.Apprise;
import com.kevin.dao.pojo.Info;
import com.kevin.dao.pojo.User;
import com.kevin.service.iservice.AppriseService;
import com.kevin.service.iservice.InfoService;
import com.kevin.service.iservice.UserService;

@Controller
@RequestMapping("/info")
public class InfoAction {
	@Autowired
	private InfoService infoService;
	@Autowired
	private AppriseService appriseService;
	@Autowired
	private UserService userService;
	
	@InitBinder
	protected void initBinder(HttpServletRequest request,ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(
				Date.class, 
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"),true));
	}
	
	@ResponseBody
	@RequestMapping("/saveInfo")
	public String save(Info info){
		boolean flag="success".equals(infoService.save(info));
		return flag ? "success":"error";
	}
	@ResponseBody
	@RequestMapping("/springUpload")
	public String springUpload(HttpServletRequest request,HttpServletResponse response)throws IllegalStateException,IOException{
		String msg="";
		//创建一个通用的多部分解析器 
		CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(request.getSession().getServletContext());
		//判断 request 是否有文件上传,即多部分请求 
		if(multipartResolver.isMultipart(request)){
			//转换成多部分request 
			MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
			//获取bean表单内容
			String title=multiRequest.getParameter("title");
			String type=multiRequest.getParameter("type");
			String place=multiRequest.getParameter("place");
			String time=multiRequest.getParameter("time");
			String content=multiRequest.getParameter("content");
			String state=multiRequest.getParameter("state");
			String uploaderId=multiRequest.getParameter("uploaderId");
				int userId=Integer.parseInt(uploaderId);
				User user=userService.findById(userId);
			String audio=null;
			String video=null;
			String other=null;
			String description=multiRequest.getParameter("description");
			String audio_type="mp3,wav,ogg";//<audio>标签支持的音频
			String video_type="mp4,era,mpeg4,webm,mov";//<video>标签支持的视频
			//取得request中的所有文件名  
			Iterator<String> iter=multiRequest.getFileNames();
			while(iter.hasNext()){
				//取得上传文件  
				MultipartFile file=multiRequest.getFile(iter.next().toString());
//				System.out.println("file.getName()="+file.getName());//audio
//				System.out.println("file.getOriginalFilename()="+file.getOriginalFilename());//*.mp3
				if(file!=null){
					//取得当前上传文件的文件名称
					String myFileName = file.getOriginalFilename();
					//取得当前上传文件的文件类型
					String myfileType=myFileName.substring(myFileName.lastIndexOf('.')+1).toLowerCase();
					//如果名称不为“”,说明该文件存在，否则说明该文件不存在  
					if(myFileName.trim()!=""){
//						System.out.println("myFileName="+myFileName);//*.mp3
//                        String path= request.getServletPath()+"/upload";
						//定义上传路径 
                       String path = request.getServletContext().getRealPath("/");
                        if(audio_type.contains(myfileType)){
                        	audio="/upload/audio/"+myFileName;
                        	file.transferTo(new File(path+audio));
                        	System.out.println("audio上传成功！");
                        }else if(video_type.contains(myfileType)){
                        		video="/upload/video/"+myFileName;
                        		file.transferTo(new File(path+video));
                        		System.out.println("video上传成功！");
                        }else{
                        	other="/upload/other/"+myFileName;
                        	file.transferTo(new File(path+other));
                        	System.out.println("other媒体上传成功！");
                        }
					}
				}
			}
			Info info=new Info(content,title,place,time,type,user,state,video,audio,description);
			System.out.println(info);
			msg=save(info);
		}
		return msg;
	}
	@ResponseBody
	@RequestMapping("/deleteInfo")
	public String delete(@RequestParam("ids") String ids){
		List<Info> info=JSON.parseArray(ids,Info.class);
		String msg="error";
		for(Info a:info){
			msg=infoService.delete(a);
		}
		return msg;
	}
	@RequestMapping("/deleteInfo_")
	public String deleteApprise_(Info info) {
		boolean flag = "success".equals(infoService.delete(info));
		return flag ? "redirect:n_bk/findAllInfos_" : "error";
	}
	@ResponseBody
	@RequestMapping("/updateInfo")
	public String update(Info info){
		boolean flag="success".equals(infoService.update(info));
		return flag ? "success":"error";
	}
	
	@RequestMapping("/updateInfo_")
	public String update_(Info info){
		boolean flag="success".equals(infoService.update(info));
		return flag ? "redirect:n_bk/findAllInfos_":"error";
	}
	@ResponseBody
	@RequestMapping("/findAllInfosFront")
	public String findAll(){
		String msg=null;
		List<Info>infos=infoService.findAllFront();
		if(infos !=null && infos.size()>0){
			msg=JSON.toJSONString(infos,SerializerFeature.DisableCircularReferenceDetect);
			System.out.println("/findAllInfosFront"+msg);
		}
		return msg;
	}
	@ResponseBody
	@RequestMapping("/findBySearchInfosFront")
	public String findByTitle(@RequestParam String str){
		String msg=null;
		List<Info>infos=infoService.findByTitle(str);
		infos.addAll(infoService.findByType(str));
		if(infos !=null && infos.size()>0){
			msg=JSON.toJSONString(infos,SerializerFeature.DisableCircularReferenceDetect);
			System.out.println("/findAllInfosFront"+msg);
		}
		return msg;
	}
	@RequestMapping("/n_bk/findAllInfos_")
	public String findAll_(Map<String, Object> request){
		List<Info>infos=infoService.findAll();
		if(infos !=null && infos.size()>0){
			request.put("infos", infos);
			System.out.println("/n_bk/findAllInfos_"+infos);
			return "/n_bk/bk_info_main";
			//return new ModelAndView("/n_bk/bk_info_main","infos",infos);
		} else {
			return "/n_bk/bk_no_data";
		}
	}
	@RequestMapping("/n_bk/findByIdInfo_")
	public String findByIdInfo_(Map<String, Object> request,@RequestParam Integer infoId){
		List<Apprise>apprises=appriseService.findByInfoId(infoId);
		Info info=infoService.findById(infoId);
		if (apprises != null && apprises.size() > 0) {
			request.put("apprises", apprises);
		} 
		if(info !=null){
			request.put("info", info);
			return "/n_bk/bk_info_page";
		}else{
			return "error";
		} 
	}
	@RequestMapping("/findByIdInfoFront_")
	public String findByIdInfoFront_(Map<String, Object> request,@RequestParam Integer infoId){
		List<Apprise>apprises=appriseService.findByInfoId(infoId);
		Info info=infoService.findById(infoId);
		if (apprises != null && apprises.size() > 0) {
			request.put("apprises", apprises);
		} 
		if(info !=null){
			request.put("info", info);
			return "forward:/front/user/liuyan.jsp";
		}else{
			return "error";
		} 
	}
	@RequestMapping("/n_bk/findByConnectionInfos_")
	public String findByConnectionInfo_(Map<String, Object> request,Info info){
		//System.out.println(info);
		List<Info>infos=infoService.findByConnection(info);
		if(infos!=null & infos.size()>0){
			request.put("infos", infos);
			return "/n_bk/bk_info_main";
		}else{
			return "/n_bk/bk_no_data";
		}
	}
}
