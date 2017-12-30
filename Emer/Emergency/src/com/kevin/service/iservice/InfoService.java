package com.kevin.service.iservice;

import java.util.List;

import com.kevin.dao.pojo.Info;

public interface InfoService extends BaseService<Info, String> {
	List<Info> findByTitle(String name);
	List<Info> findByType(String name);
	List<Info> findAllFront();
	List<Info> findByConnection(Info info);
	String updateState(Info info);
	String update2(Info info);
}
