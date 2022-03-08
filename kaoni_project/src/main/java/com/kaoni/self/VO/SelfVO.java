package com.kaoni.self.VO;

public class SelfVO {
private String emnum;
private String selfcheck1;
private String selfcheck2;
private String selfcheck3;
private String selfcheck4;
private String selfcheck5;
private String selfcheck6;
private String insertdate;
private String deleteyn;
private String scnt;
public SelfVO() {}

public SelfVO(String emnum, String selfcheck1, String selfcheck2, String selfcheck3,
		String selfcheck4, String selfcheck5, String selfcheck6, String insertdate, String deleteyn, String scnt) {
	
	this.emnum = emnum;
	this.selfcheck1 = selfcheck1;
	this.selfcheck2 = selfcheck2;
	this.selfcheck3 = selfcheck3;
	this.selfcheck4 = selfcheck4;
	this.selfcheck5 = selfcheck5;
	this.selfcheck6 = selfcheck6;
	this.insertdate = insertdate;
	this.deleteyn = deleteyn;
	this.scnt = scnt;
}

public String getEmnum() {
	return emnum;
}
public void setEmnum(String emnum) {
	this.emnum = emnum;
}
public String getSelfcheck1() {
	return selfcheck1;
}
public void setSelfcheck1(String selfcheck1) {
	this.selfcheck1 = selfcheck1;
}
public String getSelfcheck2() {
	return selfcheck2;
}
public void setSelfcheck2(String selfcheck2) {
	this.selfcheck2 = selfcheck2;
}
public String getSelfcheck3() {
	return selfcheck3;
}
public void setSelfcheck3(String selfcheck3) {
	this.selfcheck3 = selfcheck3;
}
public String getSelfcheck4() {
	return selfcheck4;
}
public void setSelfcheck4(String selfcheck4) {
	this.selfcheck4 = selfcheck4;
}
public String getSelfcheck5() {
	return selfcheck5;
}
public void setSelfcheck5(String selfcheck5) {
	this.selfcheck5 = selfcheck5;
}
public String getSelfcheck6() {
	return selfcheck6;
}
public void setSelfcheck6(String selfcheck6) {
	this.selfcheck6 = selfcheck6;
}
public String getInsertdate() {
	return insertdate;
}
public void setInsertdate(String insertdate) {
	this.insertdate = insertdate;
}
public String getDeleteyn() {
	return deleteyn;
}
public void setDeleteyn(String deleteyn) {
	this.deleteyn = deleteyn;
}

public String getscnt() {
	return scnt;
}

public void setscnt(String scnt) {
	this.scnt = scnt;
}



	
}
