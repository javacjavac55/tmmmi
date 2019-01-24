package com.tmmmi.service.content.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tmmmi.service.content.ContentDao;
import com.tmmmi.service.domain.ContentSetting;
import com.tmmmi.service.domain.ContentSport;

@Repository("contentSportDaoImpl")
public class ContentSportDaoImpl extends ContentDaoAdaptor {
	
	public ContentSportDaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	public List<Object> getContentKsoccerList(ContentSetting contentSetting, int index) throws Exception {
		String address = "https://sports.news.naver.com/kfootball/index.nhn";

		int start = 0;
		int end = 5 + (index * 5);

		Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();
		// System.out.println(doc);

		// String h1= doc.select("h1").text();
		// String h2= doc.select("h2").eq(1).text();
		Elements contents = doc.select(".home_news > ul > li > a");

		String text = contents.toString();
		String firstAddress = "https://sports.news.naver.com";
		String subAddress = "";
		String fullAddress = "";

		List<Object> sportList = new ArrayList<Object>();

		for (int i = start; i < 20; i++) {
			Element element = contents.get(i);
			subAddress = element.attr("href");
			// subAddress=
			// (((element.toString().split("target")[0]).split("href=")[1]).replaceAll("amp;",
			// "")).replaceAll("\"", "");

			fullAddress = firstAddress + subAddress;

			ContentSport contentSport = new ContentSport();
			contentSport.setSportLink(fullAddress);

			doc = Jsoup.connect(fullAddress).header("User-Agent", "Mozilla/5.0").get();
			Elements title = doc.select(".news_headline > .title");
			//Elements thumbnail = doc.select(".end_photo_org > img");
			Elements thumbnail = doc.select("#newsEndContents img");
			
			// contentSport.setSportTitle(((element2.toString()).split("\">")[1]).split("<")[0]);
			// contentSport.setSportThumbnail((((element3.toString()).split("\"
			// alt=")[0]).replaceAll("src=\"data:", "")).split("src=\"")[1]);

			contentSport.setSportTitle(title.text());
			contentSport.setSportThumbnail(thumbnail.attr("src"));

			sportList.add(contentSport);
		}
		System.out.println(sportList);

		return sportList;
	}
	

	public List<Object> getContentWsoccerList(ContentSetting contentSetting, int index) throws Exception {
		String address = "https://sports.news.naver.com/wfootball/index.nhn";

		int start = 0;
		int end = 5 + (index * 5);

		Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();
		// System.out.println(doc);

		// String h1= doc.select("h1").text();
		// String h2= doc.select("h2").eq(1).text();
		Elements contents = doc.select(".home_news > ul > li > a");

		String text = contents.toString();
		String firstAddress = "https://sports.news.naver.com";
		String subAddress = "";
		String fullAddress = "";

		List<Object> sportList = new ArrayList<Object>();

		for (int i = start; i < 20; i++) {
			Element element = contents.get(i);
			subAddress = element.attr("href");
			// subAddress=
			// (((element.toString().split("target")[0]).split("href=")[1]).replaceAll("amp;",
			// "")).replaceAll("\"", "");

			fullAddress = firstAddress + subAddress;

			ContentSport contentSport = new ContentSport();
			contentSport.setSportLink(fullAddress);

			doc = Jsoup.connect(fullAddress).header("User-Agent", "Mozilla/5.0").get();
			Elements title = doc.select(".news_headline > .title");
			Elements thumbnail = doc.select("#newsEndContents img");

			// contentSport.setSportTitle(((element2.toString()).split("\">")[1]).split("<")[0]);
			// contentSport.setSportThumbnail((((element3.toString()).split("\"
			// alt=")[0]).replaceAll("src=\"data:", "")).split("src=\"")[1]);

			contentSport.setSportTitle(title.text());
			contentSport.setSportThumbnail(thumbnail.attr("src"));

			sportList.add(contentSport);
		}
		System.out.println(sportList);

		return sportList;
	}
	
	public List<Object> getContentKbaseballList(ContentSetting contentSetting, int index) throws Exception {
		String address = "https://sports.news.naver.com/kbaseball/index.nhn";

		int start = 0;
		int end = 5 + (index * 5);

		Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();
		// System.out.println(doc);

		// String h1= doc.select("h1").text();
		// String h2= doc.select("h2").eq(1).text();
		Elements contents = doc.select(".home_news > ul > li > a");

		String text = contents.toString();
		String firstAddress = "https://sports.news.naver.com";
		String subAddress = "";
		String fullAddress = "";

		List<Object> sportList = new ArrayList<Object>();

		for (int i = start; i < 20; i++) {
			Element element = contents.get(i);
			subAddress = element.attr("href");
			// subAddress=
			// (((element.toString().split("target")[0]).split("href=")[1]).replaceAll("amp;",
			// "")).replaceAll("\"", "");

			fullAddress = firstAddress + subAddress;

			ContentSport contentSport = new ContentSport();
			contentSport.setSportLink(fullAddress);

			doc = Jsoup.connect(fullAddress).header("User-Agent", "Mozilla/5.0").get();
			Elements title = doc.select(".news_headline > .title");
			Elements thumbnail = doc.select("#newsEndContents img");

			// contentSport.setSportTitle(((element2.toString()).split("\">")[1]).split("<")[0]);
			// contentSport.setSportThumbnail((((element3.toString()).split("\"
			// alt=")[0]).replaceAll("src=\"data:", "")).split("src=\"")[1]);

			contentSport.setSportTitle(title.text());
			contentSport.setSportThumbnail(thumbnail.attr("src"));

			sportList.add(contentSport);
		}
		System.out.println(sportList);

		return sportList;
	}
	
