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
import com.tmmmi.service.domain.ContentMovie;

@Repository("contentMovieDaoImpl")
public class ContentMovieDaoImpl extends ContentDaoAdaptor {

	public ContentMovieDaoImpl() {
		// TODO Auto-generated constructor stub
	}
	
	public List<ContentMovie> getBoxOfficeList(int index) throws Exception {
		List<ContentMovie> result = new ArrayList<ContentMovie>();
		try {
			String thumbnailSize = "size=300x421";
			String address = "https://search.naver.com/search.naver?where=nexearch&query=%EB%B0%95%EC%8A%A4%EC%98%A4%ED%94%BC%EC%8A%A4%EC%88%9C%EC%9C%84";
			Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();
			Document doc2 = null;
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
				
				//link
				matcher = pattern.matcher(movie.getElementsByAttributeValueContaining("href", ".nhn?code=").attr("href"));
				if (matcher.find()) {
					contentMovie.setMovieLink("https://movie.naver.com/movie/bi/mi/basic.nhn?code=" + matcher.group(1));
					//no
					contentMovie.setMovieNo(Integer.parseInt(matcher.group(1)));
				} else {
					continue;
				}
				
				//video
				if (movie.getElementsContainingText("예고편").size() > 0) {
					doc2 = Jsoup.connect(movie.getElementsContainingText("예고편").attr("href")).header("User-Agent", "Mozilla/5.0").get();
					contentMovie.setMovieVideo(doc2.select(".video_ar").html().replaceAll("src=\"/movie","src=\"https://movie.naver.com/movie").replaceAll("playerSize=...x...", "playerSize=712x518").replaceAll("height=\"480\"", "height=\"518\""));
				}
				result.add(contentMovie);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<ContentMovie> getNewMovieList(int index) throws Exception {
		List<ContentMovie> result = new ArrayList<ContentMovie>();
		try {
			String address = "https://movie.naver.com/movie/running/current.nhn";
			Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();
			Document innerDoc = null;

			Elements movies = ((Elements) doc.select(".lst_detail_t1 li"));
			
			int start = 0+index*5;
			int end = 5+index*5;
			for (int i=start;i<end;i++) {
				Element movie = movies.get(i);
				ContentMovie contentMovie = new ContentMovie();
				
				//thumbnail
				contentMovie.setMovieThumbnail(movie.getElementsByTag("img").attr("src").split("\\?type=")[0]);
				
				//title
				contentMovie.setMovieTitle(movie.select(".tit a").text());
				
				
				for (Element e : movie.select(".info_txt1 dt")) {
					switch (e.text()) {
					case "개요":
						//genre + running time + open date
						String[] info = e.nextElementSibling().text().split(" \\| ");
						
						for (String val:info) {
							if (val.contains("분"))
								contentMovie.setMovieRunningTime(val);
							else if (val.contains("개봉"))
								contentMovie.setMovieOpenDate(val.replace("개봉", ""));
							else
								contentMovie.setMovieGenre(val);
						}
						break;
					case "감독":
						//director
						contentMovie.setMovieDirector(e.nextElementSibling().text());
						break;
					case "출연":
						//actor
						String[] actor = e.nextElementSibling().text().split(",");
						if (actor.length>2) {
							contentMovie.setMovieActor(actor[0]+","+actor[1]+" 외");
						} else {
							contentMovie.setMovieActor(e.nextElementSibling().text());
						}
						break;
					}
						
				}
				//rating + reserve rating
				String[] info2 = movie.select(".star_t1 .num").text().split(" ");
				contentMovie.setMovieRating(/*BigDecimal.valueOf(Double.parseDouble(info2[0])*10).setScale(3, RoundingMode.HALF_UP).doubleValue()+""*/info2[0]);
				if (info2.length>1) {
					contentMovie.setMovieReserveRate(info2[1]+"%");
				}
				
				//rating count
				contentMovie.setMovieRatingCount(movie.select(".num2").text());
				
				//video
				innerDoc = Jsoup.connect("http://movie.naver.com"+movie.select(".item2").attr("href")).header("User-Agent", "Mozilla/5.0").get();
				contentMovie.setMovieVideo(innerDoc.select(".video_ar").html().replaceAll("src=\"/movie","src=\"https://movie.naver.com/movie").replaceAll("playerSize=...x...", "playerSize=712x518").replaceAll("height=\"480\"", "height=\"518\""));
				
				//link
				contentMovie.setMovieLink("https://movie.naver.com"+movie.getElementsByAttributeValueContaining("href", ".nhn?code=").attr("href"));
				
				//no
				contentMovie.setMovieNo(Integer.parseInt(movie.getElementsByAttributeValueContaining("href", ".nhn?code=").attr("href").split("code=")[1]));
				
				result.add(contentMovie);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<ContentMovie> getUpcomingMovieList(int index) throws Exception {
		List<ContentMovie> result = new ArrayList<ContentMovie>();
		try {
			String address = "https://movie.naver.com/movie/running/premovie.nhn";
			Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();
			Document innerDoc = null;

			Elements movies = ((Elements) doc.select(".lst_detail_t1 li"));

			int start = 0 + index * 5;
			int end = 5 + index * 5;
			for (int i = start; i < end; i++) {
				Element movie = movies.get(i);
				System.out.println(movie.text());
				
				if (movie.select(".ico_rating_18").size() > 0) {
					continue;
				}
				
				ContentMovie contentMovie = new ContentMovie();

				// thumbnail
				contentMovie.setMovieThumbnail(movie.getElementsByTag("img").attr("src").split("\\?type=")[0]);

				// title
				contentMovie.setMovieTitle(movie.select(".tit a").text());

				for (Element e : movie.select(".info_txt1 dt")) {
					switch (e.text()) {
					case "개요":
						// genre + running time + open date
						String[] info = e.nextElementSibling().text().split(" \\| ");
						
						for (String val:info) {
							if (val.contains("분"))
								contentMovie.setMovieRunningTime(val);
							else if (val.contains("개봉"))
								contentMovie.setMovieOpenDate(val.replace("개봉", ""));
							else
								contentMovie.setMovieGenre(val);
						}
						break;
					case "감독":
						// director
						contentMovie.setMovieDirector(e.nextElementSibling().text());
						break;
					case "출연":
						// actor
						String[] actor = e.nextElementSibling().text().split(",");
						if (actor.length > 2) {
							contentMovie.setMovieActor(actor[0] + "," + actor[1] + " 외");
						} else {
							contentMovie.setMovieActor(e.nextElementSibling().text());
						}
						break;
					}

				}

				// video
				if (movie.select(".item2").text().contains("예고편")) {
					innerDoc = Jsoup.connect("http://movie.naver.com" + movie.getElementsContainingText("예고편").attr("href"))
							.header("User-Agent", "Mozilla/5.0").get();
					contentMovie.setMovieVideo(innerDoc.select(".video_ar").html()
							.replaceAll("src=\"/movie", "src=\"https://movie.naver.com/movie")
							.replaceAll("playerSize=...x...", "playerSize=712x518")
							.replaceAll("height=\"480\"", "height=\"518\""));
				}
				
				// link
				contentMovie.setMovieLink("https://movie.naver.com"
						+ movie.getElementsByAttributeValueContaining("href", ".nhn?code=").attr("href"));

				//no
				contentMovie.setMovieNo(Integer.parseInt(movie.getElementsByAttributeValueContaining("href", ".nhn?code=").attr("href").split("code=")[1]));
				
				result.add(contentMovie);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<ContentMovie> getMovieReviewList(int index) throws Exception {
		List<ContentMovie> result = new ArrayList<ContentMovie>();
		try {
			String address = "https://movie.naver.com/";
			Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();
			
			Elements movies = ((Elements) doc.select("._select_title"));
			for (Element movie:movies) {
				ContentMovie contentMovie = new ContentMovie();
				
				//movieLink
				contentMovie.setMovieLink("https://movie.naver.com"+movie.getElementsByClass("thmb").attr("href"));
				
				//movieThumbnail
				contentMovie.setMovieThumbnail(movie.select(".thmb > img").attr("src").split("\\?type=")[0]);
				
				//movieTitle
				contentMovie.setMovieTitle(movie.select(".detail > a > strong").text());
				
				//movieReviewTitle
				contentMovie.setMovieReviewTitle(movie.select(".info li").eachText());
				
				//movieReviewLink
				List<String> tmp = movie.select(".info a").eachAttr("href");
				tmp.replaceAll(s -> "https://movie.naver.com"+s+"&order=#tab");
				contentMovie.setMovieReviewLink(tmp);
				
				result.add(contentMovie);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<ContentMovie> getMovieTrailerList(int index) throws Exception {
		List<ContentMovie> result = new ArrayList<ContentMovie>();
		try {
			String address = "https://movie.naver.com/movie/running/movieclip.nhn?subcategoryid=TRAILER&searchKeyword=&page="+(index+1);
			Document doc = Jsoup.connect(address).header("User-Agent", "Mozilla/5.0").get();
			Document doc2 = null;
			
			Elements trailers = ((Elements) doc.select(".lst_detail_t1 li"));
			
			Pattern p = Pattern.compile("\\[(.*?)\\]");
			for (Element movie:trailers) {
				
				if (movie.select(".ico_rating_18").size() > 0) {
					continue;
				}
				
				ContentMovie contentMovie = new ContentMovie();
				
				if (!movie.select(".tit > a").text().contains("예고편")) {
					continue;
				}

				//movieTitle
				Matcher m = p.matcher(movie.select(".tit > a").text());
				if (m.find()) {
					contentMovie.setMovieTitle(m.group(1));
				} else {
					continue;
				}
				
				
				for (Element e : movie.select(".info_txt1 dt")) {
					switch (e.text()) {
					case "개요":
						//genre + running time + open date
						String[] info = e.nextElementSibling().text().split(" \\| ");
						
						for (String val:info) {
							if (val.contains("분"))
								contentMovie.setMovieRunningTime(val);
							else if (val.contains("개봉"))
								contentMovie.setMovieOpenDate(val.replace("개봉", ""));
							else if (!val.contains("재생")) {
								String[] genre = val.split(",");
								if (genre.length > 3) {
									contentMovie.setMovieGenre(genre[0]+","+genre[1]+","+genre[2]);
								} else {
									contentMovie.setMovieGenre(val);
								}
								
							}
								
						}
						break;
					case "감독":
						//director
						contentMovie.setMovieDirector(e.nextElementSibling().text());
						break;
					case "출연":
						//actor
						String[] actor = e.nextElementSibling().text().split(",");
						if (actor.length>2) {
							contentMovie.setMovieActor(actor[0]+","+actor[1]+" 외");
						} else {
							contentMovie.setMovieActor(e.nextElementSibling().text());
						}
						break;
					}
						
				}
				
				//movieThumbnail
				contentMovie.setMovieThumbnail(movie.select(".thumb2 img").attr("src"));
				
				//movieLink
				contentMovie.setMovieLink("https://movie.naver.com"+movie.select(".btn_area > .btn_view_info").attr("href"));
				
				//movieNo
				contentMovie.setMovieNo(Integer.parseInt(movie.select(".btn_area > a").attr("href").split("code=")[1]));
				
				//movieVideo
				doc2 = Jsoup.connect("https://movie.naver.com"+movie.select(".tit > a").attr("href")).header("User-Agent", "Mozilla/5.0").get();
				contentMovie.setMovieVideo(doc2.select(".video_ar").html().replaceAll("src=\"/movie","src=\"https://movie.naver.com/movie").replaceAll("playerSize=...x...", "playerSize=600x540").replaceAll("width=\"100%\"", "width=\"600\"").replaceAll("height=\"480\"", "height=\"540\""));
				result.add(contentMovie);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
