package com.tmmmi.service.scrap.impl;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.Properties;

import javax.annotation.Resource;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Repository;

import com.tmmmi.service.domain.Scrap;
import com.tmmmi.service.scrap.ScrapCrawlDao;

@Repository("scrapCrawlDaoImpl")
public class ScrapCrawlDaoImpl implements ScrapCrawlDao {

	public ScrapCrawlDaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@Override
	public Scrap crawlScrap(Scrap scrap) throws IOException {
		if (scrap.getSectionNo() == 1) {
			return crawlMovieScrap(scrap);
		} else if (scrap.getSectionNo() == 2) {
			return crawlSportScrap(scrap);
		}
		return null;
	}

	@Override
	public Scrap crawlMovieScrap(Scrap scrap) throws IOException {
		Document doc = Jsoup.connect(scrap.getScrapLink()).header("User-Agent", "Mozilla/5.0").get();
		scrap.setScrapTitle(doc.getElementsByAttributeValue("property", "og:title").attr("content"));
		if (scrap.getScrapLink().contains("reviewread")) {
			scrap.setScrapTitle("[ÈÄ±â] "+doc.getElementsByAttributeValue("property", "og:title").attr("content")+" : "+doc.select(".h_lst_tx").text());
		}
		scrap.setScrapDetail(doc.toString().replaceAll("/css/deploy", "https://movie.naver.com/css/deploy"));
		return scrap;
	}
	
	@Override
	public Scrap crawlSportScrap(Scrap scrap) throws IOException {
		Document doc = Jsoup.parse(new URL(scrap.getScrapLink()).openStream(), "UTF-8", scrap.getScrapLink());
		scrap.setScrapTitle(doc.select("title").text());
		scrap.setScrapDetail(doc.toString());
		return scrap;
	}
	
	public static void main(String args[]) throws IOException {
		//Document doc = Jsoup.connect("https://sports.news.naver.com/wfootball/news/read.nhn?oid=311&aid=0000954371").header("User-Agent", "Mozilla/5.0").get();
		Document doc = Jsoup.parse(new URL("https://tv.naver.com/v/5353729").openStream(), "UTF-8", "https://tv.naver.com/v/5353729");
				
	}
}
