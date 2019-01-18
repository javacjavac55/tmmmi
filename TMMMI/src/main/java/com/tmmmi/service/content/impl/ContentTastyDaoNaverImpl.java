package com.tmmmi.service.content.impl;

import com.tmmmi.service.content.ContentDao;
import com.tmmmi.service.domain.ContentSetting;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class ContentTastyDaoNaverImpl implements ContentDao {

	public ContentTastyDaoNaverImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void getContent() {
		// TODO Auto-generated method stub

	}

	@Override
	public void getContentList(ContentSetting contentSetting) {
		String clientId = "d9ROlDLvnXulcE2hxtAm";//���ø����̼� Ŭ���̾�Ʈ ���̵�";
        String clientSecret = "O4TGEmLBA4";//���ø����̼� Ŭ���̾�Ʈ ��ũ����";
        try {
        	String text = URLEncoder.encode(contentSetting.getTastyKeyword(), "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/local?query="+ text; // json ���
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
            }
            br.close();
            System.out.println(response.toString());
        } catch (Exception e) {
            System.out.println(e);
        }
	}
}
