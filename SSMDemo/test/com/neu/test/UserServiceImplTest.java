package com.neu.test;

import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.neu.dao.pojo.User;
import com.neu.service.UserService;

public class UserServiceImplTest {
	UserService userService;
	@Before
	public void setUp() throws Exception {
		//从IOC容器内获取userService,而userService中将被自动装配userDao,
		//userDao中自动装配sessionFactory	
		userService = (UserService) 
				new ClassPathXmlApplicationContext("applicationContext.xml")
				.getBean("userService");
	}
	@Test
	public void testSave() {
		User user = new User("abc","123",new Date());
		System.out.println(userService.save(user));
	}
	@Test
	public void testDelete() {
		User user = new User();
		user.setId(5);
		System.out.println(userService.delete(user));
	}
	@Test
	public void testUpdate() {
		User user = new User();
		user.setId(5);
		user.setUsername("TTTT");
		user.setPassword("123");
		System.out.println(userService.update(user));
	}

	@Test
	public void testFindAll() {
		System.out.println(userService.findAll());
	}

	@Test
	public void testFindByName() {
		System.out.println(userService.findByName("4"));
	}

	@Test
	public void testFindById() {
		System.out.println(userService.findById(2));
	}

	@Test
	public void testLogin() {
		User user = new User();
		user.setUsername("scott");
		user.setPassword("tiger");
		System.out.println(userService.login(user));
		user.setUsername("root");
		user.setPassword("root");
		System.out.println(userService.login(user));
	}

}
