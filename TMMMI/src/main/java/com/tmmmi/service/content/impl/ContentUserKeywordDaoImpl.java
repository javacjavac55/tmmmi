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
public class ContentUserKeywordDaoImpl extends ContentDaoAdaptor {
	
	///Constructor
	public ContentUserKeywordDaoImpl() {
		System.out.println(this.getClass());
    }
	
	public List<ContentUserKeyword> getContentUserKeywordFirstList(ContentSetting contentSetting, int index){
		
		StringBuilder sb;
	    String clientId = "8UnBF2q3kdzG36xN7kVj";
	    String clientSecret = "LJxxFFhxEN";
	    int display =  8;
	    int start = (index*8)+1;
        String userKeyword = contentSetting.getUserSearch1();
        System.out.println("index : "+index);
        List<ContentUserKeyword> result = new ArrayList<ContentUserKeyword>();
        
        try {
        	if(start==0) {
        		start = 1;
        	}
        	System.out.println(start);
	        /*String text = URLEncoder.encode("\""+contentSetting.getUserSearch1()+"|"+contentSetting.getUserSearch2()+"|"+contentSetting.getUserSearch3()+"\"", "UTF-8");*/
        	String text = URLEncoder.encode(userKeyword, "UTF-8");
	        String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text+"&display="+display+"&start="+start+"&sort=date";// json 占쏙옙占�
	        URL url = new URL(apiURL);
	        HttpURLConnection con = (HttpURLConnection)url.openConnection();
	        con.setRequestMethod("GET");
	        con.setRequestProperty("X-Naver-Client-Id", clientId);
	        con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	        int responseCode = con.getResponseCode();
	        BufferedReader br;
	        if(responseCode==200) { // 占쏙옙占쏙옙 호占쏙옙
	            br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
	            //userKeyword.add(br);
	        } else {  // 占쏙옙占쏙옙 占쌩삼옙
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
            JSONObject items =(JSONObject)parser.parse(json); //json占쏙옙占쏙옙占쏙옙占쏙옙 item[ ] 占쏙옙占쏙옙占쏙옙
            JSONArray arr = (JSONArray)items.get("items"); //array 占십울옙
            System.out.println(arr);
            for(int i =0; i<arr.size() ; i++) {
            	JSONObject tmp = (JSONObject)arr.get(i);
            	
            	String title = (String)tmp.get("title"); //占쏙옙占쏙옙
            	String link = (String)tmp.get("link"); //占쏙옙크
            	String description = (String)tmp.get("description");//占쏙옙占쏙옙
            	
            	ContentUserKeyword contentUserKeyword = new ContentUserKeyword();
            	contentUserKeyword.setKeywordTitle(title);
            	contentUserKeyword.setKeywordLink(link.replaceAll("amp;", ""));
            	/*System.out.println(link.replaceAll("amp;", ""));*/
            	Document doc = Jsoup.connect(link.replaceAll("amp;", "")).header("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36")
            															 .header("Referer", "https://www.naver.com").get();
            	
            	/*System.out.println("iframe : "+doc.select("iframe").size());
            	System.out.println("iframe 留곹겕 :http://blog.naver.com/"+doc.select("iframe").attr("src"));*/
            	Document docFrame = Jsoup.connect("http://blog.naver.com/"+doc.select("iframe").attr("src")).header("User-Referer", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36")
            																								.header("Referer", "https://www.naver.com").get();
            	/*System.out.println("iframe tbody : " +docFrame.select("#printPost1").size());*/
            	
            	if(docFrame.select("#printPost1").select("img").size() == 1) {
            		System.out.println("�씠誘몄�媛� �뾾�뒿�땲�떎");
            	}else {
            		int count = (int)Math.abs(docFrame.select("#printPost1").select("img").size()/2);
            		contentUserKeyword.setKeywordVideo(docFrame.select("#printPost1").select("img").get(count-1).attr("src"));
            	}
            	
            	if(description != null) {
            		contentUserKeyword.setKeywordDescription(description);
            		contentUserKeyword.setKeyword(userKeyword);
            		contentUserKeyword.setKeywordNextToken(contentSetting.getUserSearch1());
                	result.add(contentUserKeyword);
            	}else {
            		System.out.println("�빞�샇");
            	}
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
	    int start = (index*8)+1;
        String userKeyword = contentSetting.getUserSearch2();
        System.out.println(userKeyword);
        List<ContentUserKeyword> result = new ArrayList<ContentUserKeyword>();
        
        try {
        	if(start==0) {
        		start = 1;
        	}
        	System.out.println(start);
	        /*String text = URLEncoder.encode("\""+contentSetting.getUserSearch1()+"|"+contentSetting.getUserSearch2()+"|"+contentSetting.getUserSearch3()+"\"", "UTF-8");*/
        	String text = URLEncoder.encode(userKeyword, "UTF-8");
	        String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text+"&display="+display+"&start="+start+"&sort=date";// json 占쏙옙占�
	        URL url = new URL(apiURL);
	        HttpURLConnection con = (HttpURLConnection)url.openConnection();
	        con.setRequestMethod("GET");
	        con.setRequestProperty("X-Naver-Client-Id", clientId);
	        con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	        int responseCode = con.getResponseCode();
	        BufferedReader br;
	        if(responseCode==200) { // 占쏙옙占쏙옙 호占쏙옙
	            br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
	            //userKeyword.add(br);
	        } else {  // 占쏙옙占쏙옙 占쌩삼옙
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
            JSONObject items =(JSONObject)parser.parse(json); //json占쏙옙占쏙옙占쏙옙占쏙옙 item[ ] 占쏙옙占쏙옙占쏙옙
            JSONArray arr = (JSONArray)items.get("items"); //array 占십울옙
            System.out.println(arr);
            for(int i =0; i<arr.size() ; i++) {
            	JSONObject tmp = (JSONObject)arr.get(i);
            	
            	String title = (String)tmp.get("title"); //占쏙옙占쏙옙
            	String link = (String)tmp.get("link"); //占쏙옙크
            	String description = (String)tmp.get("description");//占쏙옙占쏙옙
            	
            	ContentUserKeyword contentUserKeyword = new ContentUserKeyword();
            	contentUserKeyword.setKeywordTitle(title);
            	contentUserKeyword.setKeywordLink(link.replaceAll("amp;", ""));
            	/*System.out.println(link.replaceAll("amp;", ""));*/
            	Document doc = Jsoup.connect(link.replaceAll("amp;", "")).header("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36")
            															 .header("Referer", "https://www.naver.com").get();
            	
            	/*System.out.println("iframe : "+doc.select("iframe").size());
            	System.out.println("iframe 留곹겕 :http://blog.naver.com/"+doc.select("iframe").attr("src"));*/
            	Document docFrame = Jsoup.connect("http://blog.naver.com/"+doc.select("iframe").attr("src")).header("User-Referer", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36")
            																								.header("Referer", "https://www.naver.com").get();
            	/*System.out.println("iframe tbody : " +docFrame.select("#printPost1").size());*/
            	
            	if(docFrame.select("#printPost1").select("img").size() == 1) {
            		System.out.println("�씠誘몄�媛� �뾾�뒿�땲�떎");
            	}else {
            		int count = (int)Math.abs(docFrame.select("#printPost1").select("img").size()/2);
            		/*System.out.println("iframe image : " +docFrame.select("#printPost1").select("img").get(count-1).attr("src"));*/
            		contentUserKeyword.setKeywordVideo(docFrame.select("#printPost1").select("img").get(count-1).attr("src"));
            	}
            	contentUserKeyword.setKeywordDescription(description);
            	contentUserKeyword.setKeyword(userKeyword);
            	contentUserKeyword.setKeywordNextToken(contentSetting.getUserSearch2());
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
	    int start = (index*8)+1;
        String userKeyword = contentSetting.getUserSearch3();
        System.out.println("index : "+index);
        List<ContentUserKeyword> result = new ArrayList<ContentUserKeyword>();
        
        try {
        	if(start==0) {
        		start = 1;
        	}
        	System.out.println(start);
	        /*String text = URLEncoder.encode("\""+contentSetting.getUserSearch1()+"|"+contentSetting.getUserSearch2()+"|"+contentSetting.getUserSearch3()+"\"", "UTF-8");*/
        	String text = URLEncoder.encode(userKeyword, "UTF-8");
	        String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text+"&display="+display+"&start="+start+"&sort=date";// json 占쏙옙占�
	        URL url = new URL(apiURL);
	        HttpURLConnection con = (HttpURLConnection)url.openConnection();
	        con.setRequestMethod("GET");
	        con.setRequestProperty("X-Naver-Client-Id", clientId);
	        con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	        int responseCode = con.getResponseCode();
	        BufferedReader br;
	        if(responseCode==200) { // 占쏙옙占쏙옙 호占쏙옙
	            br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
	            //userKeyword.add(br);
	        } else {  // 占쏙옙占쏙옙 占쌩삼옙
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
            JSONObject items =(JSONObject)parser.parse(json); //json占쏙옙占쏙옙占쏙옙占쏙옙 item[ ] 占쏙옙占쏙옙占쏙옙
            JSONArray arr = (JSONArray)items.get("items"); //array 占십울옙
            System.out.println(arr);
            for(int i =0; i<arr.size() ; i++) {
            	JSONObject tmp = (JSONObject)arr.get(i);
            	
            	String title = (String)tmp.get("title"); //占쏙옙占쏙옙
            	String link = (String)tmp.get("link"); //占쏙옙크
            	String description = (String)tmp.get("description");//占쏙옙占쏙옙
            	
            	ContentUserKeyword contentUserKeyword = new ContentUserKeyword();
            	contentUserKeyword.setKeywordTitle(title);
            	contentUserKeyword.setKeywordLink((link.replaceAll("amp;", "")).replaceAll("&amp;", ""));
            	/*System.out.println(link.replaceAll("amp;", ""));*/
            	Document doc = Jsoup.connect(link.replaceAll("amp;", "")).header("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36")
            															 .header("Referer", "https://www.naver.com").get();
            	
            	/*System.out.println("iframe : "+doc.select("iframe").size());
            	System.out.println("iframe 留곹겕 :http://blog.naver.com/"+doc.select("iframe").attr("src"));*/
            	Document docFrame = Jsoup.connect("http://blog.naver.com/"+doc.select("iframe").attr("src")).header("User-Referer", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36")
            																								.header("Referer", "https://www.naver.com").get();
            	/*System.out.println("iframe tbody : " +docFrame.select("#printPost1").size());*/
            	
            	if(docFrame.select("#printPost1").select("img").size() == 1) {
            		System.out.println("�씠誘몄�媛� �뾾�뒿�땲�떎");
            		
            	}else {
            		int count = (int)Math.abs(docFrame.select("#printPost1").select("img").size()/2);
            		/*System.out.println("iframe image : " +docFrame.select("#printPost1").select("img").get(count-1).attr("src"));*/
            		contentUserKeyword.setKeywordVideo(docFrame.select("#printPost1").select("img").get(count-1).attr("src"));
            	}
            	contentUserKeyword.setKeywordDescription(description);
            	contentUserKeyword.setKeyword(userKeyword);
            	contentUserKeyword.setKeywordNextToken(contentSetting.getUserSearch3());
            	result.add(contentUserKeyword);
            }
	        
	    } catch (Exception e) {
	        System.out.println(e);
	    }
		
		return result;
	}
	
	public List<ContentUserKeyword> getContentUserKeywordVideoFirstList(ContentSetting contentSetting, int index, String pageToken) throws Exception {
		
		String apiKey = "AIzaSyBLiKbxA8GhogX362LoIoNnCaVmIvesAFU";
		String userVideo = contentSetting.getUserVideo1();
		String q = URLEncoder.encode(userVideo, "UTF-8");
		String maxResults = "8";
		System.out.println("pageToken:"+pageToken);
		String nextPage = (pageToken != null && pageToken.length()>0)?("&pageToken="+pageToken):"";
		
		List<ContentUserKeyword> result =new ArrayList<ContentUserKeyword>();
	
		try {
			String apiURL= "https://www.googleapis.com/youtube/v3/search?key="+apiKey+"&part=snippet&maxResults="+maxResults
					+ nextPage
					+ "&q="+q+"&type=video";
			
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
			
			String json = "";
	        json = sb.toString();
	        
	        JSONParser parser=new JSONParser();
	        JSONObject items =(JSONObject)parser.parse(json); //json�뜲�씠�꽣以� item[ ] 鍮쇱삤湲�
	        JSONArray arr = (JSONArray)items.get("items"); //array �븘�슂
	        pageToken = (String)items.get("nextPageToken"); //�떎�쓬�럹�씠吏�
	        System.out.println("pageToken: "+pageToken);
	        System.out.println(arr.size());
	        
	        for(int i =0; i<arr.size() ; i++) {
	        	JSONObject tmp = (JSONObject)arr.get(i);
	        	
            	JSONObject snippet = (JSONObject)tmp.get("snippet");
	        	String title = (String)snippet.get("title"); //�젣紐�
	        	String description = (String)snippet.get("description"); //�꽕紐�
	        	String channelTitle = (String)snippet.get("channelTitle"); //梨꾨꼸�씠由�
	         	 	        	
	        	JSONObject high = (JSONObject) ((JSONObject) (snippet.get("thumbnails"))).get("high");
	        	String image = (String)high.get("url"); //�뜽�꽕�씪
   	
	        	String videoId = (String) ((JSONObject)tmp.get("id")).get("videoId");
	        	
	        	/*System.out.println(title);
	        	System.out.println(description);
	        	System.out.println(image);
	        	System.out.println(channelTitle);
	        	System.out.println(videoId);*/
	        	
	        	ContentUserKeyword contentUserKeyword = new ContentUserKeyword();
	        	contentUserKeyword.setReviewNo(videoId);
            	contentUserKeyword.setKeywordTitle(title);
            	contentUserKeyword.setKeywordVideo(channelTitle);
            	contentUserKeyword.setKeywordDescription(description);
            	contentUserKeyword.setKeywordVideoId("<iframe width=\"600\" height=\"518\" src=\"http://www.youtube.com/embed/"+videoId+"\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>");
	        	contentUserKeyword.setKeywordThumbnail(image);
	        	contentUserKeyword.setKeywordNextToken(pageToken);
	        	contentUserKeyword.setKeywordLink(contentSetting.getUserVideo1());
	        	contentUserKeyword.setKeyword(userVideo);
            	result.add(contentUserKeyword);
	        
	        }
		}catch (Exception e) {
			System.out.println(e);
	    }
			return result;
	}
	
	public List<ContentUserKeyword> getContentUserKeywordVideoSecondList(ContentSetting contentSetting, int index, String pageToken) throws Exception {
		
		String apiKey = "AIzaSyBLiKbxA8GhogX362LoIoNnCaVmIvesAFU";
		String userVideo = contentSetting.getUserVideo2();
		String q = URLEncoder.encode(userVideo, "UTF-8");
		String maxResults = "8";
		String nextPage = (pageToken != null && pageToken.length()>0)?("&pageToken="+pageToken):"";
		
		List<ContentUserKeyword> result =new ArrayList<ContentUserKeyword>();
	
		try {
			String apiURL= "https://www.googleapis.com/youtube/v3/search?key="+apiKey+"&part=snippet&maxResults="+maxResults
					+ nextPage
					+ "&q="+q+"&type=video";
			
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
			
			String json = "";
	        json = sb.toString();
	        
	        JSONParser parser=new JSONParser();
	        JSONObject items =(JSONObject)parser.parse(json); //json�뜲�씠�꽣以� item[ ] 鍮쇱삤湲�
	        JSONArray arr = (JSONArray)items.get("items"); //array �븘�슂
	        pageToken = (String)items.get("nextPageToken"); //�떎�쓬�럹�씠吏�
	        System.out.println("pageToken: "+pageToken);
	        System.out.println(arr.size());
	        
	        for(int i =0; i<arr.size() ; i++) {
	        	JSONObject tmp = (JSONObject)arr.get(i);
	        	
            	JSONObject snippet = (JSONObject)tmp.get("snippet");
	        	String title = (String)snippet.get("title"); //�젣紐�
	        	String description = (String)snippet.get("description"); //�꽕紐�
	        	String channelTitle = (String)snippet.get("channelTitle"); //梨꾨꼸�씠由�
	         	 	        	
	        	JSONObject high = (JSONObject) ((JSONObject) (snippet.get("thumbnails"))).get("high");
	        	String image = (String)high.get("url"); //�뜽�꽕�씪
   	
	        	String videoId = (String) ((JSONObject)tmp.get("id")).get("videoId");
	        	
	        	/*System.out.println(title);
	        	System.out.println(description);
	        	System.out.println(image);
	        	System.out.println(channelTitle);
	        	System.out.println(videoId);*/
	        	
	        	ContentUserKeyword contentUserKeyword = new ContentUserKeyword();
	        	contentUserKeyword.setReviewNo(videoId);
            	contentUserKeyword.setKeywordTitle(title);
            	contentUserKeyword.setKeywordVideo(channelTitle);
            	contentUserKeyword.setKeywordDescription(description);
            	contentUserKeyword.setKeywordVideoId("<iframe width=\"600\" height=\"518\" src=\"http://www.youtube.com/embed/"+videoId+"\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>");
	        	contentUserKeyword.setKeywordThumbnail(image);
	        	contentUserKeyword.setKeywordNextToken(pageToken);
	        	contentUserKeyword.setKeywordLink(contentSetting.getUserVideo2());
	        	contentUserKeyword.setKeyword(userVideo);
            	result.add(contentUserKeyword);
	        
	        }
		}catch (Exception e) {
			System.out.println(e);
	    }
			return result;
	}
}
