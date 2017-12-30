package com.kevin.service.iservice;

import java.util.List;

public interface BaseService<T,K> {
	String save(T t);
	String delete(T t);
	String update(T t);
	List<T> findAll();
	T findById(Integer id);
}
