package com.neu.test;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;

import com.neu.utils.HttpClientUtil;

public class TestHttp {
	public static void main(String[] args)throws Exception{
	//System.out.println(urlToString("http://lbs.lanbanshou.com/index.php/api/service/firstService"));
		httpClientUtilTest();
	}
	public static String urlToString(String url_str) throws Exception{
		URL url = new URL(url_str);
		URLConnection conn = url.openConnection();
		BufferedReader bufIn = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		String line = null;
		StringBuilder builder=new StringBuilder();
		while((line=bufIn.readLine())!=null)
		{
		builder.append(line);
		}
		bufIn.close();
		return builder.toString();
	}
	
	public static void httpClientUtilTest(){

/*		String getstr=HttpClientUtil.doGet("http://lbs.lanbanshou.com/index.php/api/service/firstService");
		System.out.println(getstr);*/
		
/*		String url="http://lbs.lanbanshou.com/index.php/api/user/userLogin";
		Map param=new HashMap<String,String>();
		param.put("phone", "17688399806");
		param.put("pwd", "123456");
		String str=HttpClientUtil.doPost(url, param);
		System.out.println(str);*/
	}
	public static void test(){
		
	}

}
