package com.kevin.service.iservice;

import java.util.List;

import com.kevin.dao.pojo.Apprise;

public interface AppriseService extends BaseService<Apprise, Integer> {
	List<Apprise> findByUserId(Integer userid);

	List<Apprise> findByInfoId(Integer infoId);

	List<Apprise> findByUserName(String name);

	List<Apprise> findByInfoTitle(String title);

	List<Apprise> findByConnection(Apprise apprise );

}
