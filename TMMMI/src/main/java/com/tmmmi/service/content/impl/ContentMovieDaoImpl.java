package com.tmmmi.service.content.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tmmmi.service.domain.ContentMovie;
import com.tmmmi.service.domain.ContentSetting;

@Repository("contentMovieDaoImpl")
public class ContentMovieDaoImpl extends ContentDaoAdaptor {

	public ContentMovieDaoImpl() {
		// TODO Auto-generated constructor stub
	}
	
	public List<Object> getBoxOfficeList(ContentSetting contentSetting, int index) throws Exception {
		List<Object> result = new ArrayList<Object>();
		try {
			String thumbnailSize = "size=300x421";
			String address = "https://search.naver.com/search.naver?where=nexearch&query=%EB%B0%95%EC%8A%A4%EC%98%A4%ED%94%BC%EC%8A%A4%EC%88%9C%EC%9C%84";
			Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();

			Elements movies = ((Element) doc.select("._content").get(index)).getElementsByTag("li");
			
			Pattern pattern = Pattern.compile("code=(.*?)&");
			Matcher matcher = null;
			for (Element movie : movies) {
				ContentMovie contentMovie = new ContentMovie();
				contentMovie.setMovieThumbnail(movie.getElementsByAttribute("src").attr("src").replaceAll("size=...x...", thumbnailSize));
				contentMovie.setMovieTitle(movie.getElementsByClass("scm_ellipsis_text _text").text());
				contentMovie.setMovieOpenDate(((Element) movie.getElementsByClass("movie_item").first()).getElementsByTag("dd").get(0).text());
				contentMovie.setMovieDayAudience(((Element) movie.getElementsByClass("movie_item").first()).getElementsByTag("dd").get(1).text());
				contentMovie.setMovieTotalAudience(((Element) movie.getElementsByClass("movie_item").first()).getElementsByTag("dd").get(2).text());
				System.out.println(movie.getElementsByAttributeValueContaining("href", ".nhn?code=").attr("href"));
				matcher = pattern.matcher(movie.getElementsByAttributeValueContaining("href", ".nhn?code=").attr("href"));
				if (matcher.find()) {
					contentMovie.setMovieLink("https://movie.naver.com/movie/bi/mi/basic.nhn?code=" + matcher.group(1));
				}
				System.out.println(contentMovie);
				result.add(contentMovie);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
