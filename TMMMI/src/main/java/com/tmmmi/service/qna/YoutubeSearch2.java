package com.tmmmi.service.qna;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class YoutubeSearch2 {
	public static void main(String[] args) throws Exception {
		
		String apiurl =  "https://www.googleapis.com/youtube/v3/search?key=AIzaSyBLiKbxA8GhogX362LoIoNnCaVmIvesAFU&part=snippet&q=ºÓ«Œ";

		URL url = new URL(apiurl);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
		String inputLine;
		StringBuffer response = new StringBuffer();
		while((inputLine = br.readLine()) != null) {
			response.append(inputLine);
		}
		br.close();
		System.out.println(response);
	}
}