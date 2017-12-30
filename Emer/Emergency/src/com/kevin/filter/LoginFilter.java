package com.kevin.filter;


import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kevin.dao.pojo.User;


public class LoginFilter implements Filter {

	@Override
	public void destroy() {
		

	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
			throws IOException, ServletException {
			HttpServletRequest request=(HttpServletRequest) servletRequest;
			HttpServletResponse response=(HttpServletResponse) servletResponse;
			String uri = request.getRequestURI();
			//管理员登录请求
			if(uri.contains("/n_bk/")){
				//已经登录过
				if(request.getSession().getAttribute("admin")!=null){
					
							chain.doFilter(request, response);
				}else{
					//没有权限，跳转到没有权限提示页面
					response.sendRedirect(request.getContextPath()+"/noPermission");
				}
			//普通用户登录请求
			}else if(uri.contains("/front/user/")){
				if(request.getSession().getAttribute("user")!=null){
						chain.doFilter(request,response);
				}else{
					if(uri.contains("liuyan")){
						//System.out.println(uri);
						int beginIndex=uri.lastIndexOf("infoId=");
						String infoId=uri.substring(beginIndex);
						//System.out.println(infoId);
						request.getSession().setAttribute("uriSession",request.getContextPath()+"/info/findByIdInfoFront_?"+infoId);
						response.sendRedirect(request.getContextPath()+"/front/user_login.jsp");
					}else{
						request.getSession().setAttribute("uriSession", uri);
						response.sendRedirect(request.getContextPath()+"/front/user_login.jsp");
					}
				}
			}else{
				//登录请求，放行
				chain.doFilter(request, response);
			}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		

	}

}
