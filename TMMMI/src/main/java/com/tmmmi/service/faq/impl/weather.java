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
		URL url; //URL �ּ� ��ü
        URLConnection connection; //URL������ ������ ��ü
        InputStream is; //URL���ӿ��� ������ �б� ���� Stream
        InputStreamReader isr;
        BufferedReader br;
        String city = "����"; //�⺻���� ����� 

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
            
        System.out.println("�̼����� json��: "+json);	

        JSONParser parser=new JSONParser();
        JSONObject jsonTemp = (JSONObject)parser.parse(json);
        /*int jsonResult = ((JSONArray) jsonTemp.get("list")).get("pm10Value");*/
        System.out.println("jsonResult: "+jsonTemp.get("list"));	
       /* System.out.println("jsonResult: "+jsonResult);	*/
		
		
    }
}