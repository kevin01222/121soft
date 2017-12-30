package com.kevin.dao.mapper;

import java.util.List;

import com.kevin.dao.pojo.Admin;

public interface AdminMapper extends BaseMapper<Admin,String> {
	List<Admin> findByName(String name)throws Exception;
	Admin login(Admin admin)throws Exception;
}
