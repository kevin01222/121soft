package com.kevin.service.iservice;

import java.util.List;

import com.kevin.dao.pojo.User;

public interface UserService extends BaseService<User, String>{
	List<User> findByName(String name);
	boolean login(User user);
}
