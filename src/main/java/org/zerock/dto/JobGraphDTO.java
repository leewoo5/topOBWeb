package org.zerock.dto;

public class JobGraphDTO {
	
	private int marketing;
	private int finance;
	private int hr;
	private int ad;
	private int sales;
	private int etc;
	
	public int getMarketing() {
		return marketing;
	}
	public void setMarketing(int marketing) {
		this.marketing = marketing;
	}
	public int getFinance() {
		return finance;
	}
	public void setFinance(int finance) {
		this.finance = finance;
	}
	public int getHr() {
		return hr;
	}
	public void setHr(int hr) {
		this.hr = hr;
	}
	public int getAd() {
		return ad;
	}
	public void setAd(int ad) {
		this.ad = ad;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public int getEtc() {
		return etc;
	}
	public void setEtc(int etc) {
		this.etc = etc;
	}
	@Override
	public String toString() {
		return "JobGraphDTO [marketing=" + marketing + ", finance=" + finance + ", hr=" + hr + ", ad=" + ad + ", sales="
				+ sales + ", etc=" + etc + "]";
	}
	
	
}
