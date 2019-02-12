package com.tmmmi.service.scrap.impl;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Repository;

import com.tmmmi.service.domain.Scrap;
import com.tmmmi.service.scrap.ScrapCrawlDao;

@Repository("scrapCrawlDaoImpl")
public class ScrapCrawlDaoImpl implements ScrapCrawlDao {

	public ScrapCrawlDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Scrap crawlScrap(Scrap scrap) throws IOException {
		if (scrap.getSectionNo() == 1) {
			return crawlMovieScrap(scrap);
		}
		return null;
	}

	@Override
	public Scrap crawlMovieScrap(Scrap scrap) throws IOException {
		Document doc = Jsoup.connect(scrap.getScrapLink()).header("User-Agent", "Mozilla/5.0").get();
		scrap.setScrapTitle(doc.select("title").text());
		scrap.setScrapDetail(doc.toString().replaceAll("/css/deploy", "https://movie.naver.com/css/deploy")/*
											.replaceAll("/js/deploy", "https://movie.naver.com/js/deploy")
											.replaceAll("/api/internal/point", "https://movie.naver.com/api/internal/point")*/);
		return scrap;
	}

}
