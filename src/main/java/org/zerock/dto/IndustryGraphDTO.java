package org.zerock.dto;

public class IndustryGraphDTO {
	
	private int beauty;
	private int food;
	private int it;
	private int distribution;
	private int ad;
	private int car;
	private int etc;
	
	public int getBeauty() {
		return beauty;
	}
	public void setBeauty(int beauty) {
		this.beauty = beauty;
	}
	public int getFood() {
		return food;
	}
	public void setFood(int food) {
		this.food = food;
	}
	public int getIt() {
		return it;
	}
	public void setIt(int it) {
		this.it = it;
	}
	public int getDistribution() {
		return distribution;
	}
	public void setDistribution(int distribution) {
		this.distribution = distribution;
	}
	public int getAd() {
		return ad;
	}
	public void setAd(int ad) {
		this.ad = ad;
	}
	public int getCar() {
		return car;
	}
	public void setCar(int car) {
		this.car = car;
	}
	public int getEtc() {
		return etc;
	}
	public void setEtc(int etc) {
		this.etc = etc;
	}
	@Override
	public String toString() {
		return "IndustryGraphDTO [beauty=" + beauty + ", food=" + food + ", it=" + it + ", distribution=" + distribution
				+ ", ad=" + ad + ", car=" + car + ", etc=" + etc + "]";
	}
	
	
	
}
