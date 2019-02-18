package com.tmmmi.service.scrap.impl;

import java.io.IOException;
import java.net.URL;
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
		} else if (scrap.getSectionNo() == 3) {
			return crawlTastyScrap(scrap);
		} else if (scrap.getSectionNo() == 4) {
			return crawlShoppingScrap(scrap);
		} else if (scrap.getSectionNo() == 5) {
			return crawlUserKeywordScrap(scrap);
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
	
	@Override
	public Scrap crawlTastyScrap(Scrap scrap) throws IOException {
		Document doc = Jsoup.parse(new URL(scrap.getScrapLink()).openStream(), "UTF-8", scrap.getScrapLink());
		scrap.setScrapTitle(doc.select("title").text());
		scrap.setScrapDetail(doc.toString());
		return scrap;
	}
	
	@Override
	public Scrap crawlShoppingScrap(Scrap scrap) throws IOException {
		Document doc = Jsoup.connect(scrap.getScrapLink()).header("User-Agent", "Mozilla/5.0").get();
		doc = Jsoup.connect(doc.toString().replaceAll("/detail/detail.nhn", "http://search.shopping.naver.com/detail/detail.nhn").split("replace\\(\\'")[1].split("\\'\\);")[0]).header("User-Agent", "Mozilla/5.0").get();
		scrap.setScrapTitle(doc.select("title").text());
		scrap.setScrapDetail(doc.toString());
		return scrap;
	}
	
	@Override
	public Scrap crawlUserKeywordScrap(Scrap scrap) throws IOException {
		Document doc = Jsoup.connect(scrap.getScrapLink()).header("User-Referer", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36")
				.header("Referer", "https://www.naver.com").get();
		scrap.setScrapTitle(doc.select("title").text());
		scrap.setScrapDetail(doc.toString());
		return scrap;
	}
}
