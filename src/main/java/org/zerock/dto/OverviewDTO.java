package org.zerock.dto;

public class OverviewDTO {
	int members;
	int business;
	int etc;
	int male;
	int femail;
	int prize;
	
	public int getMembers() {
		return members;
	}
	public void setMembers(int members) {
		this.members = members;
	}
	public int getBusiness() {
		return business;
	}
	public void setBusiness(int business) {
		this.business = business;
	}
	public int getEtc() {
		return etc;
	}
	public void setEtc(int etc) {
		this.etc = etc;
	}
	public int getMale() {
		return male;
	}
	public void setMale(int male) {
		this.male = male;
	}
	public int getFemail() {
		return femail;
	}
	public void setFemail(int femail) {
		this.femail = femail;
	}
	public int getPrize() {
		return prize;
	}
	public void setPrize(int prize) {
		this.prize = prize;
	}
	
	@Override
	public String toString() {
		return "Overview [members=" + members + ", business=" + business + ", etc=" + etc + ", male=" + male
				+ ", femail=" + femail + ", prize=" + prize + "]";
	}
}
