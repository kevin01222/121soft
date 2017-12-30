package com.neu.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.security.NoSuchAlgorithmException;

public class HTTPUtils {
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
	public static String sendPost(String url, String param) { 
	      OutputStreamWriter out= null;
	         BufferedReader in= null;
	         String result= "";
	        try{
	             URL realUrl= new URL(url);
	            // 打开和URL之间的连接
	             URLConnection conn= realUrl.openConnection();
	            // 设置通用的请求属性
	            conn.setRequestProperty("accept","*/*");
	            conn.setRequestProperty("connection","Keep-Alive");
	            conn.setRequestProperty("user-agent",
	                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
	            // 发送POST请求必须设置如下两行
	            conn.setDoOutput(true);
	            conn.setDoInput(true);
	            // 获取URLConnection对象对应的输出流             
	            out= new OutputStreamWriter(conn.getOutputStream(),"UTF-8");
	            // 发送请求参数
	            out.write(param);
	            // flush输出流的缓冲
	            out.flush();
	            // 定义BufferedReader输入流来读取URL的响应
	            in= new BufferedReader(
	                    new InputStreamReader(conn.getInputStream()));
	             String line;
	            while((line= in.readLine()) !=null) {
	                result+= line;
	             }
	         }catch(Exception e) {
	             System.out.println("发送 POST 请求出现异常！"+e);
	            e.printStackTrace();
	         }
	        //使用finally块来关闭输出流、输入流
	        finally{
	            try{
	                if(out!=null){
	                    out.close();
	                 }
	                if(in!=null){
	                    in.close();
	                 }
	             }
	            catch(IOException ex){
	                ex.printStackTrace();
	             }
	         }
	        return result;
	     }   
	 
	   //提供主方法，测试发送POST请求 
	   public static void main(String args[] ) throws NoSuchAlgorithmException, IOException { 
	         //文章标题
	        String title="测试title";
	       
	       //发送POST请求 
	        HTTPUtils.sendPost("http://lbs.lanbanshou.com/index.php/api/user/userLogin", 
	           "title="+new String(java.net.URLEncoder.encode(title,"utf-8").getBytes(),"ISO-8859-1")); 
	    }



	  

}
