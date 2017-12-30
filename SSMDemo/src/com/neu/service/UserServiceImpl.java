package com.neu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.neu.dao.mapper.UserDao;
import com.neu.dao.pojo.User;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;

	public UserServiceImpl() {

	}
	
	@Transactional(
	readOnly=false,
	propagation=Propagation.REQUIRED,
	isolation=Isolation.READ_COMMITTED
	)
	/*
	 * propagation 事务传播方式  当save方法被执行时,
	 * 如果service中已经启动了事务(已经有朋友在饭店占了一张桌子吃饭) 
	 * 1-  REQUIRED (不创建新的事务,直接加入已有事务   直接到朋友桌吃饭,大家一起结账)
	 * 2-  REQUIRES_NEW (新创建一个事务,各自提交或回滚,自己吃自己结账)
	 */
	@Override
	public String save(User user) {
		String msg = "error";
		try {
			if (userDao.findById(user.getId()) == null) {
				userDao.save(user);
				msg = "success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}

	@Transactional
	@Override
	public String delete(User user) {
		String msg = "error";
		try {
			if (userDao.findById(user.getId()) != null) {
				userDao.delete(user);
				msg = "success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}

	@Transactional
	@Override
	public String update(User user) {
		String msg = "error";
		try {
			if (userDao.findById(user.getId()) != null) {
				userDao.update(user);
				msg = "success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}

	@Transactional(readOnly=true)
	@Override
	public List<User> findAll() {
		List<User> users = null;
		try {
			users = userDao.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}

	@Transactional(readOnly=true)
	@Override
	public List<User> findByName(String username) {
		List<User> users = null;
		try {
			users = userDao.findByName(username);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}

	@Transactional(readOnly=true)
	@Override
	public User findById(int id) {
		User user = null;
		try {
			user = userDao.findById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	@Transactional(readOnly=true)
	@Override
	public boolean login(User user) {
		User x = null;
		try {
			x = userDao.login(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return x!=null?true:false;
	}

}
