package com.tmmmi.service.user.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Repository;

import com.tmmmi.service.domain.User;

@Repository("naverDaoImpl")
public class NaverDaoImpl implements com.tmmmi.service.user.NaverDao {
	
	private final static String CLIENT_ID = "zEjZt96FPqQKNE4TIB04"; 
	private final static String CLIENT_SECRET = "p1bSCpqEI5";
	private final static String REDIRECT_URI = "http://192.168.0.53:8080/SNSLogin/naverLogin";
	private final static String SESSION_STATE = "oauth_state";
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	private final static String GET_TOKEN_API_URL = "https://nid.naver.com/oauth2.0/token";
	
	private JSONParser parser;

	
	public NaverDaoImpl() {
		this.parser = new JSONParser();
	}

	
	/* get AuthorizationUrl  Method */
	public String getAuthorizationUrl(HttpSession session){
		
		String state = generateRandomString();
		
		this.setSession(session, state);
		
		String url = "redirect:https://nid.naver.com/oauth2.0/authorize?response_type=code"
				+"&client_id="+this.CLIENT_ID
				+"&redirect_uri="+this.REDIRECT_URI
				+"&state="+state;
		
		System.out.println("getAuthorizationUrl :: "+url);
		
		return url;
	}
	
	/* getAccessToken Method */
	public User getAccessToken(HttpSession session, String code, String state) throws Exception{
		
		String sessionState = getSession(session);
		System.out.println("sessionState : "+sessionState);
		if(sessionState.equals(state)){
			
			String naverURL = GET_TOKEN_API_URL+"?grant_type=authorization_code&client_id="+CLIENT_ID
					+"&client_secret="+CLIENT_SECRET+"&code="+code;
			
			URL url = new URL(naverURL);
	        HttpURLConnection con = (HttpURLConnection)url.openConnection();
	        con.setRequestMethod("GET");
	        
	        // Response Code GET
	        BufferedReader br = null;
	        
	        System.out.println("response code : "+con.getResponseCode());
	        if(con.getResponseCode() == 200) {
	            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	        } else {  
	            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	        }
        	
	         String jsonData = "";
            StringBuffer response = new StringBuffer();
            
            while ((jsonData = br.readLine()) != null) {
                response.append(jsonData);
            }
            
            br.close();
            
            System.out.println("naver return json :: "+ response.toString());
            JSONObject obj = (JSONObject)parser.parse(response.toString());
            
            User user = new User();
            user.setRefreshToken(obj.get("refresh_token").toString());
            user.setAccessToken(obj.get("access_token").toString());
            
            session.setAttribute("user", user);
			System.out.println("끝");
            return user;
		}
		return null;
	}
	
	/* getUserProfile */
	public User getUserProfile(User user) throws Exception {

		URL url = new URL(PROFILE_API_URL);
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        
        con.setRequestMethod("GET");
        con.setRequestProperty("Authorization", "Bearer "+user.getAccessToken());
        
        // Response Code GET
        BufferedReader br = null;
        
        if(con.getResponseCode() == 200) {
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else { 
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
    	
        
        String jsonData = "";
        StringBuffer response = new StringBuffer();
        
        while ((jsonData = br.readLine()) != null) {
            response.append(jsonData);
        }
        
        br.close();
        
        System.out.println("naver response :: "+ response.toString());
        JSONObject obj = (JSONObject)parser.parse(response.toString());
        System.out.println("naver에서 받은 값 : "+obj);
        JSONObject userInfo = (JSONObject)obj.get("response");
        System.out.println(userInfo.get("email").toString());
        user.setEmail(userInfo.get("email").toString());
        user.setUserName(userInfo.get("nickname").toString());
        user.setUserId(userInfo.get("id").toString());
        user.setSnsName(1);//naver
        
		return user;
	}
	
	/* generateRandomString */
	public  String generateRandomString() {
		return UUID.randomUUID().toString();
	}
	
	/* http session set */
	private void setSession(HttpSession session,String state){
		session.setAttribute(SESSION_STATE, state);	
	}

	/* http session get */
	private String getSession(HttpSession session){
		return (String) session.getAttribute(SESSION_STATE);
	}

}
