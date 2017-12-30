package com.kevin.dao.mapper;

import java.util.List;

import com.kevin.dao.pojo.Info;

public interface InfoMapper extends BaseMapper<Info, String>{
	List<Info> findByTitle(String name)throws Exception;
	List<Info> findByType(String name)throws Exception;
	List<Info> findAllFront()throws Exception;
	List<Info> findByConnection(Info info);
}
