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
		String reviewKeyword = "쇼핑"; //사용자에게 받아온 리뷰 키워드
		String q = URLEncoder.encode(reviewKeyword+"하울", "UTF-8"); //검색할 키워드
		String maxResults = "8"; //가져올 동영상 수
		String order = "rating"; //랭킹순으로 
												//date 최신순으로
		
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
			System.out.println("끝");*/
			
			String json = "";
	        json = sb.toString();
	        
	        JSONParser parser=new JSONParser();
	        JSONObject items =(JSONObject)parser.parse(json); //json데이터중 item[ ] 빼오기
	        JSONArray arr = (JSONArray)items.get("items"); //array 필요
	        System.out.println(arr);
	        
	        for(int i =0; i<5 ; i++) {
            	JSONObject tmp = (JSONObject)arr.get(i);
	        	
            	JSONObject snippet = (JSONObject)tmp.get("snippet");
	        	String title = (String)snippet.get("title"); //제목
	        	String description = (String)snippet.get("description"); //설명
	        	String channelTitle = (String)snippet.get("channelTitle"); //채널이름
	        	
	        	JSONObject high = (JSONObject) ((JSONObject) (snippet.get("thumbnails"))).get("high");
	        	String image = (String)high.get("url"); //썸네일
	        	
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
