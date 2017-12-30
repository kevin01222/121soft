package com.neu.service;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class ServerServiceImplTest extends AbstractJUnit4SpringContextTests{


	@Resource
	public ServerService serverService;
	
	
	@Test
	public void testUserRegister() {
		//serverService.register(phone, password, captcha, cid);
	}

	@Test
	public void testRegister() {
		fail("Not yet implemented");
	}

	@Test
	public void testSendMessage() {
		fail("Not yet implemented");
	}

	@Test
	public void testUserLogin() {
		String str=serverService.userLogin("17688399806", "123456", "", "");
		System.out.println(str);
	}

	@Test
	public void testLogin() {
		fail("Not yet implemented");
	}

	@Test
	public void testFirstService() {
		String str=serverService.firstService();
		System.out.println(str);
	}

	@Test
	public void testGetService() {
		String str=serverService.getService();
		System.out.println(str);
	}

	@Test
	public void testOrder() {
		fail("Not yet implemented");
	}

	@Test
	public void testRequireDetail3() {
		fail("Not yet implemented");
	}

	@Test
	public void testRequireDetail2Int() {
		fail("Not yet implemented");
	}

	@Test
	public void testRequireDetail2IntIntIntInt() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetAccountLogs() {
		fail("Not yet implemented");
	}

}
