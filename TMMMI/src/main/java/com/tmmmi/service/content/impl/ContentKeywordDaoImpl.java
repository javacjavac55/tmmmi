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
import org.springframework.stereotype.Repository;

import com.tmmmi.service.domain.ContentSetting;
import com.tmmmi.service.domain.ContentShopping;
import com.tmmmi.service.domain.ContentUserKeyword;

@Repository("contentKeywordDaoImpl")
public class ContentKeywordDaoImpl extends ContentDaoAdaptor {
	
	///Constructor
	public ContentKeywordDaoImpl() {
		System.out.println(this.getClass());
    }
	
	public List<Object> getKeywordFirst(ContentSetting contentSetting, int index){
		
		StringBuilder sb;
	    String clientId = "8UnBF2q3kdzG36xN7kVj";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "LJxxFFhxEN";//애플리케이션 클라이언트 시크릿값";
	    int display =  8; //화면에 보여줄 개수
        String userKeyword = contentSetting.getUserSearch1(); //사용자에게 받아온 키워드
        List<Object> result = new ArrayList<Object>();
        
        try {
	        /*String text = URLEncoder.encode("\""+contentSetting.getUserSearch1()+"|"+contentSetting.getUserSearch2()+"|"+contentSetting.getUserSearch3()+"\"", "UTF-8");*/
        	String text = URLEncoder.encode(userKeyword, "UTF-8");
	        String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text+"&display="+display;// json 결과
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
	        
	        String json = "";
            json = sb.toString();
            
            JSONParser parser=new JSONParser();
            JSONObject items =(JSONObject)parser.parse(json); //json데이터중 item[ ] 빼오기
            JSONArray arr = (JSONArray)items.get("items"); //array 필요
          
            for(int i =0; i<arr.size() ; i++) {
            	JSONObject tmp = (JSONObject)arr.get(i);
            	
            	String title = (String)tmp.get("title"); //제목
            	String link = (String)tmp.get("link"); //링크
            	String description = (String)tmp.get("description");//내용
            	
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
	
	public List<Object> getContentShoppingReviewList(ContentSetting contentSetting, int index) throws Exception {
		
		String apiKey = "AIzaSyBLiKbxA8GhogX362LoIoNnCaVmIvesAFU"; //api key
		String userVideo = contentSetting.getUserVideo1();
		System.out.println(userVideo);
		String q = URLEncoder.encode(userVideo, "UTF-8"); //검색할 키워드
		String maxResults = "8"; //가져올 동영상 수
		String order = "date"; //rating랭킹순으로 
												//date 최신순으로
		
		List<Object> result =new ArrayList<Object>();
	
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
	        JSONObject items =(JSONObject)parser.parse(json); //json데이터중 item[ ] 빼오기
	        JSONArray arr = (JSONArray)items.get("items"); //array 필요
	       System.out.println(arr);
	        
	        for(int i =0; i<arr.size() ; i++) {
            	JSONObject tmp = (JSONObject)arr.get(i);
	        	
            	JSONObject snippet = (JSONObject)tmp.get("snippet");
	        	String title = (String)snippet.get("title"); //제목
	        	String description = (String)snippet.get("description"); //설명
	        	String channelTitle = (String)snippet.get("channelTitle"); //채널이름
	        	
	        	//이미지 안씀 (시무룩ㅠ_ㅠ)
	        	//JSONObject high = (JSONObject) ((JSONObject) (snippet.get("thumbnails"))).get("high");
	        	//String image = (String)high.get("url"); //썸네일
   	
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
            	result.add(contentUserKeyword);
            	contentUserKeyword.setKeywordVideoId("http://www.youtube.com/embed/"+videoId);
	        	result.add(contentUserKeyword);
	        
	        }
		}catch (Exception e) {
			System.out.println(e);
	    }
			return result;
	}
}