	public List<Object> getContentWbaseballList(ContentSetting contentSetting, int index) throws Exception {
		String address = "https://sports.news.naver.com/wbaseball/index.nhn";

		int start = 0;
		int end = 5 + (index * 5);

		Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();
		// System.out.println(doc);

		// String h1= doc.select("h1").text();
		// String h2= doc.select("h2").eq(1).text();
		Elements contents = doc.select(".home_news > ul > li > a");

		String text = contents.toString();
		String firstAddress = "https://sports.news.naver.com";
		String subAddress = "";
		String fullAddress = "";

		List<Object> sportList = new ArrayList<Object>();

		for (int i = start; i < 15; i++) {
			Element element = contents.get(i);
			subAddress = element.attr("href");
			// subAddress=
			// (((element.toString().split("target")[0]).split("href=")[1]).replaceAll("amp;",
			// "")).replaceAll("\"", "");

			fullAddress = firstAddress + subAddress;

			ContentSport contentSport = new ContentSport();
			contentSport.setSportLink(fullAddress);

			doc = Jsoup.connect(fullAddress).header("User-Agent", "Mozilla/5.0").get();
			Elements title = doc.select(".news_headline > .title");
			Elements thumbnail = doc.select("#newsEndContents img");

			// contentSport.setSportTitle(((element2.toString()).split("\">")[1]).split("<")[0]);
			// contentSport.setSportThumbnail((((element3.toString()).split("\"
			// alt=")[0]).replaceAll("src=\"data:", "")).split("src=\"")[1]);

			contentSport.setSportTitle(title.text());
			contentSport.setSportThumbnail(thumbnail.attr("src"));

			sportList.add(contentSport);
		}
		System.out.println(sportList);

		return sportList;
	}

	public List<Object> getContentBasketballList(ContentSetting contentSetting, int index) throws Exception {
		String address = "https://sports.news.naver.com/basketball/index.nhn";

		int start = 0;
		int end = 5 + (index * 5);

		Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();
		// System.out.println(doc);

		// String h1= doc.select("h1").text();
		// String h2= doc.select("h2").eq(1).text();
		Elements contents = doc.select(".home_news > ul > li > a");

		String text = contents.toString();
		String firstAddress = "https://sports.news.naver.com";
		String subAddress = "";
		String fullAddress = "";

		List<Object> sportList = new ArrayList<Object>();

		for (int i = start; i < 20; i++) {
			Element element = contents.get(i);
			subAddress = element.attr("href");
			// subAddress=
			// (((element.toString().split("target")[0]).split("href=")[1]).replaceAll("amp;",
			// "")).replaceAll("\"", "");

			fullAddress = firstAddress + subAddress;

			ContentSport contentSport = new ContentSport();
			contentSport.setSportLink(fullAddress);

			doc = Jsoup.connect(fullAddress).header("User-Agent", "Mozilla/5.0").get();
			Elements title = doc.select(".news_headline > .title");
			Elements thumbnail = doc.select("#newsEndContents img");

			// contentSport.setSportTitle(((element2.toString()).split("\">")[1]).split("<")[0]);
			// contentSport.setSportThumbnail((((element3.toString()).split("\"
			// alt=")[0]).replaceAll("src=\"data:", "")).split("src=\"")[1]);

			contentSport.setSportTitle(title.text());
			contentSport.setSportThumbnail(thumbnail.attr("src"));

			sportList.add(contentSport);
		}
		System.out.println(sportList);

		return sportList;
	}

	public List<Object> getContentGeneralList(ContentSetting contentSetting, int index) throws Exception {
		String address = "https://sports.news.naver.com/general/index.nhn";

		int start = 0;
		int end = 5 + (index * 5);

		Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();
		// System.out.println(doc);

		// String h1= doc.select("h1").text();
		// String h2= doc.select("h2").eq(1).text();
		Elements contents = doc.select(".home_news > ul > li > a");

		String text = contents.toString();
		String firstAddress = "https://sports.news.naver.com";
		String subAddress = "";
		String fullAddress = "";

		List<Object> sportList = new ArrayList<Object>();

		for (int i = start; i < 20; i++) {
			Element element = contents.get(i);
			subAddress = element.attr("href");
			// subAddress=
			// (((element.toString().split("target")[0]).split("href=")[1]).replaceAll("amp;",
			// "")).replaceAll("\"", "");

			fullAddress = firstAddress + subAddress;

			ContentSport contentSport = new ContentSport();
			contentSport.setSportLink(fullAddress);

			doc = Jsoup.connect(fullAddress).header("User-Agent", "Mozilla/5.0").get();
			Elements title = doc.select(".news_headline > .title");
			Elements thumbnail = doc.select("#newsEndContents img");

			// contentSport.setSportTitle(((element2.toString()).split("\">")[1]).split("<")[0]);
			// contentSport.setSportThumbnail((((element3.toString()).split("\"
			// alt=")[0]).replaceAll("src=\"data:", "")).split("src=\"")[1]);

			contentSport.setSportTitle(title.text());
			contentSport.setSportThumbnail(thumbnail.attr("src"));

			sportList.add(contentSport);
		}
		System.out.println(sportList);

		return sportList;
	}


}
