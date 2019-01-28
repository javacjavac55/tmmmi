package com.tmmmi.service.qna;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class YoutubeSearch {

	public static void main(String[] args) throws Exception {
		String apiKey = "AIzaSyBLiKbxA8GhogX362LoIoNnCaVmIvesAFU"; //api key
		String reviewKeyword = "����"; //����ڿ��� �޾ƿ� ���� Ű����
		String q = URLEncoder.encode(reviewKeyword+"�Ͽ�", "UTF-8"); //�˻��� Ű����
		String maxResults = "8"; //������ ������ ��
		String order = "rating"; //��ŷ������ 
												//date �ֽż�����
		
		/*List<Object> result =new ArrayList<Object>();*/
	
		try {
			String apiURL= "https://www.googleapis.com/youtube/v3/search?key="+apiKey+"&part=snippet&q="+q+
										"&maxResults="+maxResults+"&order="+order;
			
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			String line;
			StringBuffer sb = new StringBuffer();
			while( (line=br.readLine()) != null) {
				sb.append(line);
			}
			br.close();
			con.disconnect();
		/*	System.out.println(sb);
			System.out.println("��");*/
			
			String json = "";
	        json = sb.toString();
	        
	        JSONParser parser=new JSONParser();
	        JSONObject items =(JSONObject)parser.parse(json); //json�������� item[ ] ������
	        JSONArray arr = (JSONArray)items.get("items"); //array �ʿ�
	        System.out.println(arr);
	        
	        for(int i =0; i<5 ; i++) {
            	JSONObject tmp = (JSONObject)arr.get(i);
	        	
            	JSONObject snippet = (JSONObject)tmp.get("snippet");
	        	String title = (String)snippet.get("title"); //����
	        	String description = (String)snippet.get("description"); //����
	        	String channelTitle = (String)snippet.get("channelTitle"); //ä���̸�
	        	
	        	JSONObject high = (JSONObject) ((JSONObject) (snippet.get("thumbnails"))).get("high");
	        	String image = (String)high.get("url"); //�����
	        	
	        	String videoId = (String) ((JSONObject)tmp.get("id")).get("videoId");
	        	
	        	System.out.println(title);
	        	System.out.println(description);
	        	System.out.println(image);
	        	System.out.println(channelTitle);
	        	System.out.println(videoId);
	        }
			
			
		}catch (Exception e) {
			System.out.println(e);
	    }
	}
}
