package com.kaoni.Board.VO;

public class BoardVO {

	String emnum;
	
	String title;
	String content;
	String regdate;
	String updatedate;
	int nbo;
	int impor;
	
	public BoardVO() {
	}
	public BoardVO(String emnum, int nbo, String title, String content, String regdate, String updatedate,
			int impor) {
		this.emnum = emnum;
		this.nbo = nbo;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.updatedate = updatedate;
		this.impor = impor;
	}
	public String getEmnum() {
		return emnum;
	}
	public void setEmnum(String emnum) {
		this.emnum = emnum;
	}
	public int getNbo() {
		return nbo;
	}
	public void setNbo(int nbo) {
		this.nbo = nbo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
	public int getImpor() {
		return impor;
	}
	public void setImpor(int impor) {
		this.impor = impor;
	}
	
	
	
	
}
