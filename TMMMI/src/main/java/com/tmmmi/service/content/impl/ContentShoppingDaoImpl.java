package com.tmmmi.service.content.impl;

import java.util.List;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

import com.tmmmi.service.content.ContentDao;
import com.tmmmi.service.domain.ContentSetting;
import com.tmmmi.service.domain.ContentShopping;

@Repository("contentShoppingDaoImpl")
public class ContentShoppingDaoImpl extends ContentDaoAdaptor {

	public ContentShoppingDaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	public List<Object> getContentShoppingFirstList(ContentSetting contentSetting, int index) throws Exception {
			StringBuffer sb;
			String clientId = "rHBsMd5Tu_WOFtXexEQz";
	        String clientSecret = "95lxTYNVRV";
	        int display =  8;
	      
	        List<Object> result =new ArrayList<Object>();
	        
	        try {
	        	String text = URLEncoder.encode("다이어리", "UTF-8");
	            String apiURL = "https://openapi.naver.com/v1/search/shop.json?query="+ text+"&display="+display;// json 
	            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("X-Naver-Client-Id", clientId);
	            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { 
	                br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
	            } else {  
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
	            }
	            sb = new StringBuffer();
	            String line;
	 
	            while ((line = br.readLine()) != null) {
	                sb.append(line + "\n");
	            }
	            br.close();
	            con.disconnect();
	            /*System.out.println(sb);*/
	        
	            String json = "";
	            json = sb.toString();
	            System.out.println("json++++" +json);
	            
	            JSONParser parser=new JSONParser();
	            JSONObject items =(JSONObject)parser.parse(json);
	            JSONArray arr = (JSONArray)items.get("items");
	          
	            for(int i =0; i<arr.size() ; i++) {
	            	JSONObject tmp = (JSONObject)arr.get(i);
	            	
	            	String title = (String)tmp.get("title");
	            	String link = (String)tmp.get("link");
	            	String lprice = (String)tmp.get("lprice");
	            	String image = (String)tmp.get("image");
	            	
	            	ContentShopping contentShopping = new ContentShopping();
	            	contentShopping.setShoppingTitle(title);
	            	contentShopping.setShoppingLink(link);
	            	contentShopping.setShoppingPrice(Integer.parseInt(lprice));
	            	contentShopping.setShoppingThumbnail(image);
	            	result.add(contentShopping);
	            }
	            

	        } catch (Exception e) {
	            System.out.println(e);
	        }
			return result;
	    }
	}