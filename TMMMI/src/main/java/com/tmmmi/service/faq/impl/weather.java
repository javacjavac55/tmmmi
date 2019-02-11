package com.tmmmi.service.faq.impl;

import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.net.MalformedURLException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.IOException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class weather {

	public static void main(String[] args) throws Exception {
		URL url; //URL 주소 객체
        URLConnection connection; //URL접속을 가지는 객체
        InputStream is; //URL접속에서 내용을 읽기 위한 Stream
        InputStreamReader isr;
        BufferedReader br;
        String city = "서울"; //기본값은 서울로 

        String text = URLEncoder.encode(city, "UTF-8");
         //URL객체를 생성, 해당 URL로 접속
         url = new  URL("http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty?pageNo=1&numOfRows=10&"
         		+ "ServiceKey=gzJ78KxXzknVhzu8fVpuBWAQZSCxZ%2BJ2o7hmQpr9Y8XBIsW7OLyiJ32xuAxqKEYxpirljL%2BOgLRT8uOzsaaYbQ%3D%3D&ver=1.3&"
         		+ "_returnType=json&sidoName="+text);
         connection = url.openConnection();
         //내용을 읽어오기위한 InputStream객체를 생성
         is = connection.getInputStream();
         isr = new InputStreamReader(is,"UTF-8");
         br = new BufferedReader(isr);
             
         String result = null;
         String json=""; // JSON 결과를 String 생성
            
         while(true){
         	result = br.readLine();
         	if(result == null){
               	break;
            }
               json=result;  // JSON 결과 저장
         }
            
        System.out.println("미세먼지 json값: "+json);	

        JSONParser parser=new JSONParser();
        JSONObject jsonTemp = (JSONObject)parser.parse(json);
        /*int jsonResult = ((JSONArray) jsonTemp.get("list")).get("pm10Value");*/
        System.out.println("jsonResult: "+jsonTemp.get("list"));	
       /* System.out.println("jsonResult: "+jsonResult);	*/
		
		
    }
}