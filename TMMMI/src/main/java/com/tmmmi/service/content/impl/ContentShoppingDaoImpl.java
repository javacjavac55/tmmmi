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
import com.tmmmi.service.domain.ContentSetting;
import com.tmmmi.service.domain.ContentShopping;

@Repository("contentShoppingDaoImpl")
public class ContentShoppingDaoImpl extends ContentDaoAdaptor {

	public ContentShoppingDaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	public List<ContentShopping> getContentShoppingFirstList(ContentSetting contentSetting, int index) throws Exception {
			StringBuffer sb;
			String clientId = "rHBsMd5Tu_WOFtXexEQz"; //클라이언트 아이디
	        String clientSecret = "95lxTYNVRV"; //클라이언트 시크릿
	        int display =  8; //화면에 보여줄 개수
	        int start = (index*display)+1;
	        String shoppingKeyword = contentSetting.getShoppingSearch1(); //사용자에게 받아온 키워드

	        List<ContentShopping> result =new ArrayList<ContentShopping>();
	    	        
	        try {
	        	String text = URLEncoder.encode(shoppingKeyword, "UTF-8");
	            String apiURL = "https://openapi.naver.com/v1/search/shop.json?query="+ text+"&display="+display+ "&start=" +start+"&sort=sim";// json 
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("X-Naver-Client-Id", clientId);
	            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { 
	                br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8")); //UTF-8 안붙이면 깨짐
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
	           /* System.out.println("json++++" +json);*/
	            
	            JSONParser parser=new JSONParser();
	            JSONObject items =(JSONObject)parser.parse(json); //json데이터중 item[ ] 빼오기
	            JSONArray arr = (JSONArray)items.get("items"); //array 필요
	          
	            for(int i =0; i<arr.size() ; i++) {
	            	JSONObject tmp = (JSONObject)arr.get(i);
	            	
	            	String title = (String)tmp.get("title"); //제목
	            	String link = (String)tmp.get("link"); //링크
	            	String lprice = (String)tmp.get("lprice"); //최저가
	            	String image = (String)tmp.get("image"); //이미지
	            	
	            	ContentShopping contentShopping = new ContentShopping();
	            	contentShopping.setShoppingTitle(title);
	            	contentShopping.setShoppingLink(link);
	            	contentShopping.setShoppingPrice(Integer.parseInt(lprice));
	            	contentShopping.setShoppingThumbnail(image);
	            	contentShopping.setShoppingKeyword(contentSetting.getShoppingSearch1());
	            	result.add(contentShopping);
	            }
	        } catch (Exception e) {
	            System.out.println(e);
	        }
			return result;
	    }
	
	public List<ContentShopping> getContentShoppingSecondList(ContentSetting contentSetting, int index) throws Exception {
		StringBuffer sb;
		String clientId = "rHBsMd5Tu_WOFtXexEQz"; //클라이언트 아이디
        String clientSecret = "95lxTYNVRV"; //클라이언트 시크릿
        int display =  8; //화면에 보여줄 개수
        int start = (index*display)+1;
        String shoppingKeyword = contentSetting.getShoppingSearch2(); //사용자에게 받아온 키워드
     
        
        List<ContentShopping> result =new ArrayList<ContentShopping>();
        
        try {
        	String text = URLEncoder.encode(shoppingKeyword, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/shop.json?query="+ text+"&display="+display+ "&start=" +start+"&sort=sim";// json
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { 
                br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8")); //UTF-8 안붙이면 깨짐
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
            //System.out.println("json++++" +json);
            
            JSONParser parser=new JSONParser();
            JSONObject items =(JSONObject)parser.parse(json); //json데이터중 item[ ] 빼오기
            JSONArray arr = (JSONArray)items.get("items"); //array 필요
          
            for(int i =0; i<arr.size() ; i++) {
            	JSONObject tmp = (JSONObject)arr.get(i);
            	
            	String title = (String)tmp.get("title"); //제목
            	String link = (String)tmp.get("link"); //링크
            	String lprice = (String)tmp.get("lprice"); //최저가
            	String image = (String)tmp.get("image"); //이미지
            	
            	ContentShopping contentShopping = new ContentShopping();
            	contentShopping.setShoppingTitle(title);
            	contentShopping.setShoppingLink(link);
            	contentShopping.setShoppingPrice(Integer.parseInt(lprice));
            	contentShopping.setShoppingThumbnail(image);
            	contentShopping.setShoppingKeyword(contentSetting.getShoppingSearch2());
            	result.add(contentShopping);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
		return result;
    }
	
	public List<ContentShopping> getContentShoppingThirdList(ContentSetting contentSetting, int index) throws Exception {
		StringBuffer sb;
		String clientId = "rHBsMd5Tu_WOFtXexEQz"; //클라이언트 아이디
        String clientSecret = "95lxTYNVRV"; //클라이언트 시크릿
        int display =  8; //화면에 보여줄 개수
        int start = (index*display)+1;
        String shoppingKeyword = contentSetting.getShoppingSearch3(); //사용자에게 받아온 키워드
        
        List<ContentShopping> result =new ArrayList<ContentShopping>();
        
        try {
        	String text = URLEncoder.encode(shoppingKeyword, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/shop.json?query="+ text+"&display="+display+ "&start=" +start+"&sort=sim";// json
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { 
                br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8")); //UTF-8 안붙이면 깨짐
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
            //System.out.println("json++++" +json);
            
            JSONParser parser=new JSONParser();
            JSONObject items =(JSONObject)parser.parse(json); //json데이터중 item[ ] 빼오기
            JSONArray arr = (JSONArray)items.get("items"); //array 필요
          
            for(int i =0; i<arr.size() ; i++) {
            	JSONObject tmp = (JSONObject)arr.get(i);
            	
            	String title = (String)tmp.get("title"); //제목
            	String link = (String)tmp.get("link"); //링크
            	String lprice = (String)tmp.get("lprice"); //최저가
            	String image = (String)tmp.get("image"); //이미지
            	
            	ContentShopping contentShopping = new ContentShopping();
            	contentShopping.setShoppingTitle(title);
            	contentShopping.setShoppingLink(link);
            	contentShopping.setShoppingPrice(Integer.parseInt(lprice));
            	contentShopping.setShoppingThumbnail(image);
            	contentShopping.setShoppingKeyword(contentSetting.getShoppingSearch3());
            	result.add(contentShopping);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
		return result;
    }
	
	public List<ContentShopping> getContentShoppingReviewList(ContentSetting contentSetting, int index,  String pageToken) throws Exception {
		
		String apiKey = "AIzaSyBLiKbxA8GhogX362LoIoNnCaVmIvesAFU"; //api key
		String reviewKeyword = contentSetting.getShoppingReview();
		String q = URLEncoder.encode(reviewKeyword+"하울", "UTF-8"); //검색할 키워드
		String maxResults = "8"; //가져올 동영상 수
		String nextPage = (pageToken != null && pageToken.length()>0)?("&pageToken="+pageToken):"";

		List<ContentShopping> result =new ArrayList<ContentShopping>();
	
		try {
			String apiURL= "https://www.googleapis.com/youtube/v3/search?key="+apiKey+"&part=snippet&maxResults="+maxResults
					+ nextPage
					+ "&q="+q+"&type=video";
			
			System.out.println(apiURL);
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
	        
	        System.out.println("json:" +json);
	        JSONParser parser=new JSONParser();
	        JSONObject items =(JSONObject)parser.parse(json); //json데이터중 item[ ] 빼오기
	        JSONArray arr = (JSONArray)items.get("items"); //array 필요
	        pageToken = (String)items.get("nextPageToken"); //다음페이지
	        System.out.println("pageToken: "+pageToken);
	        System.out.println(arr.size());
	        
	        for(int i =0; i<arr.size() ; i++) {
            	JSONObject tmp = (JSONObject)arr.get(i);
	        	
            	JSONObject snippet = (JSONObject)tmp.get("snippet");
	        	String title = (String)snippet.get("title"); //제목
	        	String description = (String)snippet.get("description"); //설명
	        	String channelTitle = (String)snippet.get("channelTitle"); //채널이름
	         	 	        	
	        	JSONObject high = (JSONObject) ((JSONObject) (snippet.get("thumbnails"))).get("high");
	        	String image = (String)high.get("url"); //썸네일
   	
	        	String videoId = (String) ((JSONObject)tmp.get("id")).get("videoId");
	        	
	        	/*System.out.println(title);
	        	System.out.println(description);
	        	System.out.println(image);
	        	System.out.println(channelTitle);
	        	System.out.println(videoId);*/
	        	
	        	ContentShopping contentShopping = new ContentShopping();
	        	contentShopping.setShoppingVideoTitle(title);
	        	contentShopping.setShoppingVideoDetail(description);
	        	contentShopping.setShoppingVideoChannel(channelTitle);
	        	contentShopping.setShoppingVideoThumbnail(image);
	        	contentShopping.setShoppingVideoId("<iframe width=\"600\" height=\"518\" src=\"http://www.youtube.com/embed/"+videoId+"\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>");
	        	contentShopping.setReviewNo(videoId);
	        	contentShopping.setShoppingVideoPageToken(pageToken);
	        	contentShopping.setShoppingKeyword(contentSetting.getShoppingReview());
	        	result.add(contentShopping);
	        }
		}catch (Exception e) {
			System.out.println(e);
	    }
			return result;
	    }
}