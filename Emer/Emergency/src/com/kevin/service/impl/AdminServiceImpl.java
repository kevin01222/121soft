package com.kevin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kevin.dao.mapper.AdminMapper;
import com.kevin.dao.pojo.Admin;
import com.kevin.service.iservice.AdminService;
@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	@Qualifier("adminMapper")
	private AdminMapper adminMapper;
	@Transactional(
			readOnly=false,
			propagation=Propagation.REQUIRED,
			isolation=Isolation.READ_COMMITTED
			)
	@Override
	public String save(Admin t) {
		String msg="error";
		try {
			if(adminMapper.findById(t.getId())==null){
				adminMapper.save(t);
				msg="success";
			}
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return msg;
	}
	@Transactional
	@Override
	public String delete(Admin t) {
		String msg="error";
		try {
			if(adminMapper.findById(t.getId())!=null){
			adminMapper.delete(t);
			msg="success";}
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return msg;
	}
	
	@Transactional
	@Override
	public String update(Admin t) {
		String msg="error";
		try {
			if(adminMapper.findById(t.getId())!=null){
			adminMapper.update(t);
			msg="success";}
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return msg;
		
	}
	@Transactional(readOnly=true)
	@Override
	public List<Admin> findAll() {
		List<Admin> admins=null;
		try {
			admins=adminMapper.findAll();
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return admins;
	}

	@Transactional(readOnly=true)
	@Override
	public List<Admin> findByName(String name) {
		List<Admin>admins =null;
		try {
			admins=adminMapper.findByName(name);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return admins;
	}
	@Transactional(readOnly=true)
	@Override
	public Admin findById(Integer k) {
		Admin admin=null;
		try {
			admin=adminMapper.findById(k);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return admin;
	}
	@Override
	public boolean login(Admin admin) {
		Admin adm=null;
		try {
			adm=adminMapper.login(admin);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return adm!=null?true:false;
	}

}
