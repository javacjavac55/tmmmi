package com.tmmmi.service.qna;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class NaverSearchAPI2 {
	public static StringBuilder sb;
	
	static String getString(String input, String data) // API에서 필요한 문자 자르기.
    {
        String[] dataSplit = data.split("{" + input + "}");
        String[] dataSplit2 = dataSplit[1].split("\"" + input + "\"");
        /*for(int i =0; i<dataSplit.length;i++) {
        	System.out.println(i+"번째: " +dataSplit[i]);
        }*/
        return dataSplit2[0];
      
    }

    public static void main(String[] args) {
        String clientId = "rHBsMd5Tu_WOFtXexEQz";
        String clientSecret = "95lxTYNVRV";
        int display = 5;
        
        try {
            String text = URLEncoder.encode("다이어리", "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/shop?query="+ text+"&display="+display;// json 
            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { 
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            sb = new StringBuilder();
            String line;
 
            while ((line = br.readLine()) != null) {
                sb.append(line + "\n");
            }
            br.close();
            con.disconnect();
            /*System.out.println(sb);*/
            
            String data = sb.toString();
            String[] array;
            array = data.split("\"");
            String[] title = new String[display];
            String[] link = new String[display];
            String[] image = new String[display];
            String[] lprice = new String[display];
            String[] hprice = new String[display];
            String[] mallName = new String[display];
            String[] productId = new String[display];
            String[] productType = new String[display];
            int k = 0;
            for (int i = 0; i < array.length; i++) {
                if (array[i].equals("title"))
                    title[k] = array[i + 2];
                if (array[i].equals("link"))
                    link[k] = array[i + 2];
                if (array[i].equals("image"))
                	image[k] = array[i + 2];
                if (array[i].equals("lprice"))
                	lprice[k] = array[i + 2];
                if (array[i].equals("hprice"))
                	hprice[k] = array[i + 2];
                if (array[i].equals("mallName"))
                	mallName[k] = array[i + 2];
                if (array[i].equals("productId"))
                	productId[k] = array[i + 2];
                if (array[i].equals("productType")) {
                	productType[k] = array[i + 2];
                    k++;
                }
            }
            System.out.println(sb);
            System.out.println("----------------------------");
            System.out.println("첫번째 타이틀 : " + title[0]);
            System.out.println("두번째 타이틀 : " + title[1]);
            System.out.println("세번째 타이틀 : " + title[2]);
            System.out.println("네번째 타이틀 : " + title[3]);
            System.out.println("다섯번째 타이틀 : " + title[4]);

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}