package com.tmmmi.service.user.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Repository;

import com.tmmmi.service.domain.User;
import com.tmmmi.service.user.KakaoDao;


@Repository("kakaoDaoImpl")
public class KakaoDaoImpl implements KakaoDao {

	private final static String APP_KEY = "4c6c41eaac6299de2468a88670ee6e05";
	private final static String REDIRECT_URI = "http://127.0.0.1:8080/SNSLogin/kakaoLogin";
	private final static String SESSION_STATE = "oauth_state";
	private final static String GET_TOKEN_API_URL = "https://kauth.kakao.com/oauth/token";
	private final static String PROFILE_API_URL = "https://kapi.kakao.com/v2/user/me";
	
	JSONParser parser;
	
	public KakaoDaoImpl() {
		this.parser = new JSONParser();
	}
	
	@Override
	public String getAuthorizationUrl(HttpSession session) {

		String state = generateRandomString();

		this.setSession(session, state);

		String scope = "redirect:https://kauth.kakao.com/oauth/authorize?client_id=" + APP_KEY + "&redirect_uri=" + REDIRECT_URI
				+ "&response_type=code";

		return scope;
	}

	@Override
	public User getAccessToken(HttpSession session, String code) throws Exception {
		System.out.println("getAccessToken(String code, User user)");
		
		String param = GET_TOKEN_API_URL+"&grant_type=authorization_code&client_id="+APP_KEY+"&redirect_uri="+REDIRECT_URI+"&code="+code;
		
		URL url = new URL(GET_TOKEN_API_URL);
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        
        con.setRequestMethod("POST");
        con.setDoOutput(true);
        con.setDoInput(true);
        con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		
        OutputStream os = con.getOutputStream();
        
        os.write(param.getBytes());
        os.flush();
        os.close();
        
        int responseCode = con.getResponseCode();
        
        BufferedReader br = null;
        
        if(responseCode==200) { 
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
        
        System.out.println("받아오는 값 : "+response.toString());
        JSONObject obj = (JSONObject)parser.parse(response.toString());
        System.out.println(obj);
        System.out.println("access_token : "+ obj.get("access_token"));

        User user = new User();
        user.setAccessToken(obj.get("access_token").toString());
        //user.setRefreshToken(obj.get("refresh_token").toString());
        
		return user;

	}

	@Override
	public User getUserProfile(User user) throws Exception {
		
		System.out.println("getUserProfile 시작");
		
		URL url = new URL(PROFILE_API_URL);
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        
        con.setRequestMethod("GET");
        con.setRequestProperty("Authorization", "Bearer "+user.getAccessToken());
        
        // Response Code        
        BufferedReader br = null;
        
        if(con.getResponseCode()==200) { 
            br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
        } else { 
            br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
        }
        
        //JSON Data
        String jsonData = "";
        StringBuffer response = new StringBuffer();
        
        while ((jsonData = br.readLine()) != null) {
            response.append(jsonData);
        }
        
        br.close();
        
        // Console Ȯ��
        System.out.println("response : "+ response.toString());
        JSONObject obj = (JSONObject)parser.parse(response.toString());
        
        user.setUserId(obj.get("id").toString());
        user.setEmailCheck(0);
        user.setEmail("kakao");
        user.setSnsName(3);//kakao!
        
		System.out.println("Kakao DAOImpl getUserProfile ====>"+user);
		return user;
	}

	private void setSession(HttpSession session, String state) {
		session.setAttribute(SESSION_STATE, state);

	}

	private String generateRandomString() {
		// TODO Auto-generated method stub
		return UUID.randomUUID().toString();
	}

}
