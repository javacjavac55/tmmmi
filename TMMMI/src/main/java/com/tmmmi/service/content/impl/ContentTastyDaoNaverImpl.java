package com.tmmmi.service.content.impl;

import com.tmmmi.service.content.ContentDao;
import com.tmmmi.service.domain.ContentSetting;
import com.tmmmi.service.domain.ContentTasty;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Repository;

@Repository("contentTastyDaoNaverImpl")
public class ContentTastyDaoNaverImpl implements ContentDao {
	
	///Constructor
	public ContentTastyDaoNaverImpl() {
	}
	
	///Method
	@Override
	public void getContent() {
	}

	@Override
	public List<Object> getContentList(ContentSetting contentSetting) {
		String clientId = "d9ROlDLvnXulcE2hxtAm";//���ø����̼� Ŭ���̾�Ʈ ���̵�";
        String clientSecret = "O4TGEmLBA4";//���ø����̼� Ŭ���̾�Ʈ ��ũ����";
        contentSetting.setTastyKeyword("������ ����");
        try {
        	String text = URLEncoder.encode(contentSetting.getTastyKeyword(), "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/local?query="+ text; // json ���
            ObjectMapper objectMapper = new ObjectMapper();
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // ���� ȣ��
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // ���� �߻�
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
                String data = objectMapper.writeValueAsString(response);
                List<ContentTasty> contentTasty = objectMapper.readValue(data, new TypeReference<ContentTasty>() {});
            }
            br.close();
            System.out.println(response.toString());
        } catch (Exception e) {
            System.out.println(e);
        }
        
        ArrayList list = new ArrayList<>();
		
        return null;
	}
}
