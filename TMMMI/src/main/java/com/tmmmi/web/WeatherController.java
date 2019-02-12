package com.tmmmi.web;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/weather/*")
public class WeatherController {
	
	public WeatherController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@ResponseBody
	@RequestMapping(value="getDust" )
	public String getDust(@RequestParam("city") String city) throws Exception{
		System.out.println("/weather/getDust : GET/POST");
		
		URL url; //URL 주소 객체
        URLConnection connection; //URL접속을 가지는 객체
        InputStream is; //URL접속에서 내용을 읽기 위한 Stream
        InputStreamReader isr;
        BufferedReader br;
        /*city = "서울"; //기본값은 서울로 */ 
       
        if(city.equals("Seoul")) {
        	city = "서울";
        }else  if(city.equals("Incheon")) {
        	city = "인천";
        } if(city.equals("Busan")) {
        	city = "부산";
        }if(city.equals("Gwangju")) {
        	city = "광주";
        }if(city.equals("Daejeon")) {
        	city = "대전";
        }
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
            
        //System.out.println("미세먼지 json값: "+json);	

        JSONParser parser=new JSONParser();
        JSONObject jsonTemp = (JSONObject)parser.parse(json);
        
        //결과값에서 list array만 빼낸다 (JSONObject로 캐스팅하면 여기서만되고 화면에서오류남)
        JSONArray temp = (JSONArray) jsonTemp.get("list");
        //list array에서 첫번째 배열 인덱스 0값 빼내기
        JSONObject listTemp = (JSONObject) temp.get(0);
        //필요한 pm10Value 빼내기
        String pm10Value = (String) listTemp.get("pm10Value");
        
		return pm10Value;
	}

	@ResponseBody
	@RequestMapping(value="getWeather" )
	public JSONObject getWeather(@RequestParam("city") String city) throws Exception{
		System.out.println("/weather/getWeather : GET/POST");
		
		URL url; //URL 주소 객체
        URLConnection connection; //URL접속을 가지는 객체
        InputStream is; //URL접속에서 내용을 읽기 위한 Stream
        InputStreamReader isr;
        BufferedReader br;
        //String city = "Seoul"; //기본값은 서울로 
	
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
            
         /*System.out.println("전체 json값: "+json);	*/
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
        JSONObject jsonResult = (JSONObject)parser.parse(json);
       /* System.out.println(jsonResult);*/
			
		return jsonResult;
	}
}
