package org.zerock.domain;

public class UserUpdateVO {
	
  
  private String uid;
  private String upwNew1;
  private String upwNew2;
  private String nickName;
  private String email;
  

  public String getUpwNew1() {
	return upwNew1;
}

public void setUpwNew1(String upwNew1) {
	this.upwNew1 = upwNew1;
}

public String getUpwNew2() {
	return upwNew2;
}

public void setUpwNew2(String upwNew2) {
	this.upwNew2 = upwNew2;
}

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


  public String getNickName() {
    return nickName;
  }

  public void setNickName(String nickName) {
    this.nickName = nickName;
  }

  @Override
  public String toString() {
    return "User [uid=" + uid + ", upwNew1=" + upwNew1 + ", upwNew2=" + upwNew2 + ", nickName=" + nickName + ", email=" + email + "]";
  }
}
