package org.zerock.domain;

public class UserRegisterVO {
	
  
  private String uid;
  private String upw;
  private String nickName;
  private String email;

  public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getUid() {
    return uid;
  }

  public void setUid(String uid) {
    this.uid = uid;
  }

  public String getUpw() {
    return upw;
  }

  public void setUpw(String upw) {
    this.upw = upw;
  }

  public String getNickName() {
    return nickName;
  }

  public void setNickName(String nickName) {
    this.nickName = nickName;
  }

  @Override
  public String toString() {
    return "User [uid=" + uid + ", upw=" + upw + ", nickName=" + nickName + ", email=" + email + "]";
  }
}
