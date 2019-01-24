package com.tmmmi.service.content.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;

import com.tmmmi.service.domain.ContentSetting;

@Repository("contentKeywordDaoImpl")
public class ContentKeywordDaoImpl extends ContentDaoAdaptor {
	///Constructor
	public ContentKeywordDaoImpl() {
		System.out.println(this.getClass());
    }

	/*@Override
	public Map<Integer, List<Object>> getContentMap(ContentSetting contentSetting, int index) {
		Map<Integer, List<Object>> contentMap = new HashMap<Integer, List<Object>>();
		
		if (contentSetting.getShowUserSearch1() != 0) {
			contentMap.put(contentSetting.getShowUserSearch1(), getKeywordFirst(contentSetting, index));
		} 
		/// else if 
			//put
		
		return contentMap;		
	}*/
	
	public List<Object> getKeywordFirst(ContentSetting contentSetting, int index){
		List<Object> objectList = new ArrayList<Object>();
		
		StringBuilder sb;
	    String clientId = "8UnBF2q3kdzG36xN7kVj";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "LJxxFFhxEN";//애플리케이션 클라이언트 시크릿값";
	    
	    try {
	        String text = URLEncoder.encode("\""+contentSetting.getUserSearch1()+"|"+contentSetting.getUserSearch2()+"|"+contentSetting.getUserSearch3()+"\"", "UTF-8");
	        String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text;// json 결과
	        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
	        URL url = new URL(apiURL);
	        HttpURLConnection con = (HttpURLConnection)url.openConnection();
	        con.setRequestMethod("GET");
	        con.setRequestProperty("X-Naver-Client-Id", clientId);
	        con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	        int responseCode = con.getResponseCode();
	        BufferedReader br;
	        if(responseCode==200) { // 정상 호출
	            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            //userKeyword.add(br);
	        } else {  // 에러 발생
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
		
		return objectList;
	}
}
