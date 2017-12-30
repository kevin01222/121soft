package com.kevin.dao.mapper;

import java.util.List;

public interface BaseMapper <T,K> {
	void save(T t) throws Exception;
	void delete(T t) throws Exception;
	void update(T t) throws Exception;
	List<T> findAll() throws Exception;
	T findById(Integer id) throws Exception;
}
 