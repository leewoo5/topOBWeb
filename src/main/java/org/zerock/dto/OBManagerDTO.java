package org.zerock.dto;

public class OBManagerDTO {
  	
  private String presidentName;
  private String presidentPhone;
  private String presidentStage;
  private String vicePresidentName;
  private String vicePresidentPhone;
  private String vicePresidentStage;
public String getPresidentName() {
	return presidentName;
}
public void setPresidentName(String presidentName) {
	this.presidentName = presidentName;
}
public String getPresidentPhone() {
	return presidentPhone;
}
public void setPresidentPhone(String presidentPhone) {
	this.presidentPhone = presidentPhone;
}
public String getPresidentStage() {
	return presidentStage;
}
public void setPresidentStage(String presidentStage) {
	this.presidentStage = presidentStage;
}
public String getVicePresidentName() {
	return vicePresidentName;
}
public void setVicePresidentName(String vicePresidentName) {
	this.vicePresidentName = vicePresidentName;
}
public String getVicePresidentPhone() {
	return vicePresidentPhone;
}
public void setVicePresidentPhone(String vicePresidentPhone) {
	this.vicePresidentPhone = vicePresidentPhone;
}
public String getVicePresidentStage() {
	return vicePresidentStage;
}
public void setVicePresidentStage(String vicePresidentStage) {
	this.vicePresidentStage = vicePresidentStage;
}
@Override
public String toString() {
	return "OBManagerDTO [presidentName=" + presidentName + ", presidentPhone=" + presidentPhone + ", presidentStage="
			+ presidentStage + ", vicePresidentName=" + vicePresidentName + ", vicePresidentPhone=" + vicePresidentPhone
			+ ", vicePresidentStage=" + vicePresidentStage + "]";
}

}
  
