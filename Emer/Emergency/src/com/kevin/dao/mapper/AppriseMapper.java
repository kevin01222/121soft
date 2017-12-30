package com.kevin.dao.mapper;

import java.util.List;

import com.kevin.dao.pojo.Apprise;

public interface AppriseMapper extends BaseMapper<Apprise, String> {
	List<Apprise> findByUesrId(int userId)throws Exception;
	List<Apprise> findByInfoId(int infoId)throws Exception;
	List<Apprise> findByUserName(String name)throws Exception;
	List<Apprise> findByInfoTitle(String title) throws Exception;
	List<Apprise> findByConnection(Apprise apprise)throws Exception; 
}
