package com.kaoni.main.VO;

public class MainVO {
	private int allmember;//총확진자
	private int nowmember;//현재확진자
	private int isolemember;//자가격리자
	private int member;//근무원수 
	private String insertdate;//입력 날짜
	private String mainnum;
	
	public MainVO() {}
	
	public MainVO(int allmember, int nowmember, int isolemember, int member, String insertdate, String mainnum) {
		
		this.allmember = allmember;
		this.nowmember = nowmember;
		this.isolemember = isolemember;
		this.member = member;
		this.insertdate = insertdate;
		this.mainnum = mainnum;
	}
	
	public int getAllmember() {
		return allmember;
	}
	public void setAllmember(int allmember) {
		this.allmember = allmember;
	}
	public int getNowmember() {
		return nowmember;
	}
	public void setNowmember(int nowmember) {
		this.nowmember = nowmember;
	}
	public int getIsolemember() {
		return isolemember;
	}
	public void setIsolemember(int isolemember) {
		this.isolemember = isolemember;
	}
	public int getMember() {
		return member;
	}
	public void setMember(int member) {
		this.member = member;
	}
	public String getInsertdate() {
		return insertdate;
	}
	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}
	public String getMainnum() {
		return mainnum;
	}
	public void setMainnum(String mainnum) {
		this.mainnum = mainnum;
	}
	
}