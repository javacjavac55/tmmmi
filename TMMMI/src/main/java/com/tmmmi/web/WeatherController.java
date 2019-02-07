package com.tmmmi.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
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
	@RequestMapping(value="getWeather" )
	public JSONObject getWeather(@RequestParam("city") String city) throws Exception{
		System.out.println("/weather/getWeather : GET/POST");
		
		URL url; //URL �ּ� ��ü
        URLConnection connection; //URL������ ������ ��ü
        InputStream is; //URL���ӿ��� ������ �б� ���� Stream
        InputStreamReader isr;
        BufferedReader br;
        //String city = "Seoul"; //�⺻���� ����� 
	
         //URL��ü�� ����, �ش� URL�� ����
         url = new  URL("http://api.openweathermap.org/data/2.5/weather?q="+city+"&units=metric&APPID=9375e1f400fff57aed0637c39dced0cb");
         connection = url.openConnection();
         //������ �о�������� InputStream��ü�� ����
         is = connection.getInputStream();
         isr = new InputStreamReader(is);
         br = new BufferedReader(isr);
             
         String result = null;
         String json=""; // JSON ����� String ����
            
         while(true){
         	result = br.readLine();
         	if(result == null){
               	break;
            }
               json=result;  // JSON ��� ����
         }
            
         System.out.println("��ü json��: "+json);	
         /*
         lon:�浵, lat:���� 
         weather/ id:�������� ID, main:����, description:�������, icon:���� ������ID
         base
         main/ temp:�µ�, pressure:����hPa, humidity:����%
         wind/ speed:�ٶ�����, deg:�ٶ�����
         clouds/ all:�帲%
         name/ ���� �̸�
         */
           
        JSONParser parser=new JSONParser();
        JSONObject jsonResult = (JSONObject)parser.parse(json);
        System.out.println(jsonResult);
			
		return jsonResult;
	}
	
	@ResponseBody
	@RequestMapping(value="getDust" )
	public JSONObject getDust(@RequestParam("city") String city) throws Exception{
		System.out.println("/weather/getDust : GET/POST");
		
		URL url; //URL �ּ� ��ü
        URLConnection connection; //URL������ ������ ��ü
        InputStream is; //URL���ӿ��� ������ �б� ���� Stream
        InputStreamReader isr;
        BufferedReader br;
        city = "����"; //�⺻���� ����� 
        
        if(city.equals("Seoul")) {
        	city = "����";
        }else  if(city.equals("Incheon")) {
        	city = "��õ";
        } if(city.equals("Busan")) {
        	city = "�λ�";
        }
        String text = URLEncoder.encode(city, "UTF-8");
         //URL��ü�� ����, �ش� URL�� ����
         url = new  URL("http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty?pageNo=1&numOfRows=10&"
         		+ "ServiceKey=gzJ78KxXzknVhzu8fVpuBWAQZSCxZ%2BJ2o7hmQpr9Y8XBIsW7OLyiJ32xuAxqKEYxpirljL%2BOgLRT8uOzsaaYbQ%3D%3D&ver=1.3&"
         		+ "_returnType=json&sidoName="+text);
         connection = url.openConnection();
         //������ �о�������� InputStream��ü�� ����
         is = connection.getInputStream();
         isr = new InputStreamReader(is,"UTF-8");
         br = new BufferedReader(isr);
             
         String result = null;
         String json=""; // JSON ����� String ����
            
         while(true){
         	result = br.readLine();
         	if(result == null){
               	break;
            }
               json=result;  // JSON ��� ����
         }
            
        //System.out.println("�̼����� json��: "+json);	

        JSONParser parser=new JSONParser();
        JSONObject jsonResult = (JSONObject)parser.parse(json);
        System.out.println("jsonResult: "+jsonResult);	
        
		return jsonResult;
	}
}
