package com.tmmmi.service.content.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.apache.ibatis.session.SqlSession;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.FluentWait;
import org.openqa.selenium.support.ui.Wait;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.google.common.base.Function;
import com.tmmmi.service.content.ContentDao;
import com.tmmmi.service.domain.ContentSetting;
import com.tmmmi.service.domain.ContentSport;

@Repository("contentSportDaoImpl")
public class ContentSportDaoImpl extends ContentDaoAdaptor {
	
	
	public ContentSportDaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	public List<ContentSport> getContentKsoccerList(int index) throws Exception {
		String address = "https://sports.news.naver.com/kfootball/index.nhn";

		int start = (index * 5);
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

		List<ContentSport> sportList = new ArrayList<ContentSport>();

		for (int i = start; i < end; i++) {
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
	

	public List<ContentSport> getContentWsoccerList(int index) throws Exception {
		String address = "https://sports.news.naver.com/wfootball/index.nhn";

		int start = (index * 5);
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

		List<ContentSport> sportList = new ArrayList<ContentSport>();

		for (int i = start; i < end; i++) {
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
	
	public List<ContentSport> getContentKbaseballList(int index) throws Exception {
		String address = "https://sports.news.naver.com/kbaseball/index.nhn";

		int start = (index * 5);
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

		List<ContentSport> sportList = new ArrayList<ContentSport>();

		for (int i = start; i < end; i++) {
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
	
	public List<ContentSport> getContentWbaseballList(int index) throws Exception {
		String address = "https://sports.news.naver.com/wbaseball/index.nhn";

		int start = (index * 5);
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

		List<ContentSport> sportList = new ArrayList<ContentSport>();

		for (int i = start; i < end; i++) {
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

	public List<ContentSport> getContentBasketballList(int index) throws Exception {
		String address = "https://sports.news.naver.com/basketball/index.nhn";

		int start = (index * 5);
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

		List<ContentSport> sportList = new ArrayList<ContentSport>();

		for (int i = start; i < end; i++) {
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

	public List<ContentSport> getContentGeneralList(int index) throws Exception {
		String address = "https://sports.news.naver.com/general/index.nhn";

		int start = (index * 5);
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

		List<ContentSport> sportList = new ArrayList<ContentSport>();

		for (int i = start; i < end; i++) {
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

	@Override
	public List<ContentSport> getContentHighlightList(int index) throws Exception {
		
		String address = "https://tv.naver.com/spotvmaster/clips";
		int start = (index * 5);
		int end = 5 + (index * 5);
		/*String firstAddress = "https://tv.naver.com";
		String subAddress = "";
		String fullAddress = "";*/
		
		System.out.println("");
		Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();
		
		List<ContentSport> sportList = new ArrayList<ContentSport>();
		
		Elements link = doc.select(".cds._MM_CARD > div > a");
		
		for(int i = start; i<end; i++) {
			Element element = link.get(i);
			
			ContentSport contentSport = new ContentSport();
			
			contentSport.setSportThumbnail(element.getElementsByTag("img").first().attr("src").split("\\?type=")[0]);
			contentSport.setSportTitle(element.getElementsByTag("img").first().attr("alt"));
			contentSport.setSportNo(element.attr("href").replace("/v/", ""));
			
			/*subAddress=element.attr("href");
			fullAddress= firstAddress + subAddress;
			
			doc = Jsoup.connect(fullAddress).header("User-Agent", "Mozilla/5.0").get();			
			contentSport.setSportLink(fullAddress);
			contentSport.setSportVideo("<iframe src='"+doc.getElementsByAttributeValue("property", "og:video:url").attr("content")+"' frameborder='no' scrolling='no' marginwidth='0' marginheight='0' WIDTH='600' HEIGHT='518' allow='autoplay' allowfullscreen></iframe>");
			contentSport.setSportNo(doc.getElementsByAttributeValue("property", "naver:video:id").attr("content"));*/
			
			sportList.add(contentSport);
		}
		System.out.println(sportList);
		
		return sportList;
	}
	
	@Override
	public ContentSport getContentHighlightVideo(ContentSport contentSport) throws Exception {
		Document doc = Jsoup.connect("https://tv.naver.com/v/"+contentSport.getSportNo()).header("User-Agent", "Mozilla/5.0").get();
		contentSport.setSportVideo("<iframe src='"+doc.getElementsByAttributeValue("property", "og:video:url").attr("content")+"' frameborder='no' scrolling='no' marginwidth='0' marginheight='0' WIDTH='600' HEIGHT='518' allow='autoplay' allowfullscreen></iframe>");
		
		return contentSport;
	}	
	
}