package com.tmmmi.service.domain;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

public class ContentSetting {
	
	private int userNo;
	private int contentSettingNo;
	private int userKeywordNo;
	private int shoppingKeywordNo;
	private int sortSectionNo;
	
	private int movieBoxOffice;
	private int movieNew;
	private int movieUpcoming;
	private int movieReview;
	private int movieTrailer;
	
	private int soccer;
	private int overseaSoccer;
	private int baseball;
	private int overseaBaseball;
	private int basketball;
	private int sportGeneral;
	private int sportHighlight;
	
	private int showTastyKeyword;
	
	private int showShoppingSearch1;
	private int showShoppingSearch2;
	private int showShoppingSearch3;
	private int showShoppingReview;
	
	private int showUserSearch1;
	private int showUserSearch2;
	private int showUserSearch3;
	private int showUserVideo1;
	private int showUserVideo2;
	
	private String tastyKeyword;
	
	private String shoppingSearch1;
	private String shoppingSearch2;
	private String shoppingSearch3;
	private String shoppingReview;
	
	private String userSearch1;
	private String userSearch2;
	private String userSearch3;
	private String userVideo1;
	private String userVideo2;
	
	public ContentSetting() {
		super();
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getContentSettingNo() {
		return contentSettingNo;
	}

	public void setContentSettingNo(int contentSettingNo) {
		this.contentSettingNo = contentSettingNo;
	}

	public int getUserKeywordNo() {
		return userKeywordNo;
	}

	public void setUserKeywordNo(int userKeywordNo) {
		this.userKeywordNo = userKeywordNo;
	}

	public int getShoppingKeywordNo() {
		return shoppingKeywordNo;
	}

	public void setShoppingKeywordNo(int shoppingKeywordNo) {
		this.shoppingKeywordNo = shoppingKeywordNo;
	}

	public int getSortSectionNo() {
		return sortSectionNo;
	}

	public void setSortSectionNo(int sortSectionNo) {
		this.sortSectionNo = sortSectionNo;
	}

	public int getMovieBoxOffice() {
		return movieBoxOffice;
	}

	public void setMovieBoxOffice(int movieBoxOffice) {
		this.movieBoxOffice = movieBoxOffice;
	}

	public int getMovieNew() {
		return movieNew;
	}

	public void setMovieNew(int movieNew) {
		this.movieNew = movieNew;
	}

	public int getMovieUpcoming() {
		return movieUpcoming;
	}

	public void setMovieUpcoming(int movieUpcoming) {
		this.movieUpcoming = movieUpcoming;
	}

	public int getMovieReview() {
		return movieReview;
	}

	public void setMovieReview(int movieReview) {
		this.movieReview = movieReview;
	}

	public int getMovieTrailer() {
		return movieTrailer;
	}

	public void setMovieTrailer(int movieTrailer) {
		this.movieTrailer = movieTrailer;
	}

	public int getSoccer() {
		return soccer;
	}

	public void setSoccer(int soccer) {
		this.soccer = soccer;
	}

	public int getOverseaSoccer() {
		return overseaSoccer;
	}

	public void setOverseaSoccer(int overseaSoccer) {
		this.overseaSoccer = overseaSoccer;
	}

	public int getBaseball() {
		return baseball;
	}

	public void setBaseball(int baseball) {
		this.baseball = baseball;
	}

	public int getOverseaBaseball() {
		return overseaBaseball;
	}

	public void setOverseaBaseball(int overseaBaseball) {
		this.overseaBaseball = overseaBaseball;
	}

	public int getBasketball() {
		return basketball;
	}

	public void setBasketball(int basketball) {
		this.basketball = basketball;
	}

	public int getSportGeneral() {
		return sportGeneral;
	}

	public void setSportGeneral(int sportGeneral) {
		this.sportGeneral = sportGeneral;
	}

	public int getSportHighlight() {
		return sportHighlight;
	}

	public void setSportHighlight(int sportHighlight) {
		this.sportHighlight = sportHighlight;
	}

	public int getShowTastyKeyword() {
		return showTastyKeyword;
	}

	public void setShowTastyKeyword(int showTastyKeyword) {
		this.showTastyKeyword = showTastyKeyword;
	}

	public int getShowShoppingSearch1() {
		return showShoppingSearch1;
	}

	public void setShowShoppingSearch1(int showShoppingSearch1) {
		this.showShoppingSearch1 = showShoppingSearch1;
	}

	public int getShowShoppingSearch2() {
		return showShoppingSearch2;
	}

	public void setShowShoppingSearch2(int showShoppingSearch2) {
		this.showShoppingSearch2 = showShoppingSearch2;
	}

	public int getShowShoppingSearch3() {
		return showShoppingSearch3;
	}

	public void setShowShoppingSearch3(int showShoppingSearch3) {
		this.showShoppingSearch3 = showShoppingSearch3;
	}

	public int getShowShoppingReview() {
		return showShoppingReview;
	}

	public void setShowShoppingReview(int showShoppingReview) {
		this.showShoppingReview = showShoppingReview;
	}

	public int getShowUserSearch1() {
		return showUserSearch1;
	}

	public void setShowUserSearch1(int showUserSearch1) {
		this.showUserSearch1 = showUserSearch1;
	}

	public int getShowUserSearch2() {
		return showUserSearch2;
	}

	public void setShowUserSearch2(int showUserSearch2) {
		this.showUserSearch2 = showUserSearch2;
	}

	public int getShowUserSearch3() {
		return showUserSearch3;
	}

	public void setShowUserSearch3(int showUserSearch3) {
		this.showUserSearch3 = showUserSearch3;
	}

	public int getShowUserVideo1() {
		return showUserVideo1;
	}

	public void setShowUserVideo1(int showUserVideo1) {
		this.showUserVideo1 = showUserVideo1;
	}

	public int getShowUserVideo2() {
		return showUserVideo2;
	}

	public void setShowUserVideo2(int showUserVideo2) {
		this.showUserVideo2 = showUserVideo2;
	}

	public String getTastyKeyword() {
		return tastyKeyword;
	}

	public void setTastyKeyword(String tastyKeyword) {
		this.tastyKeyword = tastyKeyword;
	}

	public String getShoppingSearch1() {
		return shoppingSearch1;
	}

	public void setShoppingSearch1(String shoppingSearch1) {
		this.shoppingSearch1 = shoppingSearch1;
	}

	public String getShoppingSearch2() {
		return shoppingSearch2;
	}

	public void setShoppingSearch2(String shoppingSearch2) {
		this.shoppingSearch2 = shoppingSearch2;
	}

	public String getShoppingSearch3() {
		return shoppingSearch3;
	}

	public void setShoppingSearch3(String shoppingSearch3) {
		this.shoppingSearch3 = shoppingSearch3;
	}

	public String getShoppingReview() {
		return shoppingReview;
	}

	public void setShoppingReview(String shoppingReview) {
		this.shoppingReview = shoppingReview;
	}

	public String getUserSearch1() {
		return userSearch1;
	}

	public void setUserSearch1(String userSearch1) {
		this.userSearch1 = userSearch1;
	}

	public String getUserSearch2() {
		return userSearch2;
	}

	public void setUserSearch2(String userSearch2) {
		this.userSearch2 = userSearch2;
	}

	public String getUserSearch3() {
		return userSearch3;
	}

	public void setUserSearch3(String userSearch3) {
		this.userSearch3 = userSearch3;
	}

	public String getUserVideo1() {
		return userVideo1;
	}

	public void setUserVideo1(String userVideo1) {
		this.userVideo1 = userVideo1;
	}

	public String getUserVideo2() {
		return userVideo2;
	}

	public void setUserVideo2(String userVideo2) {
		this.userVideo2 = userVideo2;
	}

	@Override
	public String toString() {
		return "ContentSetting [userNo=" + userNo + ", contentSettingNo=" + contentSettingNo + ", userKeywordNo="
				+ userKeywordNo + ", shoppingKeywordNo=" + shoppingKeywordNo + ", sortSectionNo=" + sortSectionNo
				+ ", movieBoxOffice=" + movieBoxOffice + ", movieNew=" + movieNew + ", movieUpcoming=" + movieUpcoming
				+ ", movieReview=" + movieReview + ", movieTrailer=" + movieTrailer + ", soccer=" + soccer
				+ ", overseaSoccer=" + overseaSoccer + ", baseball=" + baseball + ", overseaBaseball=" + overseaBaseball
				+ ", basketball=" + basketball + ", sportGeneral=" + sportGeneral + ", sportHighlight=" + sportHighlight
				+ ", showTastyKeyword=" + showTastyKeyword + ", showShoppingSearch1=" + showShoppingSearch1
				+ ", showShoppingSearch2=" + showShoppingSearch2 + ", showShoppingSearch3=" + showShoppingSearch3
				+ ", showShoppingReview=" + showShoppingReview + ", showUserSearch1=" + showUserSearch1
				+ ", showUserSearch2=" + showUserSearch2 + ", showUserSearch3=" + showUserSearch3 + ", showUserVideo1="
				+ showUserVideo1 + ", showUserVideo2=" + showUserVideo2 + ", tastyKeyword=" + tastyKeyword
				+ ", shoppingSearch1=" + shoppingSearch1 + ", shoppingSearch2=" + shoppingSearch2 + ", shoppingSearch3="
				+ shoppingSearch3 + ", shoppingReview=" + shoppingReview + ", userSearch1=" + userSearch1
				+ ", userSearch2=" + userSearch2 + ", userSearch3=" + userSearch3 + ", userVideo1=" + userVideo1
				+ ", userVideo2=" + userVideo2 + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + baseball;
		result = prime * result + basketball;
		result = prime * result + contentSettingNo;
		result = prime * result + movieBoxOffice;
		result = prime * result + movieNew;
		result = prime * result + movieReview;
		result = prime * result + movieTrailer;
		result = prime * result + movieUpcoming;
		result = prime * result + overseaBaseball;
		result = prime * result + overseaSoccer;
		result = prime * result + shoppingKeywordNo;
		result = prime * result + ((shoppingReview == null) ? 0 : shoppingReview.hashCode());
		result = prime * result + ((shoppingSearch1 == null) ? 0 : shoppingSearch1.hashCode());
		result = prime * result + ((shoppingSearch2 == null) ? 0 : shoppingSearch2.hashCode());
		result = prime * result + ((shoppingSearch3 == null) ? 0 : shoppingSearch3.hashCode());
		result = prime * result + showShoppingReview;
		result = prime * result + showShoppingSearch1;
		result = prime * result + showShoppingSearch2;
		result = prime * result + showShoppingSearch3;
		result = prime * result + showTastyKeyword;
		result = prime * result + showUserSearch1;
		result = prime * result + showUserSearch2;
		result = prime * result + showUserSearch3;
		result = prime * result + showUserVideo1;
		result = prime * result + showUserVideo2;
		result = prime * result + soccer;
		result = prime * result + sortSectionNo;
		result = prime * result + sportGeneral;
		result = prime * result + sportHighlight;
		result = prime * result + ((tastyKeyword == null) ? 0 : tastyKeyword.hashCode());
		result = prime * result + userKeywordNo;
		result = prime * result + userNo;
		result = prime * result + ((userSearch1 == null) ? 0 : userSearch1.hashCode());
		result = prime * result + ((userSearch2 == null) ? 0 : userSearch2.hashCode());
		result = prime * result + ((userSearch3 == null) ? 0 : userSearch3.hashCode());
		result = prime * result + ((userVideo1 == null) ? 0 : userVideo1.hashCode());
		result = prime * result + ((userVideo2 == null) ? 0 : userVideo2.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof ContentSetting))
			return false;
		ContentSetting other = (ContentSetting) obj;
		if (baseball != other.baseball)
			return false;
		if (basketball != other.basketball)
			return false;
		if (contentSettingNo != other.contentSettingNo)
			return false;
		if (movieBoxOffice != other.movieBoxOffice)
			return false;
		if (movieNew != other.movieNew)
			return false;
		if (movieReview != other.movieReview)
			return false;
		if (movieTrailer != other.movieTrailer)
			return false;
		if (movieUpcoming != other.movieUpcoming)
			return false;
		if (overseaBaseball != other.overseaBaseball)
			return false;
		if (overseaSoccer != other.overseaSoccer)
			return false;
		if (shoppingKeywordNo != other.shoppingKeywordNo)
			return false;
		if (shoppingReview == null) {
			if (other.shoppingReview != null)
				return false;
		} else if (!shoppingReview.equals(other.shoppingReview))
			return false;
		if (shoppingSearch1 == null) {
			if (other.shoppingSearch1 != null)
				return false;
		} else if (!shoppingSearch1.equals(other.shoppingSearch1))
			return false;
		if (shoppingSearch2 == null) {
			if (other.shoppingSearch2 != null)
				return false;
		} else if (!shoppingSearch2.equals(other.shoppingSearch2))
			return false;
		if (shoppingSearch3 == null) {
			if (other.shoppingSearch3 != null)
				return false;
		} else if (!shoppingSearch3.equals(other.shoppingSearch3))
			return false;
		if (showShoppingReview != other.showShoppingReview)
			return false;
		if (showShoppingSearch1 != other.showShoppingSearch1)
			return false;
		if (showShoppingSearch2 != other.showShoppingSearch2)
			return false;
		if (showShoppingSearch3 != other.showShoppingSearch3)
			return false;
		if (showTastyKeyword != other.showTastyKeyword)
			return false;
		if (showUserSearch1 != other.showUserSearch1)
			return false;
		if (showUserSearch2 != other.showUserSearch2)
			return false;
		if (showUserSearch3 != other.showUserSearch3)
			return false;
		if (showUserVideo1 != other.showUserVideo1)
			return false;
		if (showUserVideo2 != other.showUserVideo2)
			return false;
		if (soccer != other.soccer)
			return false;
		if (sortSectionNo != other.sortSectionNo)
			return false;
		if (sportGeneral != other.sportGeneral)
			return false;
		if (sportHighlight != other.sportHighlight)
			return false;
		if (tastyKeyword == null) {
			if (other.tastyKeyword != null)
				return false;
		} else if (!tastyKeyword.equals(other.tastyKeyword))
			return false;
		if (userKeywordNo != other.userKeywordNo)
			return false;
		if (userNo != other.userNo)
			return false;
		if (userSearch1 == null) {
			if (other.userSearch1 != null)
				return false;
		} else if (!userSearch1.equals(other.userSearch1))
			return false;
		if (userSearch2 == null) {
			if (other.userSearch2 != null)
				return false;
		} else if (!userSearch2.equals(other.userSearch2))
			return false;
		if (userSearch3 == null) {
			if (other.userSearch3 != null)
				return false;
		} else if (!userSearch3.equals(other.userSearch3))
			return false;
		if (userVideo1 == null) {
			if (other.userVideo1 != null)
				return false;
		} else if (!userVideo1.equals(other.userVideo1))
			return false;
		if (userVideo2 == null) {
			if (other.userVideo2 != null)
				return false;
		} else if (!userVideo2.equals(other.userVideo2))
			return false;
		return true;
	}
	
	public Map<Integer, String> getContentSettingMap() throws IllegalArgumentException, IllegalAccessException {
		Map<Integer, String> map = new HashMap<Integer, String>();
		
		for (Field field:this.getClass().getDeclaredFields()) {
			if (!field.getName().contains("No") && field.getType().equals(Integer.TYPE)) {
				map.put((Integer)field.get(this), field.getName());
			}
		}
		return map;
	}
}
