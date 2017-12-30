package com.kevin.dao.mapper;

import java.util.List;

import com.kevin.dao.pojo.User;

public interface UserMapper extends BaseMapper<User,String>{
	List<User> findByName(String username)throws Exception;
	User login(User user)throws Exception;
}
