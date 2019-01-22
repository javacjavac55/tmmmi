package com.tmmmi.service.content.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.tmmmi.service.content.ContentDao;
import com.tmmmi.service.domain.ContentSetting;

@Repository("contentKeywordDaoNaverImpl")
public class ContentKeywordDaoNaverImpl implements ContentDao {
	///Constructor
	public ContentKeywordDaoNaverImpl() {
		System.out.println(this.getClass());
    }
	@Override
	public void getContent() {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Object> getContentList(ContentSetting contentSetting, int index) {
		StringBuilder sb;
	    String clientId = "8UnBF2q3kdzG36xN7kVj";//���ø����̼� Ŭ���̾�Ʈ ���̵�";
	    String clientSecret = "LJxxFFhxEN";//���ø����̼� Ŭ���̾�Ʈ ��ũ����";
	    
	    try {
	        String text = URLEncoder.encode("\""+contentSetting.getUserSearch1()+"|"+contentSetting.getUserSearch2()+"|"+contentSetting.getUserSearch3()+"\"", "UTF-8");
	        String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text;// json ���
	        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml ���
	        URL url = new URL(apiURL);
	        HttpURLConnection con = (HttpURLConnection)url.openConnection();
	        con.setRequestMethod("GET");
	        con.setRequestProperty("X-Naver-Client-Id", clientId);
	        con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	        int responseCode = con.getResponseCode();
	        BufferedReader br;
	        if(responseCode==200) { // ���� ȣ��
	            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            //userKeyword.add(br);
	        } else {  // ���� �߻�
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
