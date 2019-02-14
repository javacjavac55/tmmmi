package com.tmmmi.service.content.impl;

import com.tmmmi.service.domain.ContentSetting;
import com.tmmmi.service.domain.ContentTasty;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Repository;

@Repository("contentTastyDaoImpl")
public class ContentTastyDaoImpl extends ContentDaoAdaptor {
	
	///Constructor
	public ContentTastyDaoImpl() {

	}

	///Method
	public List<ContentTasty> getContentTastyList(ContentSetting contentSetting, int index) {

		String clientId = "d9ROlDLvnXulcE2hxtAm";
        String clientSecret = "O4TGEmLBA4";
        List<ContentTasty> tastyList = null;
        try {
        	String text = URLEncoder.encode(contentSetting.getTastyKeyword()+" 맛집", "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/local?query="+ text;
            ObjectMapper objectMapper = new ObjectMapper();
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { 
                br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
            } else {
                br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
               //objectMapper.writeValueAsString(response);
            }
            br.close();
            System.out.println(response.toString());
            TastyTotal tastyTotal = objectMapper.readValue(response.toString(), TastyTotal.class);
            System.out.println(tastyTotal);
            //tastyMap.put("tastyList", (List<ContentTasty>) tastyTotal.getItems());
            tastyList = (List)tastyTotal.getItems();
        } catch (Exception e) {
            System.out.println(e);
        } 
		return tastyList;
	}
	/*public static void main(String[] args) {
		String clientId = "d9ROlDLvnXulcE2hxtAm";
        String clientSecret = "O4TGEmLBA4";
        try {
        	String text = URLEncoder.encode("강남역 맛집", "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/local?query="+ text; 
            ObjectMapper objectMapper = new ObjectMapper();
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
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println(response.toString());
            TastyTotal tastyTotal = objectMapper.readValue(response.toString(), TastyTotal.class);
        } catch (Exception e) {
            System.out.println(e);
        }
	}*/

}

class TastyTotal {
	///Field
	private String total;
	private String lastBuildDate;
	private String display;
	private String start;
	private List<ContentTasty> items;
	
	///Constructor
	public TastyTotal() {
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getLastBuildDate() {
		return lastBuildDate;
	}

	public void setLastBuildDate(String lastBuildDate) {
		this.lastBuildDate = lastBuildDate;
	}

	public String getDisplay() {
		return display;
	}

	public void setDisplay(String display) {
		this.display = display;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public List<ContentTasty> getItems() {
		return items;
	}

	public void setItems(List<ContentTasty> items) {
		this.items = items;
	}

	@Override
	public String toString() {
		return "TastyTotal [total=" + total + ", lastBuildDate=" + lastBuildDate + ", display=" + display + ", start="
				+ start + ", items=" + items + "]";
	}
}