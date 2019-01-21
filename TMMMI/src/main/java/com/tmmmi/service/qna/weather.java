package com.tmmmi.service.qna;

import java.net.URL;
import java.net.URLConnection;
import java.net.MalformedURLException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.IOException;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class weather {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		URL url; //URL �ּ� ��ü
        URLConnection connection; //URL������ ������ ��ü
        InputStream is; //URL���ӿ��� ������ �б� ���� Stream
        InputStreamReader isr;
        BufferedReader br;
        String city = "Seoul"; //�⺻���� ����� 
        String APPID =  "9375e1f400fff57aed0637c39dced0cb"; //�̰űװŹ�����..��ư �װ�
        
    try{
            //URL��ü�� ����, �ش� URL�� ����
            url = new  URL("http://api.openweathermap.org/data/2.5/weather?q="+city+"&units=metric&APPID="+APPID);
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
            JSONObject temp1=(JSONObject)parser.parse(json);
            // Ű�� ��main���� ���� �ٽ� JSON ������Ʈ�̰� �ش� ������Ʈ�� ��temp�� Ű ���
            JSONObject temp2=(JSONObject)temp1.get("main");
            System.out.println("�µ������� �Ľ̵�����? : " +temp2);
            
        }catch(MalformedURLException mue){
            System.err.println("�߸��� URL!! �ε�");
            System.exit(1);
        }catch(IOException ioe){
            System.err.println("IOException " + ioe);
            ioe.printStackTrace();
            System.exit(1);
        }
    }
}