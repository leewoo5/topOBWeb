package org.zerock.domain;

import java.util.Date;

public class Main {
  	
  private String introtitle;
  private String introcontent;
  private String introwriter;
  private String contactemail;
  private Date regdate;
  
public String getIntrotitle() {
	return introtitle;
}
public void setIntrotitle(String introtitle) {
	this.introtitle = introtitle;
}
public String getIntrocontent() {
	return introcontent;
}
public void setIntrocontent(String introcontent) {
	this.introcontent = introcontent;
}
public String getIntrowriter() {
	return introwriter;
}
public void setIntrowriter(String introwriter) {
	this.introwriter = introwriter;
}
public String getContactemail() {
	return contactemail;
}
public void setContactemail(String contactemail) {
	this.contactemail = contactemail;
}
public Date getRegdate() {
	return regdate;
}
public void setRegdate(Date regdate) {
	this.regdate = regdate;
}
@Override
public String toString() {
	return "Main [introtitle=" + introtitle + ", introcontent=" + introcontent + ", introwriter=" + introwriter
			+ ", contactemail=" + contactemail + ", regdate=" + regdate + "]";
}
  
}