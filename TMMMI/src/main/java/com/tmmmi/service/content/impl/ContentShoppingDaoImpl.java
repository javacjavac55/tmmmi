package com.tmmmi.service.content.impl;

import java.util.List;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

import com.tmmmi.service.content.ContentDao;
import com.tmmmi.service.domain.ContentSetting;

@Repository("contentShoppingDaoImpl")
public class ContentShoppingDaoImpl extends ContentDaoAdaptor {

	public ContentShoppingDaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@Override
	public List<Object> getContentShoppingFirstList(ContentSetting contentSetting, int index) {
			StringBuilder sb;
			String clientId = "rHBsMd5Tu_WOFtXexEQz";
	        String clientSecret = "95lxTYNVRV";
	        int display =  5;
	        
	        try {
	            String text = URLEncoder.encode("���̾", "UTF-8");
	            String apiURL = "https://openapi.naver.com/v1/search/shop?query="+ text+"&display="+display;// json 
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("X-Naver-Client-Id", clientId);
	            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { 
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }
	            sb = new StringBuilder();
	            String line;
	 
	            while ((line = br.readLine()) != null) {
	                sb.append(line + "\n");
	            }
	            br.close();
	            con.disconnect();
	            System.out.println(sb);
	        } catch (Exception e) {
	            System.out.println(e);
	        }
			return null;
	}
}
