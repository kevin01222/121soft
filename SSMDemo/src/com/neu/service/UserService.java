package com.neu.service;

import java.util.List;

import com.neu.dao.pojo.User;

public interface UserService {
	String save(User user);

	String delete(User user);

	String update(User user);

	List<User> findAll();

	List<User> findByName(String username);

	User findById(int id);

	boolean login(User user);
}
