package com.kevin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kevin.dao.mapper.UserMapper;
import com.kevin.dao.pojo.User;
import com.kevin.service.iservice.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	@Qualifier("userMapper")
	private UserMapper userMapper;
	
	@Transactional
	@Override
	public String save(User t) {
		String msg="error";
		try {
			if(userMapper.findById(t.getUserId())==null){
				userMapper.save(t);
				msg="success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
	@Transactional
	@Override
	public String delete(User t) {
		String msg="error";
		try {
			if(userMapper.findById(t.getUserId())!=null){
				userMapper.delete(t);
				msg="success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
	@Transactional
	@Override
	public String update(User t) {
		String msg="error";
		try {
			if(userMapper.findById(t.getUserId())!=null){
				userMapper.update(t);
				msg="success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
	@Transactional(readOnly=true)
	@Override
	public List<User> findAll() {
		List<User>users=null;
		try {
			users=userMapper.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	@Transactional(readOnly=true)
	@Override
	public User findById(Integer id) {
		User user=null;
		try {
			user=userMapper.findById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	@Transactional(readOnly=true)
	@Override
	public List<User> findByName(String name) {
		List<User>users=null;
		try {
			users=userMapper.findByName(name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	@Transactional(readOnly=true)
	@Override
	public boolean login(User user) {
		User u=null;
		try {
			u=userMapper.login(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u!=null?true:false;
	}

}
