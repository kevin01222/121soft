package com.kevin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kevin.dao.mapper.AppriseMapper;
import com.kevin.dao.pojo.Apprise;
import com.kevin.service.iservice.AppriseService;
@Service("appriseService")
public class AppriseserviceImpl implements AppriseService{
	@Autowired
	@Qualifier("appriseMapper")
	private AppriseMapper appriseMapper;
	@Transactional(
			readOnly=false,
			propagation=Propagation.REQUIRED,
			isolation=Isolation.READ_COMMITTED
			)
	@Override
	public String save(Apprise t) {
		String msg="error";
		try {
			if(appriseMapper.findById(t.getId())==null && t.getUser().getUserId()!=0 && t.getInfo().getId()!=0){
				appriseMapper.save(t);
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
	public String delete(Apprise t) {
		String msg="error";
		try {
			if(appriseMapper.findById(t.getId())!=null){
				appriseMapper.delete(t);
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
	public String update(Apprise t) {
		String msg="error";
		try {
			if(appriseMapper.findById(t.getId())!=null){
				appriseMapper.update(t);
				msg="success";
			}
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return msg;
	}
	@Transactional(readOnly=true)
	@Override
	public List<Apprise> findAll() {
		List<Apprise>apprises=null;
		try {
			apprises=appriseMapper.findAll();
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return apprises;
	}
	@Transactional(readOnly=true)
	@Override
	public Apprise findById(Integer id) {
		Apprise apprise =null;
		try {
			apprise=appriseMapper.findById(id);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return apprise;
	}
	@Transactional(readOnly=true)
	@Override
	public List<Apprise> findByUserId(Integer userId) {
		List<Apprise>apprises =null;
		try {
			apprises=appriseMapper.findByUesrId(userId);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return apprises;
	}
	@Transactional(readOnly =true)
	@Override
	public List<Apprise> findByInfoId(Integer infoId){
		List<Apprise>apprises=null;
		try{
			apprises=appriseMapper.findByInfoId(infoId);
		}catch(Exception e){
			e.printStackTrace();
		}
		return apprises;
	}
	@Transactional(readOnly=true)
	@Override
	public List<Apprise> findByUserName(String name){
		List<Apprise> apprises=null;
		try {
			apprises=appriseMapper.findByUserName(name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return apprises;
	}
	@Override
	public List<Apprise> findByInfoTitle(String title) {
		List<Apprise> apprises=null;
		try {
			apprises=	appriseMapper.findByInfoTitle(title);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return apprises;
	}
	@Override
	public List<Apprise> findByConnection(Apprise apprise) {
		List<Apprise> apprises=null;
		try {
			apprises=	appriseMapper.findByConnection(apprise);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return apprises;
	}
}
