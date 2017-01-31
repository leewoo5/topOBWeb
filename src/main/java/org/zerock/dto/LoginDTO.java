package org.zerock.dto;

public class LoginDTO {
	
	private String uid;
	private String upw;
	private String name;
	private Boolean useCookie;
	private String rights;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Boolean getUseCookie() {
		return useCookie;
	}
	public void setUseCookie(Boolean useCookie) {
		this.useCookie = useCookie;
	}
	public String getRights() {
		return rights;
	}
	public void setRights(String rights) {
		this.rights = rights;
	}
	@Override
	public String toString() {
		return "LoginDTO [uid=" + uid + ", upw=" + upw + ", name=" + name + ", useCookie=" + useCookie + ", rights="
				+ rights + "]";
	}
	
}
