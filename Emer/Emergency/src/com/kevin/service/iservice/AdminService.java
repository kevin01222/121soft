package com.kevin.service.iservice;

import java.util.List;

import com.kevin.dao.pojo.Admin;

public interface AdminService extends BaseService<Admin,String>{
	List<Admin>findByName(String name);
	boolean login(Admin admin);
}
