package com.tmmmi.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/weather/*")
public class WeatherController {
	
	public WeatherController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@ResponseBody
	@RequestMapping(value="getWeather" )
	public JSONObject getWeather() throws Exception{
		System.out.println("/weather/getWeather : GET/POST");
		
		URL url; //URL 주소 객체
        URLConnection connection; //URL접속을 가지는 객체
        InputStream is; //URL접속에서 내용을 읽기 위한 Stream
        InputStreamReader isr;
        BufferedReader br;
        String city = "Seoul"; //기본값은 서울로 
	
         //URL객체를 생성, 해당 URL로 접속
         url = new  URL("http://api.openweathermap.org/data/2.5/weather?q="+city+"&units=metric&APPID=9375e1f400fff57aed0637c39dced0cb");
         connection = url.openConnection();
         //내용을 읽어오기위한 InputStream객체를 생성
         is = connection.getInputStream();
         isr = new InputStreamReader(is);
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
            
         System.out.println("전체 json값: "+json);	
         /*
         lon:경도, lat:위도 
         weather/ id:날씨상태 ID, main:날씨, description:기상조건, icon:날씨 아이콘ID
         base
         main/ temp:온도, pressure:대기압hPa, humidity:습도%
         wind/ speed:바람세기, deg:바람방향
         clouds/ all:흐림%
         name/ 도시 이름
         */
           
        JSONParser parser=new JSONParser();
        JSONObject jsonResult = (JSONObject)(JSONObject)parser.parse(json);
        System.out.println(jsonResult);
        
        /*  JSONObject temp1=(JSONObject)parser.parse(json);
          // 키가 “main”인 값이 다시 JSON 오브젝트이고 해당 오브젝트의 “temp” 키 출력
          JSONObject temp2=(JSONObject)temp1.get("main");
          System.out.println("온도관련쪽 파싱됐을까? : " +temp2);*/
			
		return jsonResult;
	}


	
}
