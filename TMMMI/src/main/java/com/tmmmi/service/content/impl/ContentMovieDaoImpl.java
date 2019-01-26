package com.tmmmi.service.content.impl;

import java.math.BigDecimal;
import java.math.RoundingMode;
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
	
	public List<Object> getNewMovieList(ContentSetting contentSetting, int index) throws Exception {
		List<Object> result = new ArrayList<Object>();
		try {
			String address = "https://movie.naver.com/movie/running/current.nhn";
			Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();
			Document innerDoc = null;

			Elements movies = ((Elements) doc.select(".lst_detail_t1 li"));
			
			int start = 0;
			int end = 5;
			for (int i=start;i<end;i++) {
				Element movie = movies.get(i);
				ContentMovie contentMovie = new ContentMovie();
				
				//thumbnail
				//System.out.println(movie.getElementsByTag("img").attr("src").split("\\?type=")[0]);
				contentMovie.setMovieThumbnail(movie.getElementsByTag("img").attr("src").split("\\?type=")[0]);
				
				//title
				//System.out.println(movie.select(".tit a").text());
				contentMovie.setMovieTitle(movie.select(".tit a").text());
				
				//genre + running time + open date
				//System.out.println(movie.select(".info_txt1 dd").get(0).text());
				String[] info = movie.select(".info_txt1 dd").get(0).text().split(" \\| ");
				contentMovie.setMovieGenre(info[0]);
				contentMovie.setMovieRunningTime(info[1]);
				contentMovie.setMovieOpenDate(info[2].replace("°³ºÀ", ""));
				
				//director
				//System.out.println(movie.select(".info_txt1 dd").get(1).text());
				contentMovie.setMovieDirector(movie.select(".info_txt1 dd").get(1).text());
				
				//actor
				//System.out.println(movie.select(".info_txt1 dd").get(2).text());
				contentMovie.setMovieActor(movie.select(".info_txt1 dd").get(2).text());
				
				//rating + reserve rating
				//System.out.println(movie.select(".star_t1 .num").text());
				String[] info2 = movie.select(".star_t1 .num").text().split(" ");
				contentMovie.setMovieRating(BigDecimal.valueOf(Double.parseDouble(info2[0])*10).setScale(3, RoundingMode.HALF_UP).doubleValue()+"");
				contentMovie.setMovieReserveRate(info2[1]);
				
				//rating count
				//System.out.println(movie.select(".num2").text());
				contentMovie.setMovieRatingCount(movie.select(".num2").text());
				
				//video
				innerDoc = Jsoup.connect("http://movie.naver.com"+movie.select(".item2").attr("href")).header("User-Agent", "Mozilla/5.0").get();
				//System.out.println(innerDoc.select(".video_ar").html());
				contentMovie.setMovieVideo(innerDoc.select(".video_ar").html().replaceAll("src=\"/movie","src=\"https://movie.naver.com/movie"));
				
				//link
				//System.out.println("https://movie.naver.com"+movie.getElementsByAttributeValueContaining("href", ".nhn?code=").attr("href"));
				contentMovie.setMovieLink("https://movie.naver.com"+movie.getElementsByAttributeValueContaining("href", ".nhn?code=").attr("href"));
				
				System.out.println(contentMovie);
				result.add(contentMovie);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
