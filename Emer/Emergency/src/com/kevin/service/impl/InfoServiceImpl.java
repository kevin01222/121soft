package com.kevin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kevin.dao.mapper.InfoMapper;
import com.kevin.dao.mapper.UserMapper;
import com.kevin.dao.pojo.Info;
import com.kevin.dao.pojo.User;
import com.kevin.service.iservice.InfoService;

@Service("infoService")
public class InfoServiceImpl implements InfoService{
@Autowired
@Qualifier("infoMapper")
private InfoMapper infoMapper;
@Autowired
@Qualifier("userMapper")
private UserMapper userMapper;
	@Transactional(
			readOnly=false,
			propagation=Propagation.REQUIRED,
			isolation=Isolation.READ_COMMITTED
			)
	@Override
	public String save(Info t) {
		String msg="error";
		try {
			if(infoMapper.findById(t.getId())==null){
				infoMapper.save(t);
				msg="success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
	@Transactional
	@Override
	public String delete(Info t) {
		String msg="error";
		try {
			if(infoMapper.findById(t.getId())!=null){
				infoMapper.delete(t);
				msg="success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
	@Transactional
	@Override
	public String update(Info t) {
		String msg="error";
		try {
			Info info = infoMapper.findById(t.getId());
			if(info!=null){
				infoMapper.update(t);
				msg="success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
	@Transactional
	@Override
	public String update2(Info t) {
		String msg="error";
		try {
			Info info = infoMapper.findById(t.getId());
			User user = userMapper.findById(t.getUser().getUserId());
			if(info!=null && user!=null){
				infoMapper.update(t);
				msg="success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
	
	@Transactional
	@Override
	public String updateState(Info t) {
		String msg="error";
		try {
			Info info = infoMapper.findById(t.getId());
			if(info!=null){
				info.setState(t.getState());
				infoMapper.update(info);
				msg="success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
	@Transactional(readOnly=true)
	@Override
	public List<Info> findAll() {
		List<Info>info=null;
		try {
			info=infoMapper.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return info;
	}
	@Transactional(readOnly=true)
	@Override
	public Info findById(Integer id) {
		Info info=null;
		try {
			info=infoMapper.findById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return info;
	}
	@Transactional(readOnly=true)
	@Override
	public List<Info> findByTitle(String name) {
		List<Info>info=null;
		try {
			info=infoMapper.findByTitle(name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return info;
	}
	@Transactional(readOnly=true)
	@Override
	public List<Info> findByType(String name) {
		List<Info>info=null;
		try {
			info=infoMapper.findByType(name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return info;
	}
	@Transactional(readOnly=true)
	@Override
	public List<Info> findAllFront() {
		List<Info>infos=null;
		try {
			infos=infoMapper.findAllFront();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return infos;
	}
	@Transactional(readOnly=true)
	@Override
	public List<Info> findByConnection(Info info) {
		List<Info>infos=null;
		try {
			infos=infoMapper.findByConnection(info);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return infos;
	}

}
