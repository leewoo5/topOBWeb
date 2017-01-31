package org.zerock.dto;


public class OBFinanceDTO_inout {
  	
  private int bno;
  private String title;
  private String regdate;
  private int money;
  private String content;
  private int code;
  private String detail;
  private String receipt;
  
public int getBno() {
	return bno;
}
public void setBno(int bno) {
	this.bno = bno;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getRegdate() {
	return regdate;
}
public void setRegdate(String regdate) {
	this.regdate = regdate;
}
public int getMoney() {
	return money;
}
public void setMoney(int money) {
	this.money = money;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public int getCode() {
	return code;
}
public void setCode(int code) {
	this.code = code;
}
public String getDetail() {
	return detail;
}
public void setDetail(String detail) {
	this.detail = detail;
}
public String getReceipt() {
	return receipt;
}
public void setReceipt(String receipt) {
	this.receipt = receipt;
}
@Override
public String toString() {
	return "OBFinance_inout [bno=" + bno + ", title=" + title + ", regdate=" + regdate + ", money=" + money
			+ ", content=" + content + ", code=" + code + ", detail=" + detail + ", receipt=" + receipt + "]";
}
  
}
  
