package com.tmmmi.service.content.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Repository;

import com.tmmmi.service.domain.ContentSetting;
import com.tmmmi.service.domain.ContentUserKeyword;

@Repository("contentKeywordDaoImpl")
public class ContentKeywordDaoImpl extends ContentDaoAdaptor {
	
	///Constructor
	public ContentKeywordDaoImpl() {
		System.out.println(this.getClass());
    }
	
	public List<ContentUserKeyword> getContentUserKeywordFirstList(ContentSetting contentSetting, int index){
		
		StringBuilder sb;
	    String clientId = "8UnBF2q3kdzG36xN7kVj";
	    String clientSecret = "LJxxFFhxEN";
	    int display =  8;
        String userKeyword = contentSetting.getUserSearch1();
        System.out.println(userKeyword);
        List<ContentUserKeyword> result = new ArrayList<ContentUserKeyword>();
        
        try {
	        /*String text = URLEncoder.encode("\""+contentSetting.getUserSearch1()+"|"+contentSetting.getUserSearch2()+"|"+contentSetting.getUserSearch3()+"\"", "UTF-8");*/
        	String text = URLEncoder.encode(userKeyword, "UTF-8");
	        String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text+"&display="+display;// json ���
	        URL url = new URL(apiURL);
	        HttpURLConnection con = (HttpURLConnection)url.openConnection();
	        con.setRequestMethod("GET");
	        con.setRequestProperty("X-Naver-Client-Id", clientId);
	        con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	        int responseCode = con.getResponseCode();
	        BufferedReader br;
	        if(responseCode==200) { // ���� ȣ��
	            br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
	            //userKeyword.add(br);
	        } else {  // ���� �߻�
	        	br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
	        }
            sb = new StringBuilder();
            String line;
 
            while ((line = br.readLine()) != null) {
                sb.append(line + "\n");
	        }
	        br.close();
	        con.disconnect();
	        
	        String json = "";
            json = sb.toString();
            
            JSONParser parser=new JSONParser();
            JSONObject items =(JSONObject)parser.parse(json); //json�������� item[ ] ������
            JSONArray arr = (JSONArray)items.get("items"); //array �ʿ�
            System.out.println(arr);
            for(int i =0; i<arr.size() ; i++) {
            	JSONObject tmp = (JSONObject)arr.get(i);
            	
            	String title = (String)tmp.get("title"); //����
            	String link = (String)tmp.get("link"); //��ũ
            	String description = (String)tmp.get("description");//����
            	
            	ContentUserKeyword contentUserKeyword = new ContentUserKeyword();
            	contentUserKeyword.setKeywordTitle(title);
            	contentUserKeyword.setKeywordLink(link.replaceAll("amp;", ""));
            	System.out.println(link.replaceAll("amp;", ""));
            	Document doc = Jsoup.connect(link.replaceAll("amp;", "")).header("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36").get();
            	System.out.println("iframe : "+doc.select("iframe").size());
            	System.out.println("iframe 링크 :http://blog.naver.com/"+doc.select("iframe").attr("src"));
            	Document docFrame = Jsoup.connect("http://blog.naver.com/"+doc.select("iframe").attr("src")).header("User-Referer", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36").get();
            	System.out.println("iframe tbody : " +docFrame.select("#printPost1").size());
            	
            	if(docFrame.select("#printPost1").select("img").size() == 1) {
            		System.out.println("이미지가 없습니다");
            		
            	}else {
            		System.out.println("야호");
            		int count = (int)Math.abs(docFrame.select("#printPost1").select("img").size()/2);
            		System.out.println("iframe image : " +docFrame.select("#printPost1").select("img").get(count-1).attr("src"));
            		contentUserKeyword.setKeywordVideo(docFrame.select("#printPost1").select("img").get(count-1).attr("src"));
            	}
            	contentUserKeyword.setKeywordDescription(description);
            	result.add(contentUserKeyword);
            }
	        
	    } catch (Exception e) {
	        System.out.println(e);
	    }
		
		return result;
	}
	
	public List<ContentUserKeyword> getContentUserKeywordSecondList(ContentSetting contentSetting, int index){
		
		StringBuilder sb;
	    String clientId = "8UnBF2q3kdzG36xN7kVj";
	    String clientSecret = "LJxxFFhxEN";
	    int display =  8;
        String userKeyword = contentSetting.getUserSearch1();
        System.out.println(userKeyword);
        List<ContentUserKeyword> result = new ArrayList<ContentUserKeyword>();
        
        try {
	        /*String text = URLEncoder.encode("\""+contentSetting.getUserSearch1()+"|"+contentSetting.getUserSearch2()+"|"+contentSetting.getUserSearch3()+"\"", "UTF-8");*/
        	String text = URLEncoder.encode(userKeyword, "UTF-8");
	        String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text+"&display="+display;// json ���
	        URL url = new URL(apiURL);
	        HttpURLConnection con = (HttpURLConnection)url.openConnection();
	        con.setRequestMethod("GET");
	        con.setRequestProperty("X-Naver-Client-Id", clientId);
	        con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	        int responseCode = con.getResponseCode();
	        BufferedReader br;
	        if(responseCode==200) { // ���� ȣ��
	            br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
	            //userKeyword.add(br);
	        } else {  // ���� �߻�
	        	br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
	        }
            sb = new StringBuilder();
            String line;
 
            while ((line = br.readLine()) != null) {
                sb.append(line + "\n");
	        }
	        br.close();
	        con.disconnect();
	        
	        String json = "";
            json = sb.toString();
            
            JSONParser parser=new JSONParser();
            JSONObject items =(JSONObject)parser.parse(json); //json�������� item[ ] ������
            JSONArray arr = (JSONArray)items.get("items"); //array �ʿ�
            System.out.println(arr);
            for(int i =0; i<arr.size() ; i++) {
            	JSONObject tmp = (JSONObject)arr.get(i);
            	
            	String title = (String)tmp.get("title"); //����
            	String link = (String)tmp.get("link"); //��ũ
            	String description = (String)tmp.get("description");//����
            	
            	ContentUserKeyword contentUserKeyword = new ContentUserKeyword();
            	contentUserKeyword.setKeywordTitle(title);
            	contentUserKeyword.setKeywordLink(link);
            	contentUserKeyword.setKeywordDescription(description);
            	result.add(contentUserKeyword);
            }
	        
	    } catch (Exception e) {
	        System.out.println(e);
	    }
		
		return result;
	}
	
	public List<ContentUserKeyword> getContentUserKeywordThirdList(ContentSetting contentSetting, int index){
		
		StringBuilder sb;
	    String clientId = "8UnBF2q3kdzG36xN7kVj";
	    String clientSecret = "LJxxFFhxEN";
	    int display =  8;
        String userKeyword = contentSetting.getUserSearch1();
        System.out.println(userKeyword);
        List<ContentUserKeyword> result = new ArrayList<ContentUserKeyword>();
        
        try {
	        /*String text = URLEncoder.encode("\""+contentSetting.getUserSearch1()+"|"+contentSetting.getUserSearch2()+"|"+contentSetting.getUserSearch3()+"\"", "UTF-8");*/
        	String text = URLEncoder.encode(userKeyword, "UTF-8");
	        String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text+"&display="+display;// json ���
	        URL url = new URL(apiURL);
	        HttpURLConnection con = (HttpURLConnection)url.openConnection();
	        con.setRequestMethod("GET");
	        con.setRequestProperty("X-Naver-Client-Id", clientId);
	        con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	        int responseCode = con.getResponseCode();
	        BufferedReader br;
	        if(responseCode==200) { // ���� ȣ��
	            br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
	            //userKeyword.add(br);
	        } else {  // ���� �߻�
	        	br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
	        }
            sb = new StringBuilder();
            String line;
 
            while ((line = br.readLine()) != null) {
                sb.append(line + "\n");
	        }
	        br.close();
	        con.disconnect();
	        
	        String json = "";
            json = sb.toString();
            
            JSONParser parser=new JSONParser();
            JSONObject items =(JSONObject)parser.parse(json); //json�������� item[ ] ������
            JSONArray arr = (JSONArray)items.get("items"); //array �ʿ�
            System.out.println(arr);
            for(int i =0; i<arr.size() ; i++) {
            	JSONObject tmp = (JSONObject)arr.get(i);
            	
            	String title = (String)tmp.get("title"); //����
            	String link = (String)tmp.get("link"); //��ũ
            	String description = (String)tmp.get("description");//����
            	
            	ContentUserKeyword contentUserKeyword = new ContentUserKeyword();
            	contentUserKeyword.setKeywordTitle(title);
            	contentUserKeyword.setKeywordLink(link);
            	contentUserKeyword.setKeywordDescription(description);
            	result.add(contentUserKeyword);
            }
	        
	    } catch (Exception e) {
	        System.out.println(e);
	    }
		
		return result;
	}
	
	public List<ContentUserKeyword> getContentUserKeywordVideoFirstList(ContentSetting contentSetting, int index) throws Exception {
		
		String apiKey = "AIzaSyBLiKbxA8GhogX362LoIoNnCaVmIvesAFU";
		String userVideo = contentSetting.getUserVideo1();
		System.out.println(userVideo);
		String q = URLEncoder.encode(userVideo, "UTF-8");
		String maxResults = "8";
		String order = "date";
		
		List<ContentUserKeyword> result =new ArrayList<ContentUserKeyword>();
	
		try {
			String apiURL= "https://www.googleapis.com/youtube/v3/search?key="+apiKey+"&part=snippet&q="+q+
										"&maxResults="+maxResults;
			
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
			System.out.println(sb);
			
			String json = "";
	        json = sb.toString();
	        
	        JSONParser parser=new JSONParser();
	        JSONObject items =(JSONObject)parser.parse(json); //json�������� item[ ] ������
	        JSONArray arr = (JSONArray)items.get("items"); //array �ʿ�
	       System.out.println(arr);
	        
	        for(int i =0; i<arr.size() ; i++) {
            	JSONObject tmp = (JSONObject)arr.get(i);
	        	
            	JSONObject snippet = (JSONObject)tmp.get("snippet");
	        	String title = (String)snippet.get("title"); //����
	        	String description = (String)snippet.get("description"); //����
	        	String channelTitle = (String)snippet.get("channelTitle"); //ä���̸�
	        	
	        	//�̹��� �Ⱦ� (�ù����_��)
	        	//JSONObject high = (JSONObject) ((JSONObject) (snippet.get("thumbnails"))).get("high");
	        	//String image = (String)high.get("url"); //�����
   	
	        	String videoId = (String) ((JSONObject)tmp.get("id")).get("videoId");
	        	
	        	/*System.out.println(title);
	        	System.out.println(description);
	        	System.out.println(image);
	        	System.out.println(channelTitle);*/
	        	System.out.println(videoId);
	        	
	        	ContentUserKeyword contentUserKeyword = new ContentUserKeyword();
            	contentUserKeyword.setKeywordTitle(title);
            	contentUserKeyword.setKeywordVideo(channelTitle);
            	contentUserKeyword.setKeywordDescription(description);
            	contentUserKeyword.setKeywordVideoId("http://www.youtube.com/embed/"+videoId);
	        	result.add(contentUserKeyword);
	        
	        }
		}catch (Exception e) {
			System.out.println(e);
	    }
			return result;
	}
	
	public List<ContentUserKeyword> getContentUserKeywordVideoSecondList(ContentSetting contentSetting, int index) throws Exception {
		
		String apiKey = "AIzaSyBLiKbxA8GhogX362LoIoNnCaVmIvesAFU";
		String userVideo = contentSetting.getUserVideo1();
		System.out.println(userVideo);
		String q = URLEncoder.encode(userVideo, "UTF-8");
		String maxResults = "8";
		String order = "date";
		
		List<ContentUserKeyword> result =new ArrayList<ContentUserKeyword>();
	
		try {
			String apiURL= "https://www.googleapis.com/youtube/v3/search?key="+apiKey+"&part=snippet&q="+q+
										"&maxResults="+maxResults;
			
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
			System.out.println(sb);
			
			String json = "";
	        json = sb.toString();
	        
	        JSONParser parser=new JSONParser();
	        JSONObject items =(JSONObject)parser.parse(json); //json�������� item[ ] ������
	        JSONArray arr = (JSONArray)items.get("items"); //array �ʿ�
	       System.out.println(arr);
	        
	        for(int i =0; i<arr.size() ; i++) {
            	JSONObject tmp = (JSONObject)arr.get(i);
	        	
            	JSONObject snippet = (JSONObject)tmp.get("snippet");
	        	String title = (String)snippet.get("title"); //����
	        	String description = (String)snippet.get("description"); //����
	        	String channelTitle = (String)snippet.get("channelTitle"); //ä���̸�
	        	
	        	//�̹��� �Ⱦ� (�ù����_��)
	        	//JSONObject high = (JSONObject) ((JSONObject) (snippet.get("thumbnails"))).get("high");
	        	//String image = (String)high.get("url"); //�����
   	
	        	String videoId = (String) ((JSONObject)tmp.get("id")).get("videoId");
	        	
	        	/*System.out.println(title);
	        	System.out.println(description);
	        	System.out.println(image);
	        	System.out.println(channelTitle);*/
	        	System.out.println(videoId);
	        	
	        	ContentUserKeyword contentUserKeyword = new ContentUserKeyword();
            	contentUserKeyword.setKeywordTitle(title);
            	contentUserKeyword.setKeywordVideo(channelTitle);
            	contentUserKeyword.setKeywordDescription(description);
            	contentUserKeyword.setKeywordVideoId("http://www.youtube.com/embed/"+videoId);
	        	result.add(contentUserKeyword);
	        
	        }
		}catch (Exception e) {
			System.out.println(e);
	    }
			return result;
	}
}
