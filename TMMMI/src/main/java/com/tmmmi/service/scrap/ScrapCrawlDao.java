package com.tmmmi.service.scrap;

import java.io.IOException;

import com.tmmmi.service.domain.Scrap;

public interface ScrapCrawlDao {
	
	public Scrap crawlScrap(Scrap scrap) throws IOException;
	
	public Scrap crawlMovieScrap(Scrap scrap) throws IOException;
	
	public Scrap crawlSportScrap(Scrap scrap) throws IOException;
	
	public Scrap crawlTastyScrap(Scrap scrap) throws IOException;
	
	public Scrap crawlShoppingScrap(Scrap scrap) throws IOException;
	
	public Scrap crawlUserKeywordScrap(Scrap scrap) throws IOException;

}
