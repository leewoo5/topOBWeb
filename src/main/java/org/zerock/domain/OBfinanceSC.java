package org.zerock.domain;

public class OBfinanceSC extends Criteria{

	private String searchType;
	private String keyword;
	private String startDate;
	private String endDate;
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	@Override
	public String toString() {
		return "OBfinanceSC [searchType=" + searchType + ", keyword=" + keyword + ", startDate=" + startDate
				+ ", endDate=" + endDate + "]";
	}
}


